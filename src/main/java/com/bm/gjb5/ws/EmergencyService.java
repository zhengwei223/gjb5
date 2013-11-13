package com.bm.gjb5.ws;

import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

/**
 * 地震应急启动结束接口
 * 
 * @author zhengwei lastmodified 2013年9月15日
 * 
 */
@WebService
// @SOAPBinding(style = Style.RPC)
public interface EmergencyService {
	/**
	 * 启动应急响应
	 * 

	 * @return 返回状态码： 0：失败 1：成功
	 * @throws Exception 
	 */
	@WebResult(name = "Status")
	String emergencyStart(@WebParam(name = "xmlFile") String xmlFile) throws Exception;

	/**
	 * 结束应急响应
	 * 
	 * @return 返回状态码： 0：失败 1：成功
	 */
	@WebResult(name = "Status")
	String emergencyStop(@WebParam(name = "xmlFile") String xmlFile);
}
