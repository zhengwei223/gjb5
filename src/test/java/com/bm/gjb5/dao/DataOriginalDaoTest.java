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


public class DataOriginalDaoTest extends BaseDaoTestCase{
	
	private DataOriginalDao dao;
	
	@Autowired
	public void setDataOriginalDao(DataOriginalDao dao) {
		this.dao = dao;
	}

	@Override 
	protected String[] getDbUnitDataFiles() {
	    //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
		return new String[]{"classpath:testdata/common.xml","classpath:testdata/DataOriginal.xml",
		                    "classpath:testdata/DataOriginal_"+TestMethodContext.getMethodName()+".xml"};
	}
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		DataOriginalQuery query = newDataOriginalQuery();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber());
		assertEquals(pageSize,page.getPageSize());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static DataOriginalQuery newDataOriginalQuery() {
		DataOriginalQuery query = new DataOriginalQuery();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
	  	query.setForm(new String("1"));
	  	query.setRemoteUrl(new String("1"));
		query.setNoticeTimeBegin(new Date(System.currentTimeMillis()));
		query.setNoticeTimeEnd(new Date(System.currentTimeMillis()));
		query.setCollTimeBegin(new Date(System.currentTimeMillis()));
		query.setCollTimeEnd(new Date(System.currentTimeMillis()));
	  	query.setLocaleUrl(new String("1"));
	  	query.setLocaleFmtUrl(new String("1"));
	  	query.setFilename(new String("1"));
	  	query.setFmtFname(new String("1"));
	  	query.setFileSize(new Long("1"));
	  	query.setStatus(new Integer("1"));
	  	query.setBatch(new Integer("1"));
	  	query.setJobId(new String("1"));
		return query;
	}
	
}
