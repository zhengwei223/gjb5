package com.bm.gjb5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Test;

import cn.org.rapid_framework.test.context.TestMethodContext;
import static junit.framework.Assert.*;

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


public class RightsResourceManagerTest extends BaseManagerTestCase{

	private RightsResourceManager manager;
	
	@Autowired
	public void setRightsResourceManager(RightsResourceManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/RightsResource.xml",
                            "classpath:testdata/RightsResource_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		RightsResource obj = newRightsResource();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getId());
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	
	}
	
	public static RightsResource newRightsResource() {
		RightsResource obj = new RightsResource();
		
	  	obj.setName(new java.lang.String("1"));
	  	obj.setSerialNo(new Integer("1"));
	  	obj.setUrl(new java.lang.String("1"));
	  	obj.setDescp(new java.lang.String("1"));
	  	obj.setLevel(new Long("1"));
	  	obj.setParentId(1);
		return obj;
	}
}
