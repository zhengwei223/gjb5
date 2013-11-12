package javacommon.base;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;

/**
 * 
 * @author zhengwei lastmodified 2013年8月30日
 * 
 * @param <E>
 * @param <PK>
 */
@SuppressWarnings("all")
public abstract class BaseManager<E, PK extends Serializable> {

	protected Log log = LogFactory.getLog(getClass());

	protected abstract EntityDao getEntityDao();

	public E getById(PK id) throws DataAccessException {
		return (E) getEntityDao().getById(id);
	}

	public List<E> findAll() throws DataAccessException {
		return getEntityDao().findAll();
	}

	/** 根据id检查是否插入或是更新数据 */
	public void saveOrUpdate(E entity) throws DataAccessException {
		getEntityDao().saveOrUpdate(entity);
	}

	/** 插入数据 */
	public void save(E entity) throws DataAccessException {
		getEntityDao().save(entity);
	}

	public void removeById(PK id) throws DataAccessException {
		getEntityDao().deleteById(id);
	}

	public void update(E entity) throws DataAccessException {
		getEntityDao().update(entity);
	}

	public boolean isUnique(E entity, String uniquePropertyNames)
			throws DataAccessException {
		return getEntityDao().isUnique(entity, uniquePropertyNames);
	}

}
