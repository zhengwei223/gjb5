package com.bm.gjb5.ws.client;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;

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
	 * @return
	 * @throws Exception
	 */
	public static String send( String logtitle, String logmessage, String eventId) throws Exception{
		String wsdlPath = DictUtil.getDictValue("ws地址", "应用记录", "1");
		Object[] result = DynamicClient.invoke(wsdlPath , "appRecord", AppProperties.getAppName(),new Date().getTime(),logtitle,logmessage,eventId);
		return (String) result[0];
	}
}
