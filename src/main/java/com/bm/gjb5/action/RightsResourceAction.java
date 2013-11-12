package com.bm.gjb5.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javacommon.base.BaseStruts2Action;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.bm.gjb5.model.RightsResource;
import com.bm.gjb5.service.RightsResourceManager;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */
@SuppressWarnings("all")
public class RightsResourceAction extends BaseStruts2Action {
	// forward paths
	protected static final String LIST_JSP = "/pages/RightsResource/list.jsp";

	/** 展现资源树 */
	public String list() {
		List<RightsResource> resources = rightsResourceManager.findAll();
		Collections.sort(resources);
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "children", "rightsResource","rightsMappings","resourses" });
		getValueStack().set("jsonString",JSONArray.fromObject(resources, config).toString());
		return LIST_JSP;
	}

	/**
	 * 处理系统资源的修改
	 * 
	 * @throws IOException
	 */
	public String save() throws IOException {
		String attr = getRequest().getParameter("json");
		// attr = StringUtils.trimAllWhitespace(attr);
		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "parentTId" });
		JSONArray array = JSONArray.fromObject(attr, config);
		Map classMap = new HashMap();
		classMap.put("children", RightsResource.class);
		List<RightsResource> resources = JSONArray.toList(array,
				RightsResource.class, classMap);
		rightsResourceManager.handleResource(resources);
		/*回写数据*/
		Map<String, String> map = new HashMap<String, String>();
		map.put("info", "1");
		PrintWriter writer = getResponse().getWriter();
		writer.println(JSONObject.fromObject(map).toString());
		writer.flush();
		writer.close();
		return null;
	}
	
	//---------fields-------
	private RightsResourceManager rightsResourceManager;
	public void setRightsResourceManager(RightsResourceManager manager) {
		this.rightsResourceManager = manager;
	}

}
