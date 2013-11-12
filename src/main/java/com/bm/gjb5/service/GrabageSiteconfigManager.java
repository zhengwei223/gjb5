package com.bm.gjb5.service;

import org.springframework.stereotype.Service;

import java.util.*;
import java.lang.reflect.*;

import javacommon.base.*;
import javacommon.gather.bean.GrabageSiteconfig;
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
public class GrabageSiteconfigManager extends BaseManager<GrabageSiteconfig,java.lang.String>{
	private static final Logger LOGGER = LoggerFactory.getLogger(GrabageSiteconfigManager.class);
	
	private GrabageSiteconfigDao grabageSiteconfigDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setGrabageSiteconfigDao(GrabageSiteconfigDao dao) {
		this.grabageSiteconfigDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.grabageSiteconfigDao;
	}
	
	public Page findPage(GrabageSiteconfigQuery query) {
		return grabageSiteconfigDao.findPage(query);
	}
	
}
