package com.bm.gjb5.ws.client;

import java.io.IOException;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;

import javacommon.ws.cxf.DynamicClient;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.ws.WsConst;

/**
 * 与B7同步用户信息的客户端工具
 * 
 * @author zhengwei lastmodified 2013年9月10日
 */
public class SyncUtil {
	private static final String URL = DictUtil.getDictValue("webService", "UserSync", "1");
	private static final String APPID = AppProperties.getAppName();

	/**
	 * 用户信息的增量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public String incrSynUserInfo() throws Exception {
		int synType = 0;
		String method = "synUserInfo";
		String xml = getXml(synType);

		// ---------------构建xml文档 end--------------
		String result = (String) DynamicClient.invoke(URL, method, xml)[0];
		/*
		 * method = "synCommit"; // 设置头部时间
		 * root.getChild("FileHeader").getChild("CreationTime").setText(new
		 * SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date())); //
		 * 设置xml-body
		 * root.getChild("FileBody").getChild("appId").setText(APPID);
		 * root.getChild("FileBody").getChild("synType").setText(synType + "");
		 * outputter = new XMLOutputter(); out = new StringWriter();
		 * outputter.output(doc, out);
		 * 
		 * xml = out.toString(); DynamicClient.invoke(URL, method,xml);
		 */
		return result;
	}

	/**
	 * 用户信息的全量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public static String fullSynUserInfo() throws Exception {
		int synType = 1;
		String method = "synUserInfo";
		String xml = getXml(synType);
		String result = (String) DynamicClient.invoke(URL, method, xml)[0];
		return result;
	}

	private static String getXml(int synType) throws JDOMException, IOException {
		// ---------------构建xml文档 begin--------------
		Document doc = doc = new SAXBuilder().build(CooperationControlFeedback.class.getResourceAsStream("syncUser.xml"));
		Element root = doc.getRootElement();
		// 设置头部时间
		root.getChild("FileHeader").getChild("CreationTime").setText(new SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date()));
		// 设置xml-body
		root.getChild("FileBody").getChild("appId").setText(APPID);
		root.getChild("FileBody").getChild("synType").setText(synType + "");
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);

		String xml = out.toString();

		// ---------------构建xml文档 end--------------
		return xml;
	}

	/**
	 * 组织信息的增量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public String incrSynOrgInfo() throws Exception {
		int synType = 0;
		String method = "synOrgInfo";
		String result = (String) DynamicClient.invoke(URL, getXml(synType))[0];
		return result;
	}

	/**
	 * 组织信息的全量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public String fullSynOrgInfo() throws Exception {
		int synType = 1;
		String method = "synOrgInfo";
		String result = (String) DynamicClient.invoke(URL, method, getXml(synType))[0];
		return result;
	}

	/**
	 * 人员组织关系信息的增量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public String incrSynRelationInfo() throws Exception {
		int synType = 0;
		String method = "synRelationInfo";
		String result = (String) DynamicClient.invoke(URL, method, getXml(synType))[0];
		return result;
	}

	/**
	 * 人员组织关系信息的全量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public String fullSynRelationInfo() throws Exception {
		int synType = 1;
		String method = "synRelationInfo";
		String result = (String) DynamicClient.invoke(URL, method, getXml(synType))[0];
		return result;
	}

}
