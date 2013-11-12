package com.bm.gjb5.dao;

import static cn.org.rapid_framework.util.ObjectUtils.isNotEmpty;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javacommon.base.BaseHibernateDao;
import javacommon.gather.bean.Pageinfo;

import org.apache.lucene.queryparser.classic.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.search.PageinfoIndexUtils;
import com.bm.gjb5.vo.query.PageinfoQuery;

@Repository
@SuppressWarnings("all")
public class PageinfoDao extends BaseHibernateDao<Pageinfo, java.lang.String> {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(PageinfoDao.class);

	public Class getEntityClass() {
		return Pageinfo.class;
	}

	// add by zhengwei 20130925--------修改为lucene搜索
	public Page findPage(PageinfoQuery query) {
		// XsqlBuilder syntax,please see
		// http://code.google.com/p/rapid-xsqlbuilder
		// [column]为字符串拼接, {column}为使用占位符.
		// [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接
		// [column] 为PageRequest的属性
		String sql = "select t from Pageinfo t where 1=1 "
				+ "/~ and t.title = {title} ~/" + "/~ and t.link = {link} ~/"
				+ "/~ and t.timeline >= {timelineBegin} ~/"
				+ "/~ and t.timeline <= {timelineEnd} ~/"
				+ "/~ and t.content = {content} ~/"
				+ "/~ and t.author = {author} ~/"
				+ "/~ and t.source = {source} ~/"
				+ "/~ and t.summary = {summary} ~/"
				+ "/~ and t.siteId = {siteId} ~/"
				+ "/~ and t.optime >= {optimeBegin} ~/"
				+ "/~ and t.optime <= {optimeEnd} ~/"
				+ "/~ order by [sortColumns] ~/";

		// 生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
		StringBuilder luceneQuery = new StringBuilder("");

		if (isNotEmpty(query.getKeyWords())) {
			String key = query.getKeyWords();
					
			if(key.contains(" ")){
				StringBuilder keyString = new StringBuilder("(");
				for (String t:key.split("\\s+")) {
					keyString.append(" +\"").append(t).append("\"");
				}
				keyString.append(")");
				key = keyString.toString();
			}else {
				key="\""+key+"\"";
			}
			luceneQuery.append("(").append("title:").append(key)
					.append(" OR ").append("content:").append(key)
					.append(" OR ").append("summary:").append(key)
					.append(")");
		}
		if (isNotEmpty(query.getTimelineBegin())
				&& isNotEmpty(query.getTimelineEnd())) {
			luceneQuery.append(" AND timeline:[")
					.append(query.getTimelineBegin().getTime()).append(" TO ")
					.append(query.getTimelineEnd().getTime()).append("]");
		}
		if (isNotEmpty(query.getOptimeBegin())
				&& isNotEmpty(query.getOptimeEnd())) {
			luceneQuery.append(" AND optime:[")
					.append(query.getOptimeBegin().getTime()).append(" TO ")
					.append(query.getOptimeEnd().getTime()).append("]");
		}
		LOGGER.info("[luceneQuery] " + luceneQuery);
		if (StringUtils.hasLength(luceneQuery
				.toString())) {
			try {
				List<String> ids = PageinfoIndexUtils.search(luceneQuery
						.toString());//最多100条
				Page page = new Page(query, ids.size());
				// List<Pageinfo> pageinfos = new ArrayList<Pageinfo>();
				StringBuilder sb = new StringBuilder();
				int _min = Math.min(query.getPageNumber()*query.getPageSize(), ids.size());
				for (int i = (query.getPageNumber()-1)*query.getPageSize(); i < _min; i++) {
					String id =  ids.get(i);
					sb.append("'").append(id).append("'").append(",");
				}

				String hql = "from Pageinfo where id in("
						+ sb.deleteCharAt(sb.length() - 1).toString() + ")";
				List<Pageinfo> pageinfos = queryForList(hql);
				page.setResult(pageinfos);
				return page;
			} catch (ParseException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return pageQuery(sql, query);
	}

}
