package com.bm.gjb5.ws.client;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;

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
	 * @return
	 * @throws Exception
	 */
	public static String send(int level, String exceptionMessage)
			throws Exception {

		String wsdlPath = DictUtil.getDictValue("ws地址", "异常监控", "1");
		Object[] result = DynamicClient.invoke(wsdlPath, "exceptionMonitor",
				AppProperties.getAppName(), new Date().getTime(),
				level, exceptionMessage);

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
