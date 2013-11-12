package com.bm.gjb5.action;

import java.util.List;

import com.bm.gjb5.model.SysEarthquake;
import com.bm.gjb5.service.SysEarthquakeManager;
import com.bm.gjb5.vo.query.SysEarthquakeQuery;
import com.opensymphony.xwork2.ModelDriven;

import javacommon.base.BaseStruts2Action;
/**
 * 处理当前会话中的地震事件的选择和切换问题
 * @author zhengwei lastmodified 2013年11月11日
 *
 */
public class EarthquakeAction extends BaseStruts2Action {
	/**
	 * 登录之后，选择一个地震事件
	 * @return
	 */
	public String toSelect(){
		SysEarthquakeQuery query = new SysEarthquakeQuery();
		query.setSortColumns("EVENT_TIME desc");
		List<SysEarthquake> quakes = sysEarthquakeManager.findPage(query).getResult();
		getValueStack().set("events", quakes);
		return "/start.jsp";
	}
	public String select(){
		session.put("event", sysEarthquakeManager.getById(eventId));
		return "!/index.jsp";
	}
	private SysEarthquakeManager sysEarthquakeManager;
	private String eventId;
	public void setSysEarthquakeManager(
			SysEarthquakeManager sysEarthquakeManager) {
		this.sysEarthquakeManager = sysEarthquakeManager;
	}
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	
}
