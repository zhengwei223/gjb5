package com.bm.gjb5.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

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

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Service
public class SysOriginTypeManager extends BaseManager<SysOriginType,java.lang.String>{

	private SysOriginTypeDao sysOriginTypeDao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void setSysOriginTypeDao(SysOriginTypeDao dao) {
		this.sysOriginTypeDao = dao;
	}
	public EntityDao getEntityDao() {
		return this.sysOriginTypeDao;
	}
	
	public Page findPage(SysOriginTypeQuery query) {
		return sysOriginTypeDao.findPage(query);
	}
	
}
