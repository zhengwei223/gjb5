<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>未授权的访问</title>
</head>
<body>
	<h3>未授权的访问</h3>
	<p>
		您没有访问该页面的权限。返回 <a href="<c:url value="/index.jsp"/>">首页</a>或退回<a
			href="javascript:void(0)" onclick="history.back();">上一页</a>。
	</p>
</body>
</html>
