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


public class DataDisasterDetailManagerTest extends BaseManagerTestCase{

	private DataDisasterDetailManager manager;
	
	@Autowired
	public void setDataDisasterDetailManager(DataDisasterDetailManager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/DataDisasterDetail.xml",
                            "classpath:testdata/DataDisasterDetail_"+TestMethodContext.getMethodName()+".xml"};
    }

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		DataDisasterDetail obj = newDataDisasterDetail();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
		assertNotNull(obj.getId());
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	
	}
	
	public static DataDisasterDetail newDataDisasterDetail() {
		DataDisasterDetail obj = new DataDisasterDetail();
		
	  	obj.setExactValue(new Long("1"));
	  	obj.setDescp(new java.lang.String("1"));
	  	obj.setFiled1(new java.lang.String("1"));
	  	obj.setFiled2(new java.lang.String("1"));
	  	obj.setFiled3(new java.lang.String("1"));
	  	obj.setLabeled(new java.lang.String("1"));
	  	obj.setItentityId(new java.lang.String("1"));
	  	obj.setMeasurementId(new java.lang.String("1"));
		return obj;
	}
}
