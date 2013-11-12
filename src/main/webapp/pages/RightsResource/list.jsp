<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<%@ include file="/commons/meta.jsp"%>
<TITLE>系统资源树</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/demo.css" type="text/css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<%-- <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> --%>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js"></script>
<%-- <script type="text/javascript" src="js/jquery.skygqbox.1.3.js"></script> --%>
<script type="text/javascript">
	var zNodes = <s:property value="jsonString" escape="false"/>;
	var basePath = "<%=basePath%>";
</script>

<script type="text/javascript" src="pages/RightsResource/rscList.js"></script>
<style type="text/css">
.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top;
	vertical-align: middle;
}

.left {
	text-align: center;
	margin-left: 0 auto;
}
</style>
</head>
<body>
	<%-- <s:property value="jsonString" escape="false"/> --%>
	<h1>
		系统资源配置
		<shiro:hasPermission name="RightsResource:save">
		<input type="button" value="保存系统资源树" id="all_submit" >
		</shiro:hasPermission>
	</h1>
	<div class="content_wrap">
		<div class="zTreeDemoBackground left">
			<ul id="treeDemo" class="ztree">
			</ul>
		</div>

		<div id="overlayDiv" class="easyui-dialog" closed="true" modal="true" title="编辑节点" style="padding: 30px; width: 700px">
			<s:form theme="xhtml">
				<s:textfield name="name" id="node_name" size="20" label="名称"></s:textfield>
				<s:textfield name="url" id="node_url"	size="80"  label="URL" ></s:textfield>
				<s:textarea name="descp" id="node_descp" cols="20" rows="5" label="描述"></s:textarea>
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="overlay_sub" onclick="javascript:alert('save')">Save</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="overlay_cancle" onclick="javascript:$('#dlg').dialog('close')">Close</a> -->
			</s:form>
		</div>
	</div>
</body>
</html>