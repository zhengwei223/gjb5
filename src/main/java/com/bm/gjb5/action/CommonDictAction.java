package com.bm.gjb5.action;

import java.util.Hashtable;

import javacommon.base.BaseStruts2Action;
import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.bm.gjb5.model.CommonDict;
import com.bm.gjb5.service.CommonDictManager;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.vo.query.CommonDictQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


public class CommonDictAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/pages/CommonDict/query.jsp";
	protected static final String LIST_JSP= "/pages/CommonDict/list.jsp";
	protected static final String CREATE_JSP = "/pages/CommonDict/create.jsp";
	protected static final String EDIT_JSP = "/pages/CommonDict/edit.jsp";
	protected static final String SHOW_JSP = "/pages/CommonDict/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/CommonDict/list.do";
	
	private CommonDictManager commonDictManager;
	
	private CommonDict commonDict;
	java.lang.String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			commonDict = new CommonDict();
		} else {
			commonDict = (CommonDict)commonDictManager.getById(id);
		}
		getValueStack().set("tableList", DictUtil.getTables());
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setCommonDictManager(CommonDictManager manager) {
		this.commonDictManager = manager;
	}	
	
	public Object getModel() {
		return commonDict;
	}
	
	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		CommonDictQuery query = newQuery(CommonDictQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = commonDictManager.findPage(query);
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
		commonDictManager.save(commonDict);
		DictUtil.refresh(commonDict.getTableName(),commonDict.getFieldName());
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		commonDictManager.update(this.commonDict);
		DictUtil.refresh(commonDict.getTableName(),commonDict.getFieldName());
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("id"));
			commonDictManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		DictUtil.refresh(commonDict.getTableName(),commonDict.getFieldName());
		return LIST_ACTION;
	}

}
