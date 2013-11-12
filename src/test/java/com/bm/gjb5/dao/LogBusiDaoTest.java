package com.bm.gjb5.dao;

import java.util.List;

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

public class LogBusiDaoTest extends BaseDaoTestCase{
	
	private LogBusiDao dao;
	
	@Autowired
	public void setLogBusiDao(LogBusiDao dao) {
		this.dao = dao;
	}

	@Override 
	protected String[] getDbUnitDataFiles() {
	    //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
		return new String[]{"classpath:testdata/common.xml","classpath:testdata/LogBusi.xml",
		                    "classpath:testdata/LogBusi_"+TestMethodContext.getMethodName()+".xml"};
	}
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		LogBusiQuery query = newLogBusiQuery();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber());
		assertEquals(pageSize,page.getPageSize());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static LogBusiQuery newLogBusiQuery() {
		LogBusiQuery query = new LogBusiQuery();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
	  	query.setOpType(new Integer("1"));
	  	query.setOpUser(new String("1"));
		query.setOpTimeBegin(new Date(System.currentTimeMillis()));
		query.setOpTimeEnd(new Date(System.currentTimeMillis()));
	  	query.setSubmodule(new String("1"));
	  	query.setIp(new String("1"));
	  	query.setEqId(new String("1"));
	  	query.setContent(new String("1"));
		return query;
	}
	
}
