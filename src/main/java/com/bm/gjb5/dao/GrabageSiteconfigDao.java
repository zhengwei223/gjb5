package com.bm.gjb5.dao;

import java.util.*;
import java.lang.reflect.*;

import javacommon.base.*;
import javacommon.gather.bean.GrabageSiteconfig;
import javacommon.util.*;
import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.service.*;
import com.bm.gjb5.vo.query.*;

import org.slf4j.*;

import static cn.org.rapid_framework.util.ObjectUtils.*;

import org.springframework.stereotype.Repository;

@Repository
public class GrabageSiteconfigDao extends BaseHibernateDao<GrabageSiteconfig,java.lang.String>{
	private static final Logger LOGGER = LoggerFactory.getLogger(GrabageSiteconfigDao.class);
	
	public Class getEntityClass() {
		return GrabageSiteconfig.class;
	}
	
	public Page findPage(GrabageSiteconfigQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from GrabageSiteconfig t where 1=1 "
			  	+ "/~ and t.advertPaths = {advertPaths} ~/"
			  	+ "/~ and t.author = {author} ~/"
			  	+ "/~ and t.content = {content} ~/"
			  	+ "/~ and t.forward = {forward} ~/"
			  	+ "/~ and t.link = {link} ~/"
			  	+ "/~ and t.pagecount = {pagecount} ~/"
			  	+ "/~ and t.source = {source} ~/"
			  	+ "/~ and t.splitpath = {splitpath} ~/"
			  	+ "/~ and t.summary = {summary} ~/"
			  	+ "/~ and t.timeline = {timeline} ~/"
			  	+ "/~ and t.title = {title} ~/"
			  	+ "/~ and t.usable = {usable} ~/"
			  	+ "/~ and t.xlink = {xlink} ~/"
			  	+ "/~ and t.keyword = {keyword} ~/"
			  	+ "/~ and t.name like '%[name]%' ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from GrabageSiteconfig t where 1=1 ");
        if(isNotEmpty(query.getId())) {
            sql2.append(" and  t.id = :id ");
        }
        if(isNotEmpty(query.getAdvertPaths())) {
            sql2.append(" and  t.advertPaths = :advertPaths ");
        }
        if(isNotEmpty(query.getAuthor())) {
            sql2.append(" and  t.author = :author ");
        }
        if(isNotEmpty(query.getContent())) {
            sql2.append(" and  t.content = :content ");
        }
        if(isNotEmpty(query.getForward())) {
            sql2.append(" and  t.forward = :forward ");
        }
        if(isNotEmpty(query.getLink())) {
            sql2.append(" and  t.link = :link ");
        }
        if(isNotEmpty(query.getPagecount())) {
            sql2.append(" and  t.pagecount = :pagecount ");
        }
        if(isNotEmpty(query.getSource())) {
            sql2.append(" and  t.source = :source ");
        }
        if(isNotEmpty(query.getSplitpath())) {
            sql2.append(" and  t.splitpath = :splitpath ");
        }
        if(isNotEmpty(query.getSummary())) {
            sql2.append(" and  t.summary = :summary ");
        }
        if(isNotEmpty(query.getTimeline())) {
            sql2.append(" and  t.timeline = :timeline ");
        }
        if(isNotEmpty(query.getTitle())) {
            sql2.append(" and  t.title = :title ");
        }
        if(isNotEmpty(query.getUsable())) {
            sql2.append(" and  t.usable = :usable ");
        }
        if(isNotEmpty(query.getXlink())) {
            sql2.append(" and  t.xlink = :xlink ");
        }
        if(isNotEmpty(query.getKeyword())) {
            sql2.append(" and  t.keyword = :keyword ");
        }
        if(isNotEmpty(query.getName())) {
            sql2.append(" and  t.name like :name ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
