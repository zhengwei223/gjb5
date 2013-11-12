package com.bm.gjb5.action;

import cn.org.rapid_framework.web.scope.Flash;

import com.bm.gjb5.ws.client.RecordSender;

/**
 * 向控制中心发送应用记录
 * @author zhengwei lastmodified 2013年11月10日
 *
 */
public class AppRecordAction {
	private String logtitle;
	private String logmessage;
	private String eventId;

	public String send(){
		try {
			RecordSender.send(logtitle, logmessage, eventId);
			Flash.current().success("发送成功");
		} catch (Exception e) {
			Flash.current().error("发送失败"+e);
		}
		return "/test/sendAppRecord.jsp";
	}

	public String getLogtitle() {
		return logtitle;
	}

	public void setLogtitle(String logtitle) {
		this.logtitle = logtitle;
	}

	public String getLogmessage() {
		return logmessage;
	}

	public void setLogmessage(String logmessage) {
		this.logmessage = logmessage;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	
	
}
