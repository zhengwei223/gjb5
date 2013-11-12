package com.bm.gjb5.service;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import java.util.*;

import javacommon.base.*;
import javacommon.util.db.ConvenientTools;
import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.vo.query.*;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Service
public class RightsResourceManager extends
		BaseManager<RightsResource, Integer> {

	private RightsResourceDao rightsResourceDao;

	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写 */
	public void setRightsResourceDao(RightsResourceDao dao) {
		this.rightsResourceDao = dao;
	}

	public EntityDao getEntityDao() {
		return this.rightsResourceDao;
	}

	public Page findPage(RightsResourceQuery query) {
		return rightsResourceDao.findPage(query);
	}

	/**
	 * 处理客户端提交上来的资源树
	 * 
	 * @param resources
	 *            来自客户端
	 */
	@SuppressWarnings("rawtypes")
	public void handleResource(List<RightsResource> resources) {

		List<RightsResource> all_Resources = findAll();// 全部资源
		int i=1;
		for (RightsResource rightsResource : resources) {
			rightsResource.setSerialNo(i++);//顺序号
			int index = -1;
			if ((index=all_Resources.indexOf(rightsResource))!=-1) {//如果原资源表有该数据，更新
				rightsResourceDao.evict(all_Resources.get(index));
				rightsResourceDao.update(rightsResource);
			}else{//新增
				//计算正确的id
				int id = ConvenientTools.getTreeSeq(rightsResource.getParentId());
				rightsResource.setId(id);
				rightsResourceDao.save(rightsResource);
			}
		}

		for (RightsResource rightsResource : all_Resources) {
			if(!resources.contains(rightsResource))
				rightsResourceDao.delete(rightsResource);
		}

	

	}
}
