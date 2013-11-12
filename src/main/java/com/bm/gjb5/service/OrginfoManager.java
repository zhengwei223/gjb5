package com.bm.gjb5.service;

import org.springframework.stereotype.Service;

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
import org.slf4j.*;@Service
public class OrginfoManager extends BaseManager<Orginfo,java.lang.String>{
	private static final Logger LOGGER = LoggerFactory.getLogger(OrginfoManager.class);
	
	private OrginfoDao orginfoDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setOrginfoDao(OrginfoDao dao) {
		this.orginfoDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.orginfoDao;
	}
	
	public Page findPage(OrginfoQuery query) {
		return orginfoDao.findPage(query);
	}
	
}
