package com.bm.gjb5.action;

import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;

import javacommon.base.BaseStruts2Action;
import javacommon.gather.bean.GrabageSiteconfig;
import javacommon.gather.bean.Pageinfo;
import javacommon.gather.read.GrabageReader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.bm.gjb5.service.GrabageSiteconfigManager;
import com.bm.gjb5.service.PageinfoManager;
import com.bm.gjb5.system.LogBusiUtils;
import com.bm.gjb5.system.LogBusiUtils.DbOpType;
import com.bm.gjb5.vo.query.GrabageSiteconfigQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class GrabageSiteconfigAction extends BaseStruts2Action implements
		Preparable, ModelDriven {
	private static final Logger LOGGER = LoggerFactory.getLogger(GrabageSiteconfigAction.class);
	// 默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null;

	// forward paths
	protected static final String QUERY_JSP = "/pages/GrabageSiteconfig/query.jsp";
	protected static final String LIST_JSP = "/pages/GrabageSiteconfig/list.jsp";
	protected static final String CREATE_JSP = "/pages/GrabageSiteconfig/create.jsp";
	protected static final String EDIT_JSP = "/pages/GrabageSiteconfig/edit.jsp";
	protected static final String SHOW_JSP = "/pages/GrabageSiteconfig/show.jsp";
	// redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/GrabageSiteconfig/list.do";

	private GrabageSiteconfigManager grabageSiteconfigManager;

	private GrabageSiteconfig grabageSiteconfig;
	java.lang.String id = null;
	private String[] items;

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			grabageSiteconfig = new GrabageSiteconfig();
		} else {
			grabageSiteconfig = (GrabageSiteconfig) grabageSiteconfigManager
					.getById(id);
		}
	}

	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setGrabageSiteconfigManager(GrabageSiteconfigManager manager) {
		this.grabageSiteconfigManager = manager;
	}

	public Object getModel() {
		return grabageSiteconfig;
	}

	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}

	/** 执行搜索 */
	public String list() {
		GrabageSiteconfigQuery query = newQuery(GrabageSiteconfigQuery.class,
				DEFAULT_SORT_COLUMNS);

		Page page = grabageSiteconfigManager.findPage(query);
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
		grabageSiteconfigManager.save(grabageSiteconfig);
		Flash.current().success(CREATED_SUCCESS); // 存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}

	/** 进入更新页面 */
	public String edit() {
		return EDIT_JSP;
	}

	/** 保存更新对象 */
	public String update() {
		grabageSiteconfigManager.update(this.grabageSiteconfig);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}

	/** 删除对象 */
	public String delete() {
		for (int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String(
					(String) params.get("id"));
			grabageSiteconfigManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	//----------- add by zhengwei 20130920
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String collect() {
		List<Pageinfo> pageInfos = new LinkedList<Pageinfo>();
		for (int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String(
					(String) params.get("id"));
			GrabageSiteconfig config = grabageSiteconfigManager.getById(id);
			try {
				pageInfos.addAll(new GrabageReader(config).getPageInfos());
			} catch (Exception e) {
				LOGGER.error("采集错误", e);
				session.put("progress_msg_sub", "采集错误"+e.getMessage());
				return null;
			}
		}
		try {
			session.put("progress_msg_sub", "开始存储");
			for (Pageinfo pageinfo : pageInfos) {
				pageinfoManager.save(pageinfo);
			}
			session.put("progress_msg_sub", "存储完成");
			LogBusiUtils.log("采集了"+pageInfos.size()+"个页面的内容", DbOpType.INSERT);
		} catch (Exception e) {
			LOGGER.error("存储错误", e);
			session.put("progress_msg_sub", "存储错误"+e.getMessage());
		}
		return null;
	}
	
	private PageinfoManager pageinfoManager;
	public void setPageinfoManager(PageinfoManager pageinfoManager) {
		this.pageinfoManager = pageinfoManager;
	}
}
