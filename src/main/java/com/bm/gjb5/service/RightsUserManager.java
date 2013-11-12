package com.bm.gjb5.service;

import java.util.Collections;
import java.util.List;

import javacommon.base.BaseManager;
import javacommon.base.EntityDao;

import org.apache.shiro.SecurityUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.dao.RightsUserDao;
import com.bm.gjb5.model.RightsResource;
import com.bm.gjb5.model.RightsRole;
import com.bm.gjb5.model.RightsUser;
import com.bm.gjb5.vo.query.RightsUserQuery;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Service
public class RightsUserManager extends
		BaseManager<RightsUser, java.lang.String> {
	private static final Logger LOG = LoggerFactory
			.getLogger(RightsUserManager.class);
	private RightsUserDao rightsUserDao;

	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写 */
	public void setRightsUserDao(RightsUserDao dao) {
		this.rightsUserDao = dao;
	}

	public EntityDao getEntityDao() {
		return this.rightsUserDao;
	}

	public Page findPage(RightsUserQuery query) {
		Page page = rightsUserDao.findPage(query);
		return page;
	}

	// -----------------------------------new-----------
	public RightsUser findByUsername(String username) {
		return rightsUserDao.findByProperty("username", username);
	}

	public List<RightsResource> getResourses(String username) {
		RightsUser user = findByUsername(username);
		RightsRole role = user.getRightsRole();
		return role.getResourses();
	}

	// 获得权限树的json字符串表示
	public String getRscTreeNodes() {
		String username = (String) SecurityUtils.getSubject().getSession()
				.getAttribute("username");
		// JsonConfig jsonConfig = new JsonConfig();
		// jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		// jsonConfig.setExcludes(new String[] { "transactionTimeout",
		// "handler",
		// "children", "rightsMappings", "descp", "drag", "noRemove",
		// "noRename", "checked", "chkDisabled" });
		List<RightsResource> resources = getResourses(username);
//		List<RightsResource> resources2 = new ArrayList<RightsResource>();
//		Collections.copy(resources2, resources);
		// 资源排序??无效？
		Collections.sort(resources);
		/* 拼接JSON字符串 */
		StringBuilder sb = new StringBuilder("[");
		for (RightsResource r : resources) {
			sb.append("{").append("id:").append("\"" + r.getId() + "\"")
					.append(",").append("name:")
					.append("\"" + r.getName() + "\"").append(",")
					.append("parentId:").append("\"" + r.getParentId() + "\"")
					.append(",");
			// url
			if (StringUtils.hasLength(r.getUrl())) {
				sb.append("url:")
						.append("\"" + ServletActionContext.getRequest().getContextPath()
								+ org.apache.commons.lang.StringUtils.defaultString(r.getUrl()) + "\"")
						.append(",");

			}
			for (RightsResource r1 : resources) {
				if (r1.getParentId() == r.getId()) {
					sb.append("isParent:\"true\"").append(",");
					break;
				}
			}
			// icon,根节点图标特殊，其余不管
			if (r.getId() == 0) {
				sb.append("iconSkin:\"pIcon01\"").append(",");
			}
			sb.append("target:\"rightFrame\"},");
		}
		sb.deleteCharAt(sb.length() - 1);
		sb.append("]");
		return sb.toString();
	}
	
	@Override
	/**
	 * 重写父类方法，此处并不能删除用户，而是将其禁用。
	 */
	public void removeById(String id) throws DataAccessException {
		RightsUser rightsUser = rightsUserDao.getById(id);
		rightsUser.setStatus(0);
		rightsUserDao.update(rightsUser);
	}
	/**
	 * 激活用户
	 */
	public void activation(String id) {
		RightsUser rightsUser = rightsUserDao.getById(id);
		rightsUser.setStatus(1);
		rightsUserDao.update(rightsUser);
	}

}
