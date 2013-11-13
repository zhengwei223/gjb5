package com.bm.gjb5.ws.client;

import java.beans.IntrospectionException;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.ws.WsConst;

import javacommon.ws.cxf.DynamicClient;

/**
 * 发送应用记录
 * @author zhengwei lastmodified 2013年11月10日
 *
 */
public class RecordSender {

	/**
	 * 发送应用记录
	 * @param system
	 * @param logtitle
	 * @param eventId
	 * @param logmessage 
	 * @return 0：成功   1：参数校验失败   2: 其他失败
	 * @throws Exception
	 */
	public static String send( String logtitle, String logmessage, String eventId) throws Exception{
		String wsdlPath = DictUtil.getDictValue("webService", "appRecord", "1");
		Document doc = doc = new SAXBuilder().build(CooperationControlFeedback.class.getResourceAsStream("appRecord.xml"));
		Element root = doc.getRootElement();
		//设置头部时间
		root.getChild("FileHeader").getChild("CreationTime").setText(new SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date()));
		//设置xml-body
		root.getChild("FileBody").getChild("eventId").setText(eventId);
		root.getChild("FileBody").getChild("system").setText(AppProperties.getAppName());
		root.getChild("FileBody").getChild("reportTime").setText(new Date().getTime()+"");
		root.getChild("FileBody").getChild("logTitle").setText(logtitle);
		root.getChild("FileBody").getChild("logMessage").setText(logmessage);
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);
		
		String xmlFile=out.toString();
		Object[] result = DynamicClient.invoke(wsdlPath , "appRecord", xmlFile);
		return (String) result[0];
	}
}
