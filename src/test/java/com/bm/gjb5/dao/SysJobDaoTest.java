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


public class SysJobDaoTest extends BaseDaoTestCase{
	
	private SysJobDao dao;
	
	@Autowired
	public void setSysJobDao(SysJobDao dao) {
		this.dao = dao;
	}

	@Override 
	protected String[] getDbUnitDataFiles() {
	    //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
		return new String[]{"classpath:testdata/common.xml","classpath:testdata/SysJob.xml",
		                    "classpath:testdata/SysJob_"+TestMethodContext.getMethodName()+".xml"};
	}
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		SysJobQuery query = newSysJobQuery();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber());
		assertEquals(pageSize,page.getPageSize());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static SysJobQuery newSysJobQuery() {
		SysJobQuery query = new SysJobQuery();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
	  	query.setIsInternal(new String("1"));
		query.setBeginTimeBegin(new Date(System.currentTimeMillis()));
		query.setBeginTimeEnd(new Date(System.currentTimeMillis()));
		query.setEndTimeBegin(new Date(System.currentTimeMillis()));
		query.setEndTimeEnd(new Date(System.currentTimeMillis()));
	  	query.setExecuteMethod(new String("1"));
	  	query.setFrequency(new Integer("1"));
	  	query.setPriority(new Integer("1"));
	  	query.setBatch(new Integer("1"));
	  	query.setUrl(new String("1"));
	  	query.setStatus(new Integer("1"));
	  	query.setScale(new Integer("1"));
	  	query.setOriginTypeId(new String("1"));
	  	query.setEventId(new String("1"));
		return query;
	}
	
}
