package com.bm.gjb5.action;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javacommon.base.BaseStruts2Action;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.shiro.SecurityUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.util.StringUtils;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.bm.gjb5.model.RightsResource;
import com.bm.gjb5.model.RightsRole;
import com.bm.gjb5.service.RightsResourceManager;
import com.bm.gjb5.service.RightsRoleManager;
import com.bm.gjb5.service.RightsUserManager;
import com.bm.gjb5.vo.query.RightsRoleQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


public class RightsRoleAction extends BaseStruts2Action implements Preparable,ModelDriven{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null; 
	
	//forward paths
	protected static final String QUERY_JSP = "/pages/RightsRole/query.jsp";
	protected static final String LIST_JSP= "/pages/RightsRole/list.jsp";
	protected static final String CREATE_JSP = "/pages/RightsRole/create.jsp";
	protected static final String EDIT_JSP = "/pages/RightsRole/edit.jsp";
	protected static final String SHOW_JSP = "/pages/RightsRole/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/RightsRole/list.do";
	
	private RightsRoleManager rightsRoleManager;
	
	private RightsRole rightsRole;
	java.lang.String id = null;
	private String[] items;

	private String jsonString;
//	private RightsResourceManager rightsResourceManager;

	private RightsUserManager rightsUserManager;
//	private List<RightsResource> allResource(boolean chkDisabled) {
//		List<RightsResource> resources = rightsResourceManager.findAll();
//		List<RightsResource> resourcesOfRole = rightsRole.getResourses();
//			
//		for (RightsResource rightsResource : resources) {
//			rightsResource.setChkDisabled(chkDisabled);
//			if (resourcesOfRole.contains(rightsResource)) {
//				rightsResource.setChecked(true);//判定是否属于当前角色
//			}
//		}
//		Collections.sort(resources);//排序
//		return resources;
//	}



	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			rightsRole = new RightsRole();
		} else {
			rightsRole = (RightsRole)rightsRoleManager.getById(id);
		}
	}
	

	
	public Object getModel() {
		return rightsRole;
	}
	
	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		RightsRoleQuery query = newQuery(RightsRoleQuery.class,DEFAULT_SORT_COLUMNS);
		Page page = rightsRoleManager.findPage(query);
		savePage(page,query);
		return LIST_JSP;
	}
	
	/** 查看对象*/
	public String show() {
//		List<RightsResource> resources = allResource(true);
//		JsonConfig config = new JsonConfig();
//		config.setExcludes(new String[]{"children","rightsResource","resourses","rightsMappings","descp","drag","noRemove","noRename","url"});
		//构造JSON字符串共前端显示
//		jsonString = JSONArray.fromObject(resources,config).toString();
		
		return SHOW_JSP;
	}



	/** 进入新增页面*/
	public String create() {
//		List<RightsResource> resources = rightsResourceManager.findAll();
//		JsonConfig config = new JsonConfig();
//		config.setExcludes(new String[]{"children","rightsResource","resourses","rightsMappings","descp","drag","noRemove","noRename","url"});
//		jsonString = JSONArray.fromObject(resources,config).toString();
		return CREATE_JSP;
	}
	
	/** 保存新增的角色*/
	public String save() {
		rightsRoleManager.save(rightsRole);
//		String attr = getRequest().getParameter("json");
//		JsonConfig config = new JsonConfig();
//		config.setExcludes(new String[]{"parentTId"});
//		JSONArray array = JSONArray.fromObject(attr,config);
//		Map classMap = new HashMap();
//		classMap.put("children", RightsResource.class);
//		List<RightsResource> resources = JSONArray.toList(array,
//				RightsResource.class, classMap);
//		rightsRoleManager.handleResource(rightsRole,resources);
//		
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return null;
	}
	
	/**进入更新页面*/
	public String edit() {
//		List<RightsResource> resources = allResource(false);
//		JsonConfig config = new JsonConfig();
//		config.setExcludes(new String[]{"children","rightsResource","resourses","rightsMappings","descp","drag","noRemove","noRename","url"});
//		jsonString = JSONArray.fromObject(resources,config).toString();
		return EDIT_JSP;
	}
	
	/**保存更新对象，在这里需要处理对角色的授权
	 * @throws IOException */
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	@CacheEvict(value="shiroAuthorizationCache",allEntries=true)//刷新权限缓存
	public String update() throws Exception {
		try {
			rightsRoleManager.update(this.rightsRole);
//			String attr = getRequest().getParameter("json");
//			JsonConfig config = new JsonConfig();
//			config.setExcludes(new String[]{"parentTId"});
//			JSONArray array = JSONArray.fromObject(attr,config);
//			Map classMap = new HashMap();
//			classMap.put("children", RightsResource.class);
//			List<RightsResource> resources = JSONArray.toList(array,
//					RightsResource.class, classMap);
//			rightsRoleManager.handleResource(rightsRole,resources);
			Flash.current().success(UPDATE_SUCCESS);
		} catch (Exception e) {
			Flash.current().success(UPDATE_FAILED);
			//throw e;
		}
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("id"));
			rightsRoleManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}
	
	public void setRightsUserManager(RightsUserManager rightsUserManager) {
		this.rightsUserManager = rightsUserManager;
	}
//	public void setRightsResourceManager(RightsResourceManager manager) {
//		this.rightsResourceManager = manager;
//	}

	public void setRightsRoleManager(RightsRoleManager manager) {
		this.rightsRoleManager = manager;
	}	
	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}
	

}
