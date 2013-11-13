package com.bm.gjb5.action.wstest;

import cn.org.rapid_framework.web.scope.Flash;

import com.bm.gjb5.ws.client.AppMonitor;

import javacommon.base.BaseStruts2Action;

public class AppMonitorAction extends BaseStruts2Action {
	public String send(){
		try {
			AppMonitor.send(runStaus);
			Flash.current().success("发送成功");
		} catch (Exception e) {
			Flash.current().error("发送失败"+e);
			e.printStackTrace();
		}
		return "/test/appMonitor.jsp";
	}
	private String runStaus;
	public String getRunStaus() {
		return runStaus;
	}
	public void setRunStaus(String runStaus) {
		this.runStaus = runStaus;
	}
	
}
