package com.bm.gjb5.ws;

import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

/**
 * 协同控制接口
 * 
 * @author zhengwei lastmodified 2013年9月16日
 * 
 */
@WebService
// @SOAPBinding(style = Style.RPC)
public interface CooperationControlService {
	/**
	 * 在地震应急事件协同过程中，向国家中心各个协同系统发送控制命令。 各个协同系统响应控制命令，返回应答结果
	 * @return 返回状态码： 0：失败 1：成功
	 */
	@WebResult(name = "Status")
	String controlCommand(@WebParam(name = "xmlFile") String xmlFile);

	/**
	 * 协同应用监视 监视各个协同系统的服务器情况,解析监视结果并负责展现
	 * 
	 * @param sysytem
	 *            系统名称
	 * @param reportTime
	 *            报告时间
	 * @param runStaus
	 *            运行状态
	 * @return 返回状态码： 0：失败 1：成功
	 */
	/*
	 * @WebResult(name = "Status") String appMonitor(@WebParam(name = "sysytem")
	 * String sysytem,
	 * 
	 * @WebParam(name = "reportTime") long reportTime,
	 * 
	 * @WebParam(name = "runStaus") String runStaus);
	 */
}
