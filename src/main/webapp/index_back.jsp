<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>


<%
	if (session.getAttribute("event") == null) {
		response.sendRedirect("pages/Earthquake/toSelect.do");
	}
%>
<html>

<head>
<%@ include file="/commons/meta.jsp"%>
<script src="base.js"></script>
<title>GJB5</title>

<script>
	/** 自动调整div高度 */
	function autoResizeDivFunc() {
		var autoDivHeight = (document.documentElement.clientHeight || document.body.clientHeight)
				- $('#main').position().top;
		//alert(document.body.clientHeight);
		//alert($("body").width()*0.9);
		if ($.browser.msie) {
			//alert();
			$('#main iframe').height(autoDivHeight);
		} else {
			$('#main').height(autoDivHeight);
			//var rightWidth = Math.floor($("body").width()*0.9-$("#left").outerWidth());
			//alert(rightWidth);
			$('#right').width(990);
		}

	};

	$(document).ready(function() {
		if (window.top == window.self) {
			//alert('页面不是在框架中打开的');
		} else {
			window.top.location.href = '<s:url value="/index.jsp"/>';
		}
		autoResizeDivFunc();
		$(window).bind('resize', autoResizeDivFunc);
		show(1);

	});

	function show(index) {
		//alert();
		if (index == 2) {
			$("#rightFrame").attr('src', "${ctx }/html/初始页_1.html");
		}
		if (index == 1) {
			$("#rightFrame").attr('src', "${ctx }/html/初始页.html");
		}
		if (index == 3) {
			$("#rightFrame").attr('src', "${ctx }/html/影响场.html");
		}
		if (index == 4) {
			$("#rightFrame").attr('src', "${ctx }/html/初始页.html");
		}
	}
</script>
</head>
<body>
	<div class="contentAll">

		<%@ include file="/commons/messages.jsp"%>

		<div id="header">
			<div id="logo">
				<%-- <span class="userinfo">当前用户：${username } | 角色：${roleName } |
					<a href="#">修改密码</a> <a href="logout.do">退出</a>
				</span> --%>
				<img src="${ctx}/images/logo.gif" width="100%" height="80px" />
			</div>
		</div>

		<div>
			<div style="float: left">
				<s:a action="Earthquake/toSelect" namespace="/pages" cssClass="easyui-linkbutton" data-options="plain:true">首页</s:a>

				<a href="${ctx }/left1.jsp" target="leftFrame" onclick="show(1)" class="easyui-linkbutton" data-options="plain:true">灾情信息汇集</a>

				<shiro:hasAnyRoles name="系统管理员,系统操作员">
					<a href="${ctx }/left2.jsp" target="leftFrame" onclick="show(2)" class="easyui-linkbutton" data-options="plain:true">灾情信息处理</a>
				</shiro:hasAnyRoles>
				<a href="${ctx }/left3.jsp" target="leftFrame" onclick="show(3)" class="easyui-linkbutton" data-options="plain:true">灾情信息呈现</a>
				<shiro:hasAnyRoles name="系统管理员,系统操作员">
					<a href="${ctx }/left4.jsp" target="leftFrame" onclick="show(4)" class="easyui-linkbutton" data-options="plain:true">系统管理</a>
				</shiro:hasAnyRoles>
				<shiro:hasAnyRoles name="系统管理员,系统操作员">
					<a href="${ctx }/left4.jsp" target="leftFrame" onclick="show(4)" class="easyui-linkbutton" data-options="plain:true">灾情数据管理</a>
				</shiro:hasAnyRoles>
			</div>



			<div style="float: right">
				您好，${roleName }<a href="javascript:;" class="easyui-linkbutton" data-options="plain:true">修改密码</a> <a href="${ctx }/logout.do" class="easyui-linkbutton" data-options="plain:true">退出</a> 当前事件:
				<s:property value="#session.event.location" />
				<s:property value="#session.event.magnitude" />
				级

			</div>
		</div>
		<div id="main">
			<div id="left">
				<iframe name="leftFrame" width="100%" height="100%" src="${ctx }/left1.jsp" frameborder="0" scrolling="no"></iframe>
			</div>
			<div id="right">
				<iframe id="rightFrame" name="rightFrame" width="100%" height="100%" src="" frameborder="0" scrolling="auto"></iframe>
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
