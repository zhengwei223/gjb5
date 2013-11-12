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
	 * @param eventId
	 *            事件id
	 * @param eventTime
	 *            发生时间
	 * @param location
	 *            地名
	 * @param longitude
	 *            经度
	 * @param latitude
	 *            纬度
	 * @param magnitude
	 *            震级
	 * @param depth
	 *            震源深度
	 * @return 返回状态码： 0：失败 1：成功
	 */
	@WebResult(name = "Status")
	String emergencyStart(@WebParam(name = "eventId") String eventId,
			@WebParam(name = "eventTime") Long eventTime,
			@WebParam(name = "location") String location,
			@WebParam(name = "longitude") String longitude,
			@WebParam(name = "latitude") String latitude,
			@WebParam(name = "magnitude") String magnitude,
			@WebParam(name = "depth") String depth);

	/**
	 * 结束应急响应
	 * 
	 * @param eventId
	 *            地震序列
	 * @param endTime
	 *            结束时间
	 * @return 返回状态码： 0：失败 1：成功
	 */
	@WebResult(name = "Status")
	String emergencyStop(@WebParam(name = "eventId") String eventId,
			@WebParam(name = "endTime") Long endTime);
}
