package com.bm.gjb5.dao;

import javacommon.base.BaseHibernateDao;

import org.springframework.stereotype.Repository;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.model.CommonDict;
import com.bm.gjb5.vo.query.CommonDictQuery;
/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Repository
@SuppressWarnings("all")
public class CommonDictDao extends BaseHibernateDao<CommonDict,java.lang.String>{

	public Class getEntityClass() {
		return CommonDict.class;
	}
	
	public Page findPage(CommonDictQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from CommonDict t where 1=1 "
			  	+ "/~ and t.tableName like '%[tableName]%' ~/"
			  	+ "/~ and t.fieldName like '%[fieldName]%' ~/"
			  	+ "/~ and t.fieldValue = {fieldValue} ~/"
			  	+ "/~ and t.text = {text} ~/"
			  	+ "/~ and t.descp = {descp} ~/"
				+ "/~ order by [sortColumns] ~/";

        
		return pageQuery(sql,query);
	}
	

}
