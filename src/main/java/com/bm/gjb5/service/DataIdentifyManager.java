package com.bm.gjb5.service;

import javacommon.base.BaseHibernateDao;
import javacommon.base.BaseManager;
import javacommon.base.EntityDao;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.dao.DataIdentifyDao;
import com.bm.gjb5.model.DataIdentify;
import com.bm.gjb5.model.DataOriginal;
import com.bm.gjb5.vo.query.DataIdentifyQuery;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Service
public class DataIdentifyManager extends BaseManager<DataIdentify,java.lang.String>{

	private DataIdentifyDao dataIdentifyDao;
	private DataOriginalManager dataOriginalManager;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setDataIdentifyDao(DataIdentifyDao dao) {
		this.dataIdentifyDao = dao;
	}
	public void setDataOriginalManager(DataOriginalManager dataOriginalManager) {
		this.dataOriginalManager = dataOriginalManager;
	}
	public EntityDao getEntityDao() {
		return this.dataIdentifyDao;
	}
	
	public Page findPage(DataIdentifyQuery query) {
		return dataIdentifyDao.findPage(query);
	}
	/**
	 * 根据原始记录id查询识别记录
	 * @param string
	 * @return
	 */
	public DataIdentify findByOriginal(String string) {
		return dataIdentifyDao.findByProperty("originalId", string);
	}
	
	
	@Override
	/**
	 * 保存识别数据的时候,修改原始数据的状态
	 */
	public void save(DataIdentify entity) throws DataAccessException {
		dataIdentifyDao.save(entity);
		DataOriginal dataOriginal = dataOriginalManager.getById(entity.getOriginalId());
		dataOriginal.setStatus(1);//1:已识别
		dataOriginalManager.update(dataOriginal);
	}
}
