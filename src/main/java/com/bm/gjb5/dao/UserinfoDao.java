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
public class UserinfoDao extends BaseHibernateDao<Userinfo,java.lang.String>{
	private static final Logger LOGGER = LoggerFactory.getLogger(UserinfoDao.class);
	
	public Class getEntityClass() {
		return Userinfo.class;
	}
	
	public Page findPage(UserinfoQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from Userinfo t where 1=1 "
			  	+ "/~ and t.code = {code} ~/"
			  	+ "/~ and t.username = {username} ~/"
			  	+ "/~ and t.pwd = {pwd} ~/"
			  	+ "/~ and t.fullname = {fullname} ~/"
			  	+ "/~ and t.pnumber = {pnumber} ~/"
			  	+ "/~ and t.unit = {unit} ~/"
			  	+ "/~ and t.email = {email} ~/"
			  	+ "/~ and t.orguuid = {orguuid} ~/"
			  	+ "/~ and t.orgcode = {orgcode} ~/"
			  	+ "/~ and t.status = {status} ~/"
				+ "/~ order by [sortColumns] ~/";

        //生成sql2的原因是为了不喜欢使用xsqlbuilder的同学，请修改生成器模板，删除本段的生成
        StringBuilder sql2 = new StringBuilder("select t from Userinfo t where 1=1 ");
        if(isNotEmpty(query.getUuid())) {
            sql2.append(" and  t.uuid = :uuid ");
        }
        if(isNotEmpty(query.getCode())) {
            sql2.append(" and  t.code = :code ");
        }
        if(isNotEmpty(query.getUsername())) {
            sql2.append(" and  t.username = :username ");
        }
        if(isNotEmpty(query.getPwd())) {
            sql2.append(" and  t.pwd = :pwd ");
        }
        if(isNotEmpty(query.getFullname())) {
            sql2.append(" and  t.fullname = :fullname ");
        }
        if(isNotEmpty(query.getPnumber())) {
            sql2.append(" and  t.pnumber = :pnumber ");
        }
        if(isNotEmpty(query.getUnit())) {
            sql2.append(" and  t.unit = :unit ");
        }
        if(isNotEmpty(query.getEmail())) {
            sql2.append(" and  t.email = :email ");
        }
        if(isNotEmpty(query.getOrguuid())) {
            sql2.append(" and  t.orguuid = :orguuid ");
        }
        if(isNotEmpty(query.getOrgcode())) {
            sql2.append(" and  t.orgcode = :orgcode ");
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
