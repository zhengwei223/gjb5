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
 * 异常监控 将异常信息发送给控制中心
 * 
 * @author zhengwei lastmodified 2013年11月10日
 * 
 */
public class ExceptionSender {
	/**
	 * 发送异常信息到控制中心
	 * 
	 * @param exceptionLeave
	 *            异常等级 0一般异常 1关键异常 2严重异常
	 * @param exceptionMessage
	 *            异常信息
	 * @return 0：成功   1：参数校验失败   2: 其他失败
	 * @throws Exception
	 */
	public static String send(int level, String exceptionMessage)
			throws Exception {
		String wsdlPath = DictUtil.getDictValue("webService",
				"exceptionMonitor", "1");
		Document doc = doc = new SAXBuilder()
				.build(CooperationControlFeedback.class
						.getResourceAsStream("exception.xml"));
		Element root = doc.getRootElement();
		// 设置头部时间
		root.getChild("FileHeader")
				.getChild("CreationTime")
				.setText(
						new SimpleDateFormat(WsConst.DATE_FORMAT)
								.format(new Date()));
		// 设置xml-body
		root.getChild("FileBody").getChild("system")
				.setText(AppProperties.getAppName());
		root.getChild("FileBody").getChild("reportTime")
				.setText(new Date().getTime() + "");
		root.getChild("FileBody").getChild("exceptionLevel")
				.setText(level + "");
		root.getChild("FileBody").getChild("exceptionMessage")
				.setText(exceptionMessage);
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);

		String xmlFile = out.toString();
		Object[] result = DynamicClient.invoke(wsdlPath, "exceptionMonitor",
				xmlFile);

		return (String) result[0];

	}

	public static enum ExceptionLevel {
		NOMAL(0), KEY(1), SEVERE(2);
		private int value;

		private ExceptionLevel(int value) {
			this.value = value;
		}

		public int getValue() {
			return value;
		}
	}
}
