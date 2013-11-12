package javacommon.base;

import static cn.org.rapid_framework.util.SqlRemoveUtils.removeFetchKeyword;
import static cn.org.rapid_framework.util.SqlRemoveUtils.removeOrders;
import static cn.org.rapid_framework.util.SqlRemoveUtils.removeSelect;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javacommon.xsqlbuilder.SafeSqlProcesser;
import javacommon.xsqlbuilder.SafeSqlProcesserFactory;
import javacommon.xsqlbuilder.XsqlBuilder;
import javacommon.xsqlbuilder.XsqlBuilder.XsqlFilterResult;
import javacommon.xsqlbuilder.safesql.DirectReturnSafeSqlProcesser;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.Dialect;



import org.hibernate.internal.SessionFactoryImpl;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.orm.hibernate4.SessionHolder;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.StringUtils;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.page.PageRequest;
import cn.org.rapid_framework.util.holder.ApplicationContextHolder;

/**
 * 通用的Hibernate Dao，其中值得注意的是<br>
 * public Page<E> findAll(final PageRequest pageRequest)<br>
 * 参数为分页请求，封装了页码、每页条目数、排序列的信息<br>
 * 返回值为Page对象，封装了一个“页”的数据及分页的相关信息，获得数据用List list = page.getResult();
 * @author zhengwei lastmodified 2013年9月6日
 * 
 * @param <E>
 *            实体类型
 * @param <PK>
 *            主键值
 */
