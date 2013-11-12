package com.bm.gjb5.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.org.rapid_framework.beanutils.BeanUtils;
import cn.org.rapid_framework.web.scope.Flash;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.ModelDriven;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;
import javacommon.util.db.ConvenientTools;
import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.service.*;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.vo.query.*;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


public class LogBusiAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/pages/LogBusi/query.jsp";
	protected static final String LIST_JSP= "/pages/LogBusi/list.jsp";
	protected static final String CREATE_JSP = "/pages/LogBusi/create.jsp";
	protected static final String EDIT_JSP = "/pages/LogBusi/edit.jsp";
	protected static final String SHOW_JSP = "/pages/LogBusi/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/LogBusi/list.do";
	
	private LogBusiManager logBusiManager;
	
	private LogBusi logBusi;
	java.lang.String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			logBusi = new LogBusi();
		} else {
			logBusi = (LogBusi)logBusiManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setLogBusiManager(LogBusiManager manager) {
		this.logBusiManager = manager;
	}	
	
	public Object getModel() {
		return logBusi;
	}
	
	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		LogBusiQuery query = newQuery(LogBusiQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = logBusiManager.findPage(query);
		savePage(page,query);
		getValueStack().set("eqIdList", ConvenientTools.getLists("select event_id from sys_earthquake"));
		getValueStack().set("opUserList", ConvenientTools.getMaps("select id,username from rights_user"));
		getValueStack().set("submoduleList", DictUtil.getSubModules());
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
		return SHOW_JSP;
	}
	

}
