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
	 * 
	 * @param eventId
	 *            地震序列
	 * @param sysytem
	 *            系统名称
	 * @param order
	 *            命令 1：快速评估 2：辅助决策 3：语音短信平台 4：灾情收集 5：专家协同 6：专业协同 7：动态评估
	 * 
	 * @return 返回状态码： 0：失败 1：成功
	 */
	@WebResult(name = "Status")
	String controlCommand(@WebParam(name = "eventId") String eventId,
			@WebParam(name = "sysytem") String sysytem,
			@WebParam(name = "order") int order);

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
	@WebResult(name = "Status")
	String appMonitor(@WebParam(name = "sysytem") String sysytem,
			@WebParam(name = "reportTime") long reportTime,
			@WebParam(name = "runStaus") String runStaus);
}
