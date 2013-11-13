package com.bm.gjb5.action.wstest;

import cn.org.rapid_framework.web.scope.Flash;

import com.bm.gjb5.ws.client.ExceptionSender;

/**
 * 想控制中心发送异常信息
 * @author zhengwei lastmodified 2013年11月10日
 *
 */
public class AppExceptionAction {
	private int level;
	private String exceptionMessage;

	public String send(){
		try {
			ExceptionSender.send(level, exceptionMessage);
			Flash.current().success("发送成功");
		} catch (Exception e) {
			Flash.current().error("发送失败:"+e);
		}
		return "/test/sendException.jsp";
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getExceptionMessage() {
		return exceptionMessage;
	}

	public void setExceptionMessage(String exceptionMessage) {
		this.exceptionMessage = exceptionMessage;
	}
}
