package javacommon.struts2.interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.MDC;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * 提供视图渲染的共享变量拦截器
 * 
 * @author badqiu
 * 
 */
public class SharedRenderVariableInterceptor implements Interceptor {
	/**
	 * 
	 */
	private static final long serialVersionUID = 985668207527158469L;

	static Log log = LogFactory.getLog(SharedRenderVariableInterceptor.class);

	// 系统启动并初始化一次的变量
	Map<String, Object> globalRenderVariables = new HashMap<String, Object>();

	public String intercept(ActionInvocation invocation) throws Exception {
		before(invocation);
		String result = invocation.invoke();
		return result;
	}

	private void before(ActionInvocation invocation) {
		log.debug("请注意,在这里可以存放渲染视图时需要的的共享变量");
		ValueStack vs = invocation.getInvocationContext().getValueStack();
		for (String key : globalRenderVariables.keySet()) {
			vs.set(key, globalRenderVariables.get(key));
		}

		preRequest(vs, invocation);
	}

	private void preRequest(ValueStack vs, ActionInvocation invocation) {
		vs.set("share_current_request_time", new Date());
		vs.set("share_current_remote_ip", StringUtils
				.defaultString(ServletActionContext.getRequest()
						.getRemoteAddr()));
		// action类名存起来
		vs.set("share_current_action_class_name", invocation.getAction()
				.getClass().getSimpleName());
		MDC.put("share_current_action_class_name", invocation.getAction()
				.getClass().getSimpleName());
	}

	// 注意,如果变量是global,请尽量增加global前缀
	private void initSharedRenderVariables() {
		globalRenderVariables.put("global_system_start_time", new Date());
	}

	public void destroy() {
	}

	public void init() {
		initSharedRenderVariables();
	}

}