@SuppressWarnings("all")
public abstract class BaseHibernateDao<E, PK extends Serializable> implements
		EntityDao<E, PK> {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * Logger for subclass
	 */
	protected Log log = LogFactory.getLog(getClass());

	Session getSession() {
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
			SessionHolder sessionHolder = new SessionHolder(session);
			TransactionSynchronizationManager.bindResource(sessionFactory,
					sessionHolder);
		}
		return session;
	}

	public long queryForLong(final String queryString) {
		return queryForLong(queryString, new Object[] {});
	}

	public long queryForLong(final String queryString, Object value) {
		return queryForLong(queryString, new Object[] { value });
	}

	public long queryForLong(final String queryString, Object[] values) {
		Query q= getSession().createQuery(queryString);
		for (int i = 0; i < values.length; i++) {
			q.setParameter(i, values[i]);
			
		}
		return (Long) q.uniqueResult();
	}
	public List<E> queryForList(final String queryString, Object... values) {
		Query q= getSession().createQuery(queryString);
		for (int i = 0; i < values.length; i++) {
			q.setParameter(i, values[i]);
			
		}
		return q.list();
	}
	/**
	 * 得到全部数据,但执行分页
	 * 
	 * @param pageRequest
	 * @return
	 */
	public Page<E> findAll(final PageRequest pageRequest) {
		Session session = getSession();
		StringBuffer queryString = new StringBuffer(" FROM ")
				.append(getEntityClass().getSimpleName());
		String countQueryString = "SELECT count(*) " + queryString.toString();
		if (StringUtils.hasText(pageRequest.getSortColumns())) {
			queryString.append(" ORDER BY " + pageRequest.getSortColumns());
		}

		Query query = session.createQuery(queryString.toString());
		Query countQuery = session.createQuery(countQueryString);
		return (Page<E>) PageQueryUtils.executeQueryForPage(pageRequest, query,
				countQuery);

	}

	public Page pageQuery(final String sql, final PageRequest pageRequest) {
		final String countQuery = "select count(*) "
				+ removeSelect(removeFetchKeyword((sql)));
		return pageQuery(sql, countQuery, pageRequest);
	}

	public Page pageQuery(final String sql, String countQuery,
			final PageRequest pageRequest) {
		Map otherFilters = new HashMap(1);
		otherFilters.put("sortColumns", pageRequest.getSortColumns());

		XsqlBuilder builder = getXsqlBuilder();

		// 混合使用otherFilters与pageRequest为一个filters使用
		XsqlFilterResult queryXsqlResult = builder.generateHql(sql,
				otherFilters, pageRequest);
		XsqlFilterResult countQueryXsqlResult = builder.generateHql(countQuery,
				otherFilters, pageRequest);

		return PageQueryUtils.pageQuery(pageRequest,
				queryXsqlResult, countQueryXsqlResult,this);
	}

	protected XsqlBuilder getXsqlBuilder() {
		SessionFactoryImpl sf = (SessionFactoryImpl)sessionFactory;
		Dialect dialect = sf.getDialect();

		// or SafeSqlProcesserFactory.getMysql();
		SafeSqlProcesser safeSqlProcesser = SafeSqlProcesserFactory
				.getFromCacheByHibernateDialect(dialect);
		XsqlBuilder builder = new XsqlBuilder(safeSqlProcesser);

		if (builder.getSafeSqlProcesser().getClass() == DirectReturnSafeSqlProcesser.class) {
			System.err
					.println(BaseHibernateDao.class.getSimpleName()
							+ ".getXsqlBuilder(): 故意报错,你未开启Sql安全过滤,单引号等转义字符在拼接sql时需要转义,不然会导致Sql注入攻击的安全问题，请修改源码使用new XsqlBuilder(SafeSqlProcesserFactory.getDataBaseName())开启安全过滤");
		}
		return builder;
	}

	@SuppressWarnings("unchecked")
	static class PageQueryUtils {
		@SuppressWarnings("rawtypes")
		private static Page pageQuery(final PageRequest pageRequest,
				final XsqlFilterResult queryXsqlResult,
				final XsqlFilterResult countQueryXsqlResult,BaseHibernateDao dao) {
			Session session = dao.getSession();

					Query query = setQueryParameters(
							session.createQuery(queryXsqlResult.getXsql()),
							pageRequest);
					Query countQuery = setQueryParameters(session
							.createQuery(removeOrders(countQueryXsqlResult
									.getXsql())), pageRequest);

					return executeQueryForPage(pageRequest, query, countQuery);
				
		}

		private static Page executeQueryForPage(
				final PageRequest pageRequest, Query query, Query countQuery) {
			Page page = new Page(pageRequest,
					((Number) countQuery.uniqueResult()).intValue());
			if (page.getTotalCount() <= 0) {
				page.setResult(new ArrayList(0));
			} else {
				page.setResult(query.setFirstResult(page.getFirstResult())
						.setMaxResults(page.getPageSize()).list());
			}
			return page;
		}

		public static Query setQueryParameters(Query q, Object params) {
			q.setProperties(params);
			return q;
		}

		public static Query setQueryParameters(Query q, Map params) {
			q.setProperties(params);
			return q;
		}
	}

	public Serializable save(E entity) {
		Serializable id = getSession().save(entity);
		return id;
	}

	public List<E> findAll() {
		return getSession().createCriteria(getEntityClass()).list();
	}

	public E getById(PK id) {
		return (E) getSession().get(getEntityClass(), id);
	}

	public void delete(Object entity) {
		getSession().delete(entity);
	}

	public void delete(Serializable entity) {
		getSession().delete(entity);
	}

	public void deleteById(PK id) {
		Object entity = getById(id);
		if (entity == null) {
			return;
		}
		getSession().delete(entity);
	}

	public void update(E entity) {
		getSession().update(entity);
	}

	public void saveOrUpdate(E entity) {

		getSession().saveOrUpdate(entity);
	}

	public void refresh(Object entity) {
		getSession().refresh(entity);
	}

	public void flush() {
		getSession().flush();
	}

	public void evict(Object entity) {
		getSession().evict(entity);
	}

	public void saveAll(Collection<E> entities) {
		for (Iterator<E> it = entities.iterator(); it.hasNext();) {
			save(it.next());
		}
	}

	public void deleteAll(Collection entities) {
		for (Object object : entities) {
			delete(entities);
		}
	}

	public E findByProperty(final String propertyName, final Object value) {

		return (E) getSession().createCriteria(getEntityClass())
				.add(Restrictions.eq(propertyName, value)).uniqueResult();

	}

	public List<E> findByProperties(final String[] propertyNames,
			final Object[] values) {
		Criteria criteria = getSession().createCriteria(getEntityClass());
		for (int i = 0; i < propertyNames.length; i++) {
			criteria.add(Restrictions.eq(propertyNames[i], values[i]));
		}
		return criteria.list();
	}

	public List<E> findAllBy(final String propertyName, final Object value) {
		return getSession().createCriteria(getEntityClass())
				.add(Restrictions.eq(propertyName, value)).list();
	}

	/**
	 * 判断对象某些属性的值在数据库中是否唯一.
	 * 
	 * @param uniquePropertyNames
	 *            在POJO里不能重复的属性列表,以逗号分割 如"name,loginid,password"
	 */
	public boolean isUnique(E entity, String uniquePropertyNames) {
		Assert.hasText(uniquePropertyNames);
		Criteria criteria = getSession().createCriteria(getEntityClass())
				.setProjection(Projections.rowCount());
		String[] nameList = uniquePropertyNames.split(",");
		try {
			// 循环加入唯一列
			for (int i = 0; i < nameList.length; i++) {
				criteria.add(Restrictions.eq(nameList[i],
						PropertyUtils.getProperty(entity, nameList[i])));
			}

			// 以下代码为了如果是update的情况,排除entity自身.

			String idName =sessionFactory.getClassMetadata(
					entity.getClass()).getIdentifierPropertyName();
			if (idName != null) {
				// 取得entity的主键值
				Serializable id = (Serializable) PropertyUtils.getProperty(
						entity, idName);

				// 如果id!=null,说明对象已存在,该操作为update,加入排除自身的判断
				if (id != null)
					criteria.add(Restrictions.not(Restrictions.eq(idName, id)));
			}
		} catch (Exception e) {
			ReflectionUtils.handleReflectionException(e);
		}
		return ((Number) criteria.uniqueResult()).intValue() == 0;
	}

	/**
	 * 获取持久化对象的类型
	 * @return
	 */
	public abstract Class getEntityClass();
}
