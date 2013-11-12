package com.bm.gjb5.search;

import static org.junit.Assert.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.apache.lucene.queryparser.classic.ParseException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.bm.gjb5.search.PageinfoIndexUtils;;

public class PageinfoIndexUtilsTest {

	/*@Before
	public void testIndexAll() {
		try {
			PageinfoIndexUtils.indexAll();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/

	@Test
	public void testSearch() {
		try {
			List<String> ids = PageinfoIndexUtils.search("(title:\"风\" OR content:\"风\" OR summary:\"风\")");
			System.out.println(ids);
			StringBuilder sb = new StringBuilder();
			for (Iterator iterator = ids.iterator(); iterator.hasNext();) {
				String id = (String) iterator.next();
				sb.append("'").append(id).append("'").append(",");
			}
			
			String sql = "select * from pageinfo where id in("+sb.deleteCharAt(sb.length()-1).toString()+")";
			System.out.println(sql);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@After
	public void clear(){
	//	PageinfoIndexUtils.clear();
	}
}
