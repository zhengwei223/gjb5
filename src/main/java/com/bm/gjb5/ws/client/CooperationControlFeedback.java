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
 * 协同控制反馈
 * @author zhengwei lastmodified 2013年11月9日
 *
 */
public class CooperationControlFeedback {
	
	/**
	 * 将协同控制命令执行结果反馈给中心
	 * @param eventId 事件ID
	 * @param order 命令
	 * @param performance	执行情况
	 * @param failuneReasons 失败原因
	 * @param wsdlPath wsdl地址
	 * @param opName QName
	 * @return 调用结果 0调用成功，1参数校验失败，2其他失败
	 * @throws Exception 
	 */
	public static String controlFeedback(String eventId , int order,
			String performance, String failuneReasons) throws Exception {
		String wsdlPath = DictUtil.getDictValue("webService", "controlFeedback", "1");
		Document doc = doc = new SAXBuilder().build(CooperationControlFeedback.class.getResourceAsStream("feedback.xml"));
		Element root = doc.getRootElement();
		//设置头部时间
		root.getChild("FileHeader").getChild("CreationTime").setText(new SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date()));
		//设置xml-body
		root.getChild("FileBody").getChild("eventId").setText(eventId);
		root.getChild("FileBody").getChild("system").setText(AppProperties.getAppName());
		root.getChild("FileBody").getChild("order").setText(order+"");
		root.getChild("FileBody").getChild("performance").setText(performance);
		root.getChild("FileBody").getChild("failuneReasons").setText(failuneReasons);
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);
		
		String xmlFile=out.toString();
//		System.out.println(xmlFile);
		//调用，返回
		return (String) DynamicClient.invoke(wsdlPath, "controlFeedback", xmlFile)[0];
	}
	
	public static void main(String[] args) throws Exception, Exception {
		Document doc = doc = new SAXBuilder().build(CooperationControlFeedback.class.getResourceAsStream("feedback.xml"));
		Element root = doc.getRootElement();
		//设置头部时间
		root.getChild("FileHeader").getChild("CreationTime").setText(new SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date()));
		//设置xml-body
		root.getChild("FileBody").getChild("eventId").setText("eventId");
		root.getChild("FileBody").getChild("system").setText("AppName");
		root.getChild("FileBody").getChild("order").setText("1");
		root.getChild("FileBody").getChild("performance").setText("performance");
		root.getChild("FileBody").getChild("failuneReasons").setText("failuneReasons");
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);
		
		String xmlFile=out.toString();
		System.out.println(xmlFile);
	}
}
