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


public class DataIdentifyDaoTest extends BaseDaoTestCase{
	
	private DataIdentifyDao dao;
	
	@Autowired
	public void setDataIdentifyDao(DataIdentifyDao dao) {
		this.dao = dao;
	}

	@Override 
	protected String[] getDbUnitDataFiles() {
	    //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
		return new String[]{"classpath:testdata/common.xml","classpath:testdata/DataIdentify.xml",
		                    "classpath:testdata/DataIdentify_"+TestMethodContext.getMethodName()+".xml"};
	}
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		DataIdentifyQuery query = newDataIdentifyQuery();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber());
		assertEquals(pageSize,page.getPageSize());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static DataIdentifyQuery newDataIdentifyQuery() {
		DataIdentifyQuery query = new DataIdentifyQuery();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
		query.setCreateTimeBegin(new Date(System.currentTimeMillis()));
		query.setCreateTimeEnd(new Date(System.currentTimeMillis()));
		query.setEventTimeBegin(new Date(System.currentTimeMillis()));
		query.setEventTimeEnd(new Date(System.currentTimeMillis()));
	  	query.setLocation(new String("1"));
	  	query.setLongitude(new String("1"));
	  	query.setLatitude(new String("1"));
	  	query.setTxtInfo1(new String("1"));
	  	query.setTxtInfo2(new String("1"));
	  	query.setSemantics(new String("1"));
	  	query.setMagnitude(new Long("1"));
	  	query.setSeisesthesia(new Integer("1"));
	  	query.setReportMan(new String("1"));
		query.setReportTimeBegin(new Date(System.currentTimeMillis()));
		query.setReportTimeEnd(new Date(System.currentTimeMillis()));
	  	query.setManual(new String("1"));
	  	query.setOriginalId(new String("1"));
		return query;
	}
	
}
