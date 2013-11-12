package com.bm.gjb5.service;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.*;
import java.io.IOException;
import java.lang.reflect.*;

import javacommon.base.*;
import javacommon.gather.bean.Pageinfo;
import javacommon.util.*;
import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.search.PageinfoIndexUtils;
import com.bm.gjb5.service.*;
import com.bm.gjb5.vo.query.*;

import org.slf4j.*;@Service
public class PageinfoManager extends BaseManager<Pageinfo,java.lang.String>{
	private static final Logger LOGGER = LoggerFactory.getLogger(PageinfoManager.class);
	
	private PageinfoDao pageinfoDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setPageinfoDao(PageinfoDao dao) {
		this.pageinfoDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.pageinfoDao;
	}
	
	public Page findPage(PageinfoQuery query) {
		return pageinfoDao.findPage(query);
	}
	@Override
	public void save(Pageinfo entity) throws DataAccessException {
		String id = (String) pageinfoDao.save(entity);
		try {
			PageinfoIndexUtils.index(pageinfoDao.getById(id));
		} catch (IOException e) {
			LOGGER.error("建立索引失败，id="+id,e);
		}
	}
	
}
