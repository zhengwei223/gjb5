package javacommon.shiro;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bm.gjb5.model.RightsUser;
import com.bm.gjb5.service.RightsUserManager;
import com.icss.resourceone.common.logininfo.UserInfo;
import com.icss.resourceone.sso.SSOException;
import com.icss.resourceone.sso.agent.SSOR1Agent;
import com.icss.resourceone.sso.client.SSORequestWrapper;
import com.icss.resourceone.sso.token.TokenException;
import com.icss.ro.framework.plugin.PluginException;

public class CaptchaFormAuthenticationFilter extends FormAuthenticationFilter {
	private static final Logger LOG = LoggerFactory
			.getLogger(CaptchaFormAuthenticationFilter.class);

	public CaptchaFormAuthenticationFilter() {
	}

	@Override
	/**
	 * 登录验证
	 */
	protected boolean executeLogin(ServletRequest request1,
			ServletResponse response) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request1;
		CaptchaUsernamePasswordToken token = createToken(req, response);
		String username = token.getUsername();
		boolean ignoreCaptcha = false;
		
		//#######SSO begin#######
		if (getCaptcha(req) == null) {// 可能是sso用户，进行确认
			req = new SSORequestWrapper((HttpServletRequest) req);
			SSOR1Agent sso = new SSOR1Agent(req, response);
			try {
				sso.init(getFilterConfig());
				sso.login();
			} catch (SSOException e) {
				LOG.info("SSO登录失败--" + e);
				return onLoginFailure(token, new AuthenticationException(e), request1, response);
			} catch (PluginException e) {
				LOG.info("SSO登录失败--" + e);
				return onLoginFailure(token, new AuthenticationException(e), request1, response);
			}
			//SSO认证成功
			ignoreCaptcha = true;//不做图形码验证
			UserInfo user = (UserInfo)req.getSession().getAttribute("_j2ee_user");
//			把数据放在token中，做本地验证
			token.setUsername(user.getName());
			token.setPassword(user.getPassword().toCharArray());
		}
		//#######SSO end#######
		
		try {
			/* 图形验证码验证 */
			if(!ignoreCaptcha)
				doCaptchaValidate((HttpServletRequest) request1, token);
			Subject subject = getSubject(request1, response);
			subject.login(token);// 正常验证

			LOG.info(username + "登录成功");
			RightsUser user = rightsUserManager.findByUsername(username);
			// 将用户信息及资源树存储在session中
			subject.getSession().setAttribute("roleName", user.getRightsRole().getName());
			subject.getSession().setAttribute("username", username);
			subject.getSession().setAttribute("userid", user.getId());
			subject.getSession().setAttribute("rscTreeNodes",
					rightsUserManager.getRscTreeNodes());
			return onLoginSuccess(token, subject, request1, response);
		} catch (AuthenticationException e) {
			LOG.info(token.getUsername() + "本地登录失败--" + e);

			return onLoginFailure(token, e, request1, response);
		}
	}

	// 验证码校验
	protected void doCaptchaValidate(HttpServletRequest request,
			CaptchaUsernamePasswordToken token) {
		// session中的图形码字符串
		String captcha = (String) request.getSession().getAttribute(
				com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		// 比对
		if (captcha != null && !captcha.equalsIgnoreCase(token.getCaptcha())) {
			throw new IncorrectCaptchaException("验证码错误！");
		}
	}

	@Override
	protected CaptchaUsernamePasswordToken createToken(ServletRequest request,
			ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		String captcha = getCaptcha(request);
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);

		return new CaptchaUsernamePasswordToken(username,
				password.toCharArray(), rememberMe, host, captcha);
	}

	public static final String DEFAULT_CAPTCHA_PARAM = "captcha";

	private String captchaParam = DEFAULT_CAPTCHA_PARAM;

	public String getCaptchaParam() {
		return captchaParam;
	}

	public void setCaptchaParam(String captchaParam) {
		this.captchaParam = captchaParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	// 保存异常对象到request
	@Override
	protected void setFailureAttribute(ServletRequest request,
			AuthenticationException ae) {
		request.setAttribute(getFailureKeyAttribute(), ae);
	}

	private RightsUserManager rightsUserManager;

	@Resource
	public void setRightsUserManager(RightsUserManager rightsUserManager) {
		this.rightsUserManager = rightsUserManager;
	}

}
