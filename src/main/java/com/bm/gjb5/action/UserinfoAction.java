package com.bm.gjb5.action;

import java.net.MalformedURLException;
import java.util.Hashtable;

import javacommon.base.BaseStruts2Action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.bm.gjb5.model.Userinfo;
import com.bm.gjb5.service.UserinfoManager;
import com.bm.gjb5.vo.query.UserinfoQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
public class UserinfoAction extends BaseStruts2Action implements Preparable,ModelDriven{
	private static final Logger LOGGER = LoggerFactory.getLogger(UserinfoAction.class); 
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/pages/Userinfo/query.jsp";
	protected static final String LIST_JSP= "/pages/Userinfo/list.jsp";
	protected static final String CREATE_JSP = "/pages/Userinfo/create.jsp";
	protected static final String EDIT_JSP = "/pages/Userinfo/edit.jsp";
	protected static final String SHOW_JSP = "/pages/Userinfo/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/Userinfo/list.do";
	
	private UserinfoManager userinfoManager;
	
	private Userinfo userinfo;
	java.lang.String id = null;
	private String[] items;
	private String roleId;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			userinfo = new Userinfo();
		} else {
			userinfo = (Userinfo)userinfoManager.getById(id);
		}
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setUserinfoManager(UserinfoManager manager) {
		this.userinfoManager = manager;
	}	
	
	public Object getModel() {
		return userinfo;
	}
	
	public void setUuid(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	/** 执行搜索 */
	public String list() {
		UserinfoQuery query = newQuery(UserinfoQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = userinfoManager.findPage(query);
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
		userinfoManager.save(userinfo);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		userinfoManager.update(this.userinfo);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("uuid"));
			userinfoManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
//-----add----------
	/** 同步用户信息*/
	public String sync() {
		try {
			userinfoManager.sync();
		} catch (Exception e) {
			if(e instanceof MalformedURLException){
				Flash.current().error("同步失败:无法解析web服务地址");
			}else{
				Flash.current().error("同步失败!");
			}
			LOGGER.error("用户同步失败", e);
		}
		return LIST_ACTION;
	}
	/**在本地激活**/
	public String activate(){
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("uuid"));
			userinfoManager.activate(id,roleId);
		}
		Flash.current().success("激活成功");
		return LIST_ACTION;
	}
}
