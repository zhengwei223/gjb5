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


public class SysEarthquakeManagerTest extends BaseManagerTestCase{

	private SysEarthquakeManager manager;
	
	@Autowired
	public void setSysEarthquakeManager(SysEarthquakeManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/SysEarthquake.xml",
                            "classpath:testdata/SysEarthquake_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		SysEarthquake obj = newSysEarthquake();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getEventId());
		
		manager.removeById(obj.getEventId());
		manager.getEntityDao().flush();
	
	}
	
	public static SysEarthquake newSysEarthquake() {
		SysEarthquake obj = new SysEarthquake();
		
	  	obj.setEventTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setLongitude(new java.lang.String("1"));
	  	obj.setLatitude(new java.lang.String("1"));
	  	obj.setFocalDepth("1");
	  	obj.setMagnitude("1");
	  	obj.setLocation(new java.lang.String("1"));
	  	obj.setStartTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setEndTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setStatus(new Integer("1"));
		return obj;
	}
}
