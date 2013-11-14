package com.bm.gjb5.action.wstest;

import javacommon.base.BaseStruts2Action;
import cn.org.rapid_framework.web.scope.Flash;

import com.opensymphony.xwork2.ModelDriven;
import com.bm.gjb5.ws.client.DataUpdate;
import com.bm.gjb5.ws.client.DataUpdateBean;

public class DataUpdateAction  extends BaseStruts2Action implements ModelDriven<DataUpdateBean>{
	private DataUpdateBean dataUpdateBean = new DataUpdateBean();
	@Override
	public DataUpdateBean getModel() {
		return dataUpdateBean;
	}
	
	public String send(){
		try {
			DataUpdate.send(dataUpdateBean);
			Flash.current().success("调用成功"); 
		} catch (Exception e) {
			Flash.current().error("调用发生异常"+e); 
			e.printStackTrace();
		}
		return "/test/dataUpdate.jsp";
	}
}
