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
import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.service.*;
import com.bm.gjb5.vo.query.*;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

public class DataIdentifyAction extends BaseStruts2Action implements
		Preparable, ModelDriven {
	// 默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null;

	// forward paths
	protected static final String QUERY_JSP = "/pages/DataIdentify/query.jsp";
	protected static final String LIST_JSP = "/pages/DataIdentify/list.jsp";
	protected static final String CREATE_JSP = "/pages/DataIdentify/create.jsp";
	protected static final String EDIT_JSP = "/pages/DataIdentify/edit.jsp";
	protected static final String SHOW_JSP = "/pages/DataIdentify/show.jsp";
	// redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/DataIdentify/list.do";

	/** 执行搜索 */
	public String list() {
		DataIdentifyQuery query = newQuery(DataIdentifyQuery.class,
				DEFAULT_SORT_COLUMNS);

		Page page = dataIdentifyManager.findPage(query);
		savePage(page, query);
		return LIST_JSP;
	}

	/** 查看对象 */
	public String show() {
		return SHOW_JSP;
	}

	/** 进入新增页面 */
	public String create() {
		return CREATE_JSP;
	}

	/** 保存新增对象 */
	public String save() {
		dataIdentify.setCreateTime(new Date());
		dataIdentifyManager.save(dataIdentify);
		Flash.current().success(CREATED_SUCCESS); // 存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}

	/** 进入更新页面 */
	public String edit() {
		return EDIT_JSP;
	}

	/** 保存更新对象 */
	public String update() {
		dataIdentifyManager.update(this.dataIdentify);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}

	/** 删除对象 */
	public String delete() {
		for (int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String(
					(String) params.get("id"));
			dataIdentifyManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	// add by zhengwei

	public String dispatch() {
		String originalId = getParameter("data_ori_id", "");
		try {
			DataIdentify _dataIdentify = dataIdentifyManager.findByOriginal(originalId);
			//呈现原始数据
			getValueStack().set("dataOriginal", dataOriginalManager.getById(originalId));
			if(null!=_dataIdentify){//更改
				dataIdentify = _dataIdentify;
				getValueStack().push(dataIdentify);;
				return edit();
			}else {//新增
				return create();
			}
		} catch (Exception e) {
			LOG.error("还未识别", e);
			return create();
		}
		
	}

	// ----property---------------
	private DataIdentifyManager dataIdentifyManager;
	private DataOriginalManager dataOriginalManager;
	private DataIdentify dataIdentify;
	java.lang.String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			dataIdentify = new DataIdentify();
		} else {
			dataIdentify = (DataIdentify) dataIdentifyManager.getById(id);
		}
	}

	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setDataIdentifyManager(DataIdentifyManager manager) {
		this.dataIdentifyManager = manager;
	}

	public void setDataOriginalManager(DataOriginalManager dataOriginalManager) {
		this.dataOriginalManager = dataOriginalManager;
	}

	public Object getModel() {
		return dataIdentify;
	}

	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
}
