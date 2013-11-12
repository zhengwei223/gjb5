package com.bm.gjb5.action;

import javacommon.base.BaseStruts2Action;
import cn.org.rapid_framework.web.scope.Flash;

import com.bm.gjb5.service.SysEarthquakeManager;
import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.vo.query.SysEarthquakeQuery;
import com.bm.gjb5.ws.client.CooperationControlFeedback;

/**
 * 向控制中心发送协同控制反馈
 * @author zhengwei lastmodified 2013年11月9日
 *
 */
public class ControlFeedbackAction extends BaseStruts2Action{
	public String toFeedBack(){
		SysEarthquakeQuery query = new SysEarthquakeQuery();
		query.setSortColumns("event_time desc");
//		getValueStack().set("events", sysEarthquakeManager.findPage(query).getResult());
		getValueStack().set("orders", AppProperties.getOrders());
		return "/test/feedBack.jsp";
	}
	public String feedBack(){
		try {
			CooperationControlFeedback.controlFeedback(eventId, order, performance, failuneReasons);
			Flash.current().success("调用成功"); 
		} catch (Exception e) {
			Flash.current().error("调用发生异常"+e); 
		}
		return toFeedBack();
	}
	//---------------------
	private SysEarthquakeManager sysEarthquakeManager;
	public void setSysEarthquakeManager(
			SysEarthquakeManager sysEarthquakeManager) {
		this.sysEarthquakeManager = sysEarthquakeManager;
	}
	
	private String eventId;
	private int order;
	private String performance;
	private String failuneReasons;
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public String getPerformance() {
		return performance;
	}
	public void setPerformance(String performance) {
		this.performance = performance;
	}
	public String getFailuneReasons() {
		return failuneReasons;
	}
	public void setFailuneReasons(String failuneReasons) {
		this.failuneReasons = failuneReasons;
	}
	
}
