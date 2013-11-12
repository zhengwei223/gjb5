package com.bm.gjb5.dao;

import java.util.*;
import java.lang.reflect.*;
import javacommon.base.*;
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
public class OrginfoDao extends BaseHibernateDao<Orginfo,java.lang.String>{
	private static final Logger LOGGER = LoggerFactory.getLogger(OrginfoDao.class);
	
	public Class getEntityClass() {
		return Orginfo.class;
	}
	
	public Page findPage(OrginfoQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from Orginfo t where 1=1 "
			  	+ "/~ and t.parentuuid = {parentuuid} ~/"
			  	+ "/~ and t.orgname = {orgname} ~/"
			  	+ "/~ and t.orgcode = {orgcode} ~/"
			  	+ "/~ and t.content = {content} ~/"
			  	+ "/~ and t.dutyOfficer = {dutyOfficer} ~/"
			  	+ "/~ and t.pnumber = {pnumber} ~/"
			  	+ "/~ and t.status = {status} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from Orginfo t where 1=1 ");
        if(isNotEmpty(query.getOrguuid())) {
            sql2.append(" and  t.orguuid = :orguuid ");
        }
        if(isNotEmpty(query.getParentuuid())) {
            sql2.append(" and  t.parentuuid = :parentuuid ");
        }
        if(isNotEmpty(query.getOrgname())) {
            sql2.append(" and  t.orgname = :orgname ");
        }
        if(isNotEmpty(query.getOrgcode())) {
            sql2.append(" and  t.orgcode = :orgcode ");
        }
        if(isNotEmpty(query.getContent())) {
            sql2.append(" and  t.content = :content ");
        }
        if(isNotEmpty(query.getDutyOfficer())) {
            sql2.append(" and  t.dutyOfficer = :dutyOfficer ");
        }
        if(isNotEmpty(query.getPnumber())) {
            sql2.append(" and  t.pnumber = :pnumber ");
        }
        if(isNotEmpty(query.getStatus())) {
            sql2.append(" and  t.status = :status ");
        }
        if(isNotEmpty(query.getSortColumns())) {
            sql2.append(" order by :sortColumns ");
        }	
        
		return pageQuery(sql,query);
	}
	

}
