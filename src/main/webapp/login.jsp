<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@page import="javacommon.shiro.IncorrectCaptchaException"%>
<%@page import="org.apache.shiro.authc.AuthenticationException"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	SecurityUtils.getSubject().logout();
%>
<html>

<head>
<%@ include file="/commons/meta.jsp"%>
<%@ include file="/commons/meta_validation.jsp"%>
<title>GJB5</title>
<script>
	function refreshCaptcha() {
		document.getElementById("img_captcha").src = "${ctx}/images/kaptcha.jpg?t="
				+ Math.random();
	}
	$(function() {
		if (window.top == window.self) {
			//alert('页面不是在框架中打开的');
		} else {
			window.top.location.href = '<s:url value="/login.jsp"/>';
		}
	});
</script>
<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<div class="contentAll">
		<%@ include file="/commons/messages.jsp"%>

		<div>
			<div id="logo"><img src="${ctx}/images/logo.gif" width="100%"/></div>
		</div>

		<div>
			<div id="u22_img">
				<img class="raw_image" src="${ctx }/images/u22_normal.jpg" />
			</div>
			<div class="panel" style="width:400px;margin: 50px 0 0 50px;">
			
			<div  class="easyui-panel"   >
				<%
					Object obj = request
							.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
					String msg = "";
					if (obj != null) {
						if (obj instanceof IncorrectCaptchaException)
							msg = "验证码错误！";
						else
							msg = "账号或密码错误，或账号已过期！";
					}

					out.println("<div class='error'>" + msg + "</div>");
				%>
				<form action="login.jsp" method="post" id="ff">
					<input type="hidden" name="rememberMe" value="true" /> <br />
					<table>

						<tr>
							<td>用户名：</td>
							<td><input type="text" name="username" id="username"
								value="admin" class=":required" /></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" name="password" id="password"
								value="123456" class=":required" /></td>
						</tr>
						<!-- <tr>
							<td>验证码：</td>
							<td><input type="text" name="captcha" class=":required" /></td>
						</tr> -->
						<!-- <tr>
							<td>&nbsp;</td>
							<td><img alt="验证码" src="images/kaptcha.jpg" title="点击更换"
								id="img_captcha" onclick="javascript:refreshCaptcha();">(看不清<a
								href="javascript:void(0)" onclick="javascript:refreshCaptcha()">换一张</a>)</td>
						</tr> -->
						<tr>
							<td></td>
							<td><a class="easyui-linkbutton" onclick="$('#ff').submit();">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="easyui-linkbutton" onclick="$('#ff').reset();">重置</a></td>
						</tr>
					</table>

				</form>
			</div>
			</div>
		</div>

		<div class="u14_line" id="u14_line"></div>
		<div class="footer_div">
			<p>&nbsp;&nbsp;主办单位：中国地震台网中心</p>
			<p>&nbsp;&nbsp;技术支持：中国地震台网中心信息网络部数据共享与信息服务组</p>
		</div>
		<div class="footer_div">
			<p>&nbsp;&nbsp;地址：北京市西城区三里河南横街5号</p>
			<p>&nbsp;&nbsp;邮编：100045邮箱：webmaster@seis.ac.cn</p>
		</div>
		<div class="footer_div">
			<p>&nbsp;&nbsp;京ICP备06028819号</p>
			<p>&nbsp;&nbsp;中国地震局 版权所有</p>
		</div>
		<div class="footer_div_img">
			<img class="raw_image" src="${ctx }/images/u20_normal.gif" />
		</div>
	</div>
</body>
</html>
