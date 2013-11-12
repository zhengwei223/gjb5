package com.bm.gjb5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Test;

import cn.org.rapid_framework.test.context.TestMethodContext;
import static junit.framework.Assert.*;

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

public class LogBusiManagerTest extends BaseManagerTestCase{

	private LogBusiManager manager;
	
	@Autowired
	public void setLogBusiManager(LogBusiManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/LogBusi.xml",
                            "classpath:testdata/LogBusi_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		LogBusi obj = newLogBusi();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getId());
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	
	}
	
	public static LogBusi newLogBusi() {
		LogBusi obj = new LogBusi();
		
	  	obj.setOpType(new Integer("1"));
	  	obj.setOpUser(new java.lang.String("1"));
	  	obj.setOpTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setSubmodule(new java.lang.String("1"));
	  	obj.setIp(new java.lang.String("1"));
	  	obj.setEqId(new java.lang.String("1"));
	  	obj.setContent(new java.lang.String("1"));
		return obj;
	}
}
