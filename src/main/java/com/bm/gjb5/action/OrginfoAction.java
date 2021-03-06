package com.bm.gjb5.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.org.rapid_framework.beanutils.BeanUtils;
import cn.org.rapid_framework.web.scope.Flash;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.ModelDriven;

import java.util.*;
import java.lang.reflect.*;
import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.service.*;
import com.bm.gjb5.vo.query.*;
import org.slf4j.*;
public class OrginfoAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/pages/Orginfo/query.jsp";
	protected static final String LIST_JSP= "/pages/Orginfo/list.jsp";
	protected static final String CREATE_JSP = "/pages/Orginfo/create.jsp";
	protected static final String EDIT_JSP = "/pages/Orginfo/edit.jsp";
	protected static final String SHOW_JSP = "/pages/Orginfo/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/Orginfo/list.do";
	
	private OrginfoManager orginfoManager;
	
	private Orginfo orginfo;
	java.lang.String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			orginfo = new Orginfo();
		} else {
			orginfo = (Orginfo)orginfoManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setOrginfoManager(OrginfoManager manager) {
		this.orginfoManager = manager;
	}	
	
	public Object getModel() {
		return orginfo;
	}
	
	public void setOrguuid(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		OrginfoQuery query = newQuery(OrginfoQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = orginfoManager.findPage(query);
		savePage(page,query);
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}
	
	/** 进入新增页面*/
	public String create() {
		return CREATE_JSP;
	}
	
	/** 保存新增对象 */
	public String save() {
		orginfoManager.save(orginfo);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		orginfoManager.update(this.orginfo);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("orguuid"));
			orginfoManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

}
