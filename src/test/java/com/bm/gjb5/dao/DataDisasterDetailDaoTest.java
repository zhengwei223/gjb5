package com.bm.gjb5.dao;

import java.util.List;

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


public class DataDisasterDetailDaoTest extends BaseDaoTestCase{
	
	private DataDisasterDetailDao dao;
	
	@Autowired
	public void setDataDisasterDetailDao(DataDisasterDetailDao dao) {
		this.dao = dao;
	}

	@Override 
	protected String[] getDbUnitDataFiles() {
	    //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
		return new String[]{"classpath:testdata/common.xml","classpath:testdata/DataDisasterDetail.xml",
		                    "classpath:testdata/DataDisasterDetail_"+TestMethodContext.getMethodName()+".xml"};
	}
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		DataDisasterDetailQuery query = newDataDisasterDetailQuery();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber());
		assertEquals(pageSize,page.getPageSize());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static DataDisasterDetailQuery newDataDisasterDetailQuery() {
		DataDisasterDetailQuery query = new DataDisasterDetailQuery();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
	  	query.setExactValue(new Long("1"));
	  	query.setDescp(new String("1"));
	  	query.setFiled1(new String("1"));
	  	query.setFiled2(new String("1"));
	  	query.setFiled3(new String("1"));
	  	query.setLabeled(new String("1"));
	  	query.setItentityId(new String("1"));
	  	query.setMeasurementId(new String("1"));
		return query;
	}
	
}
