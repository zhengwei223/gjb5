package com.bm.gjb5.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javacommon.base.BaseManager;
import javacommon.base.EntityDao;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.dao.RightsMappingDao;
import com.bm.gjb5.dao.RightsRoleDao;
import com.bm.gjb5.model.RightsMapping;
import com.bm.gjb5.model.RightsResource;
import com.bm.gjb5.model.RightsRole;
import com.bm.gjb5.vo.query.RightsRoleQuery;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Service
public class RightsRoleManager extends BaseManager<RightsRole,java.lang.String>{

	private RightsRoleDao rightsRoleDao;
	private RightsMappingDao rightsMappingDao;

	public void setRightsRoleDao(RightsRoleDao dao) {
		this.rightsRoleDao = dao;
	}
	public void setRightsMappingDao(RightsMappingDao rightsMappingDao) {
		this.rightsMappingDao = rightsMappingDao;
	}
	public EntityDao getEntityDao() {
		return this.rightsRoleDao;
	}
	
	public Page findPage(RightsRoleQuery query) {
		return rightsRoleDao.findPage(query);
	}
	/**处理角色的授权
	 * @param rightsRole 
	 * 
	 * @param resources 状态发生变化的资源
	 */
	public void handleResource(RightsRole rightsRole, List<RightsResource> resources) {
		Set<RightsResource> uniSet = new HashSet<RightsResource>();
		for (RightsResource r : resources) {
			uniSet.add(r);
		}
		for (RightsResource r : uniSet) {
			if(r.isChecked()){//被选中，说明之前没有这项资源
				RightsMapping mapping = new RightsMapping();
				mapping.setRoleId(rightsRole.getId());
				mapping.setResourceId(r.getId());
				mapping.setOpUser((String) SecurityUtils.getSubject().getSession().getAttribute("userid"));
				mapping.setOpDate(new Date());
				rightsMappingDao.save(mapping);
			}else{//没被选中，说明之前有这项资源，现在要删除
				RightsMapping to_del_mapping =  rightsMappingDao.findResourse(rightsRole,r);
				if(null!=to_del_mapping)
					rightsMappingDao.delete(to_del_mapping);
			}
		}
	}
	
}
