package com.bm.gjb5.service;

import javacommon.base.BaseManager;
import javacommon.base.EntityDao;

import org.springframework.stereotype.Service;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.dao.LogCooperateDao;
import com.bm.gjb5.model.LogCooperate;
import com.bm.gjb5.vo.query.LogCooperateQuery;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Service
public class LogCooperateManager extends BaseManager<LogCooperate,java.lang.String>{

	private LogCooperateDao logCooperateDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setLogCooperateDao(LogCooperateDao dao) {
		this.logCooperateDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.logCooperateDao;
	}
	
	public Page findPage(LogCooperateQuery query) {
		return logCooperateDao.findPage(query);
	}
	
}
