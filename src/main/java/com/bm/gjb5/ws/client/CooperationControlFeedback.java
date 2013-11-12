package com.bm.gjb5.ws.client;

import javacommon.ws.cxf.DynamicClient;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;
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
	 * @return 调用结果
	 * @throws Exception 
	 */
	public static String controlFeedback(String eventId , int order,
			String performance, String failuneReasons) throws Exception {
		String wsdlPath = DictUtil.getDictValue("ws地址", "协同控制反馈", "1");
		//QName opName = new QName(namespaceURI, "controlFeedback");
		return (String) DynamicClient.invoke(wsdlPath, "controlFeedback", eventId,
				AppProperties.getAppName(), order, performance, failuneReasons)[0];
	}
	
	public static void main(String[] args) {
		try {
			controlFeedback("1", 1, "1", "");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
