package com.bm.gjb5.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import cn.org.rapid_framework.beanutils.BeanUtils;
import cn.org.rapid_framework.web.scope.Flash;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.ModelDriven;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.vo.query.*;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


public class SysEarthquakeAction extends BaseStruts2Action implements Preparable,ModelDriven<SysEarthquake>{
	//默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = "eventTime desc"; 
	
	//forward paths
	protected static final String QUERY_JSP = "/pages/SysEarthquake/query.jsp";
	protected static final String LIST_JSP= "/pages/SysEarthquake/list.jsp";
	protected static final String CREATE_JSP = "/pages/SysEarthquake/create.jsp";
	protected static final String EDIT_JSP = "/pages/SysEarthquake/edit.jsp";
	protected static final String SHOW_JSP = "/pages/SysEarthquake/show.jsp";
	//redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/SysEarthquake/list.do";
	
	private SysEarthquakeManager sysEarthquakeManager;
	
	private SysEarthquake sysEarthquake;
	java.lang.String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			sysEarthquake = new SysEarthquake();
		} else {
			sysEarthquake = (SysEarthquake)sysEarthquakeManager.getById(id);
		}
		getValueStack().set("statusList", DictUtil.getDictMap("sys_earthquake", "status"));
	}
	
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setSysEarthquakeManager(SysEarthquakeManager manager) {
		this.sysEarthquakeManager = manager;
	}	
	
	public SysEarthquake getModel() {
		return sysEarthquake;
	}
	
	public void setEventId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}
	
	/** 执行搜索 */
	public String list() {
		SysEarthquakeQuery query = newQuery(SysEarthquakeQuery.class,DEFAULT_SORT_COLUMNS);
		
		Page page = sysEarthquakeManager.findPage(query);
		savePage(page,query);
		return LIST_JSP;
	}
	/** 写出最近10个地震时间组成的json字符串，共页面进行视图构建
	 * @throws IOException */
	public String listJson() throws IOException {
		SysEarthquakeQuery query = newQuery(SysEarthquakeQuery.class,DEFAULT_SORT_COLUMNS);
		query.setPageSize(10);
		query.setStatus(1);
		Page page = sysEarthquakeManager.findPage(query);
		List<SysEarthquake> earthquakes = page.getResult();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setJsonPropertyFilter(new PropertyFilter() {
			@Override
			public boolean apply(Object source, String name, Object value) {
				Object[] array = new String[]{"eventId","eventTimeString","location"};
				return !ArrayUtils.contains(array , name);
			}
		});
		JSONArray jsonObject = JSONArray.fromObject(earthquakes, jsonConfig );
		PrintWriter writer = getResponse().getWriter();
		writer.println(jsonObject.toString());
		writer.flush();
		writer.close();
//		savePage(page,query);
		return null;
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
		sysEarthquake.setEventId(StringUtils.remove(UUID.randomUUID().toString(), "-"));
		sysEarthquakeManager.save(sysEarthquake);
		Flash.current().success(CREATED_SUCCESS); //存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}
	
	/**进入更新页面*/
	public String edit() {
		return EDIT_JSP;
	}
	
	/**保存更新对象*/
	public String update() {
		sysEarthquakeManager.update(this.sysEarthquake);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}
	
	/**删除对象*/
	public String delete() {
		for(int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String((String)params.get("eventId"));
			sysEarthquakeManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

}
