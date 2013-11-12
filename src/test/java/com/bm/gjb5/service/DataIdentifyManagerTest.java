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


public class DataIdentifyManagerTest extends BaseManagerTestCase{

	private DataIdentifyManager manager;
	
	@Autowired
	public void setDataIdentifyManager(DataIdentifyManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/DataIdentify.xml",
                            "classpath:testdata/DataIdentify_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		DataIdentify obj = newDataIdentify();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getId());
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	
	}
	
	public static DataIdentify newDataIdentify() {
		DataIdentify obj = new DataIdentify();
		
	  	obj.setCreateTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setEventTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setLocation(new java.lang.String("1"));
	  	obj.setLongitude(new java.lang.String("1"));
	  	obj.setLatitude(new java.lang.String("1"));
	  	obj.setTxtInfo1(new java.lang.String("1"));
	  	obj.setTxtInfo2(new java.lang.String("1"));
	  	obj.setSemantics(new java.lang.String("1"));
	  	obj.setMagnitude(new Long("1"));
	  	obj.setSeisesthesia(new Integer("1"));
	  	obj.setReportMan(new java.lang.String("1"));
	  	obj.setReportTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setManual(new java.lang.String("1"));
	  	obj.setOriginalId(new java.lang.String("1"));
		return obj;
	}
}
