package com.bm.gjb5.dao;

import javacommon.base.BaseHibernateDao;

import org.springframework.stereotype.Repository;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.model.RightsUser;
import com.bm.gjb5.vo.query.RightsUserQuery;

@Repository("rightsUserDao")
public class RightsUserDao extends BaseHibernateDao<RightsUser,java.lang.String>{

	public Class<RightsUser> getEntityClass() {
		return RightsUser.class;
	}
	
	@SuppressWarnings("unchecked")
	public Page<RightsUser> findPage(RightsUserQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from RightsUser t where 1=1 "
			  	+ "/~ and t.username like '%[username]%' ~/"
			  	+ "/~ and t.password = {password} ~/"
			  	+ "/~ and t.name = {name} ~/"
			  	+ "/~ and t.status = {status} ~/"
			  	+ "/~ and t.deptId = {deptId} ~/"
			  	+ "/~ and t.orgId = {orgId} ~/"
			  	+ "/~ and t.empId = {empId} ~/"
			  	+ "/~ and t.phonenumber = {phonenumber} ~/"
			  	+ "/~ and t.roleId = {roleId} ~/"
				+ "/~ order by [sortColumns] ~/";

        
		return pageQuery(sql,query);
	}
	

}
