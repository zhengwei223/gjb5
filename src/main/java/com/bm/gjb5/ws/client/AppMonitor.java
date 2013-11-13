package com.bm.gjb5.ws.client;

import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javacommon.ws.cxf.DynamicClient;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.ws.WsConst;

public class AppMonitor {
	public static String send(String runStatus) throws Exception{
		String wsdlPath = DictUtil.getDictValue("webService", "appMonitor", "1");
		Document doc = doc = new SAXBuilder().build(CooperationControlFeedback.class.getResourceAsStream("appMonitor.xml"));
		Element root = doc.getRootElement();
		//设置头部时间
		root.getChild("FileHeader").getChild("CreationTime").setText(new SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date()));
		//设置xml-body
		root.getChild("FileBody").getChild("system").setText(AppProperties.getAppName());
		root.getChild("FileBody").getChild("reportTime").setText(new Date().getTime()+"");
		root.getChild("FileBody").getChild("runStatus").setText(runStatus);
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);
		
		String xmlFile=out.toString();
		Object[] result = DynamicClient.invoke(wsdlPath , "appMonitor", xmlFile);
		return (String) result[0];
	}
}
