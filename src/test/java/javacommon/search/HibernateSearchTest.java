//package javacommon.search;
//
//import java.util.Iterator;
//import java.util.List;
//
//import javacommon.gather.bean.Pageinfo;
//
//import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
//import org.apache.lucene.analysis.standard.StandardAnalyzer;
//import org.apache.lucene.queryparser.classic.ParseException;
//import org.apache.lucene.queryparser.classic.QueryParser;
//import org.apache.lucene.search.Query;
//import org.apache.lucene.util.Version;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.search.FullTextQuery;
//import org.hibernate.search.FullTextSession;
//import org.hibernate.search.Search;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
//@ContextConfiguration(locations={"classpath:/spring/*.xml"})
//public class HibernateSearchTest extends AbstractJUnit4SpringContextTests{
//	private static SessionFactory sf;
//	
//	@Before
//	public void init() {
//		sf = (SessionFactory) applicationContext.getBean("sessionFactory");
//		
//	}
//	@Before
//	//执行索引
//	public void index(){
//		Session session = sf.openSession();
//		FullTextSession fullTextSession = Search.getFullTextSession(session);
//		//查出结果
//		List<Pageinfo> pageinfos = session.createCriteria(Pageinfo.class).list();
//		session.beginTransaction();
//		//依次建立索引
//		for (Iterator iterator = pageinfos.iterator(); iterator.hasNext();) {
//			Pageinfo pageinfo = (Pageinfo) iterator.next();
//			fullTextSession.index(pageinfo);
//		}
//		session.getTransaction().commit();
//		session.close();
//		System.out.println("index over......");
//	}
//
//	@Test
//	public void searchTest() {
//		Session session = sf.openSession();
//		FullTextSession fullTextSession = Search.getFullTextSession(session);
//		//在字段content中检索
//		QueryParser queryParser = new QueryParser(Version.LUCENE_43, "content", new SmartChineseAnalyzer(Version.LUCENE_43));
//		Query luceneqQuery=null;
//		try {
//			//检索含有“大风”的信息
//			luceneqQuery = queryParser.parse("大风");
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		//执行检索，得到结果集
//		FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(luceneqQuery, Pageinfo.class);
//		List<Pageinfo> pageinfos = fullTextQuery.list();
//		//查看结果做验证
//		for (Iterator iterator = pageinfos.iterator(); iterator.hasNext();) {
//			Pageinfo pageinfo = (Pageinfo) iterator.next();
//			System.out.println("===================");
//			System.out.println(pageinfo.getContent());
//		}
//		
//		System.out.println("共得到---"+pageinfos.size()+"---条数据");
//	}
//}
