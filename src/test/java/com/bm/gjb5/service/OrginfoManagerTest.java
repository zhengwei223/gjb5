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
import org.slf4j.*;
public class OrginfoManagerTest extends BaseManagerTestCase{

	private OrginfoManager manager;
	
	@Autowired
	public void setOrginfoManager(OrginfoManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/Orginfo.xml",
                            "classpath:testdata/Orginfo_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		Orginfo obj = newOrginfo();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getOrguuid());
		
		manager.removeById(obj.getOrguuid());
		manager.getEntityDao().flush();
	
	}
	
	public static Orginfo newOrginfo() {
		Orginfo obj = new Orginfo();
		
	  	obj.setParentuuid(new java.lang.String("1"));
	  	obj.setOrgname(new java.lang.String("1"));
	  	obj.setOrgcode(new java.lang.String("1"));
	  	obj.setContent(new java.lang.String("1"));
	  	obj.setDutyOfficer(new java.lang.String("1"));
	  	obj.setPnumber(new java.lang.String("1"));
		return obj;
	}
}
