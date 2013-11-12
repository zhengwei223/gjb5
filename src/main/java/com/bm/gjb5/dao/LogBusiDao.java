package com.bm.gjb5.dao;

import static cn.org.rapid_framework.util.ObjectUtils.isNotEmpty;
import javacommon.base.BaseHibernateDao;

import org.springframework.stereotype.Repository;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.model.LogBusi;
import com.bm.gjb5.vo.query.LogBusiQuery;

@Repository
public class LogBusiDao extends BaseHibernateDao<LogBusi,java.lang.String>{

	public Class getEntityClass() {
		return LogBusi.class;
	}
	
	public Page findPage(LogBusiQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from LogBusi t where 1=1 "
			  	+ "/~ and t.opType = {opType} ~/"
			  	+ "/~ and t.opUser = {opUser} ~/"
				+ "/~ and t.opTime >= {opTimeBegin} ~/"
				+ "/~ and t.opTime <= {opTimeEnd} ~/"
			  	+ "/~ and t.submodule = {submodule} ~/"
			  	+ "/~ and t.ip = {ip} ~/"
			  	+ "/~ and t.eqId = {eqId} ~/"
			  	+ "/~ and t.content = {content} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from LogBusi t where 1=1 ");
        if(isNotEmpty(query.getId())) {
            sql2.append(" and  t.id = :id ");
        }
        if(isNotEmpty(query.getOpType())) {
            sql2.append(" and  t.opType = :opType ");
        }
        if(isNotEmpty(query.getOpUser())) {
            sql2.append(" and  t.opUser = :opUser ");
        }
        if(isNotEmpty(query.getOpTimeBegin())) {
            sql2.append(" and  t.opTime >= :opTimeBegin ");
        }
        if(isNotEmpty(query.getOpTimeEnd())) {
            sql2.append(" and  t.opTime <= :opTimeEnd ");
        }
        if(isNotEmpty(query.getSubmodule())) {
            sql2.append(" and  t.submodule = :submodule ");
        }
        if(isNotEmpty(query.getIp())) {
            sql2.append(" and  t.ip = :ip ");
        }
        if(isNotEmpty(query.getEqId())) {
            sql2.append(" and  t.eqId = :eqId ");
        }
        if(isNotEmpty(query.getContent())) {
            sql2.append(" and  t.content = :content ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
