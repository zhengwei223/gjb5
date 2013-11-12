package com.bm.gjb5.search;

import java.awt.RadialGradientPaint;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javacommon.gather.bean.Pageinfo;
import javacommon.util.db.DbUtil;

import javax.sql.RowSet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.queryparser.classic.QueryParser.Operator;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PageinfoIndexUtils {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(PageinfoIndexUtils.class);
	private static final String PATH = "e:/luceneIndex";
	private static final Version VERSION = Version.LUCENE_43;
	private static final Analyzer ANALYZER = new SmartChineseAnalyzer(VERSION);
	private static final String TABLENAME = "pageinfo";
	private static final Directory dir;
	private static final IndexWriter writer;
	private static final IndexWriterConfig iwConfig;
	private static IndexReader reader;
	private static IndexSearcher searcher;
	static {
		try {
			dir = FSDirectory.open(new File(PATH));
			iwConfig = new IndexWriterConfig(VERSION, ANALYZER);
			writer = new IndexWriter(dir, iwConfig);

		} catch (IOException e) {
			throw new RuntimeException(e);
		}

	}

	/**
	 * 重构索引
	 * 
	 * @throws SQLException
	 * @throws IOException
	 */
	public static void indexAll() throws SQLException, IOException {
		iwConfig.setInfoStream(System.out);
		String sql = "select * from " + TABLENAME;
		RowSet rs = DbUtil.exeQuery(sql);
		while (rs.next()) {
			Document doc = newDoc(rs);
			if (writer.getConfig().getOpenMode() == OpenMode.CREATE) {
				writer.addDocument(doc);
			} else {
				writer.updateDocument(new Term("id", rs.getString("id")), doc);
			}
		}
		writer.commit();
	}

	/**
	 * 为单个对象建立索引
	 * 
	 * @param p
	 * @throws IOException
	 */
	public static void index(Pageinfo p) throws IOException {
		Document doc = newDoc(p);
		if (doc != null)
			saveOrUpdate(p, doc);
	}

	/**
	 * 为多个对象建立索引
	 * 
	 * @param ps
	 * @throws IOException
	 */
	public static void index(List<Pageinfo> ps) throws IOException {
		for (Iterator iterator = ps.iterator(); iterator.hasNext();) {
			Pageinfo p = (Pageinfo) iterator.next();
			Document doc = newDoc(p);
			if (null != doc) {
				saveOrUpdate(p, doc);
			}
		}
	}

	/**
	 * 删除对指定Pageindo的索引
	 * 
	 * @param p
	 * @throws IOException
	 */
	public static void delete(Pageinfo p) throws IOException {
		writer.deleteDocuments(new Term("id", p.getId()));
		writer.commit();
	}

	/**
	 * 
	 * @param queryString
	 *            查询表达式
	 * @return 符合搜索条件的Pageinfo的id组成的列表
	 * @throws ParseException
	 *             表达式无法解析
	 * @throws IOException
	 */
	public static List<String> search(String queryString)
			throws ParseException, IOException {
		if (null != reader) {
			reader.close();
		}
		reader = DirectoryReader.open(writer, false);
		searcher = new IndexSearcher(reader);
		// 设定默认域为content
		QueryParser parser = new QueryParser(VERSION, "content", ANALYZER);
		Query query = parser.parse(queryString);
		LOGGER.info(query.toString());
		// Query query = new TermQuery(new Term("content", queryString));
		ScoreDoc[] hits = searcher.search(query, 100).scoreDocs;// 命中
		List<String> ids = new ArrayList<String>();

		for (int i = 0; i < hits.length; i++) {
			Document doc = searcher.doc(hits[i].doc);
			ids.add(doc.get("id"));
		}
		return ids;
	}

	private static void saveOrUpdate(Pageinfo p, Document doc)
			throws IOException {
		if (writer.getConfig().getOpenMode() == OpenMode.CREATE) {
			writer.addDocument(doc);
		} else {
			writer.updateDocument(new Term("id", p.getId()), doc);
		}
		writer.commit();
	}

	private static Document newDoc(RowSet rs) throws SQLException {

		Pageinfo p = new Pageinfo();
		p.setContent(rs.getString("content"));
		p.setTitle(rs.getString("title"));
		p.setSummary(rs.getString("summary"));
		p.setId(rs.getString("id"));
		p.setOptime(rs.getDate("optime"));
		p.setTimeline(rs.getDate("timeline"));
		/*
		 * BeanHandler<Pageinfo> handler = new BeanHandler<Pageinfo>(
		 * Pageinfo.class); Pageinfo p = handler.handle(rs);
		 */
		return newDoc(p);
	}

	private static Document newDoc(Pageinfo p) {
		Document doc = new Document();
		try {
			doc.add(new TextField("content", p.getContent(), Store.NO));
			doc.add(new TextField("title", p.getTitle(), Store.NO));
			doc.add(new TextField("summary", p.getSummary(), Store.NO));
			doc.add(new StringField("id", p.getId(), Store.YES));
			doc.add(new StringField("optime", p.getOptime().getTime() + "",
					Store.NO));
			doc.add(new StringField("timeline", p.getTimeline().getTime() + "",
					Store.NO));
		} catch (NullPointerException e) {
			e.printStackTrace();
			return null;
		}
		return doc;
	}

	/**
	 * 由于reader writer的打开需要较大的系统开销，所以在最后才clear是明智的
	 */
	public static void clear() {
		try {
			reader.close();
			writer.close();
			dir.close();
		} catch (IOException e) {
			LOGGER.error("关闭索引读写流失败", e);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
