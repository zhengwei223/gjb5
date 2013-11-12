package com.bm.gjb5.dao;

import static org.junit.Assert.*;

import java.util.Date;

import javacommon.gather.bean.Pageinfo;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.vo.query.PageinfoQuery;
@ContextConfiguration(locations={"classpath:/spring/applicationContext-*.xml"})
public class PageinfoDaoTest extends AbstractJUnit4SpringContextTests{
	private PageinfoDao pageinfoDao;
	@Before
	public void init(){
		pageinfoDao = applicationContext.getBean(PageinfoDao.class);
	}
	@SuppressWarnings("deprecation")
	@Test
	public void testFindPage() {
		PageinfoQuery query = new PageinfoQuery();
		query.setKeyWords("武汉 地铁");
		/*query.setTimelineBegin(new Date(2013-1900,8,26));
		query.setTimelineEnd(new Date(2013-1900,8,27));*/
		Page<Pageinfo> page = pageinfoDao.findPage(query);
		System.out.println(page.getResult());
	}

}
