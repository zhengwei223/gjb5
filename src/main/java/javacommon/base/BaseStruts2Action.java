package javacommon.base;

import java.util.Map;

import javacommon.util.ConvertRegisterHelper;
import javacommon.util.PageRequestFactory;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.util.Assert;

import cn.org.rapid_framework.beanutils.BeanUtils;
import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.page.PageRequest;
import cn.org.rapid_framework.util.ObjectUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

@SuppressWarnings("all")
public abstract class BaseStruts2Action extends ActionSupport implements
		SessionAware, ApplicationAware, ParameterAware,ServletContextAware {
	protected final static String CREATED_SUCCESS = "创建成功";
	protected final static String UPDATE_SUCCESS = "更新成功";
	protected final static String UPDATE_FAILED = "更新失败";
	protected final static String DELETE_SUCCESS = "删除成功";

	protected Map<String, Object> session;
	protected Map application;
	protected Map<String, String[]> parameters;
	protected ServletContext servletContext;
	static {
		// 注册converters
		ConvertRegisterHelper.registerConverters();
	}

	public void copyProperties(Object target, Object source) {
		BeanUtils.copyProperties(target, source);
	}

	public <T> T copyProperties(Class<T> destClass, Object orig) {
		return BeanUtils.copyProperties(destClass, orig);
	}

	public void savePage(Page page, PageRequest pageRequest) {
		savePage("", page, pageRequest);
	}

	/**
	 * 用于一个页面有多个extremeTable是使用
	 * 
	 * @param tableId
	 *            等于extremeTable的tableId属性
	 */
	public void savePage(String tableId, Page page, PageRequest pageRequest) {
		Assert.notNull(tableId, "tableId must be not null");
		Assert.notNull(page, "page must be not null");

		getRequest().setAttribute(tableId + "page", page);
		getRequest().setAttribute(tableId + "totalRows",
				new Integer(page.getTotalCount()));
		getRequest().setAttribute(tableId + "pageRequest", pageRequest);
		getRequest().setAttribute(tableId + "query", pageRequest);
	}

	/**
	 * 绑定请求参数并设定分页数据
	 * 
	 * @param queryClazz
	 * @param defaultSortColumns
	 * @return
	 */
	public <T extends PageRequest> T newQuery(Class<T> queryClazz,
			String defaultSortColumns) {
		PageRequest query = PageRequestFactory.bindPageRequest(
				org.springframework.beans.BeanUtils
						.instantiateClass(queryClazz), ServletActionContext
						.getRequest(), defaultSortColumns);
		return (T) query;
	}

	public boolean isNullOrEmptyString(Object o) {
		return ObjectUtils.isNullOrEmptyString(o);
	}

	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	protected ValueStack getValueStack() {
		return ActionContext.getContext().getValueStack();
	}

	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.parameters = parameters;
	}

	protected String getParameter(String name, String dft) {
		String[] ps = parameters.get(name);
		if (null != ps && ps.length > 0) {
			return ps[0];
		}
		return dft;
	}
	@Override
	public void setServletContext(ServletContext context) {
		this.servletContext = context;
	}
}
