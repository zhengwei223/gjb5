<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=RightsRole.TABLE_ALIAS%>编辑</title>
<!-- 	
<link rel="stylesheet" href="css/demo.css" type="text/css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css"> -->
<!-- <script type="text/javascript" src="js/jquery-1.4.4.min.js"> -->
	
</script>
<%-- <script type="text/javascript" src="js/jquery.ztree.core-3.5.js">
	
</script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js">
	
</script>
<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js">
	
</script>
<script type="text/javascript" src="js/json2.js">
	
</script>
	<SCRIPT type="text/javascript">
		var zNodes =<s:property value="jsonString" escape="false"/>;
		var ctx = "<%=request.getContextPath()%>";
	</SCRIPT>
	<script type="text/javascript" src="pages/RightsRole/edit.js">
	
</script> --%>
</rapid:override>

<rapid:override name="content">
<h1>角色及权限配置</h1>
<div style="width: 50%;float: left">
	<s:form action="/pages/RightsRole/update.do" method="post">
		<table class="formTable" >
		<%@ include file="form_include.jsp" %>
		<tr>
			<td></td>
			<td>
				<a class="easyui-linkbutton" data-options="plain:true" onclick="$('#update').submit()" >提交</a>
				<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/RightsRole/list.do'" >返回列表</a>
				<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
			</td>
		</tr>
		</table>
	</s:form>
</div>
	
	<!-- <div class="zTreeDemoBackground left" style="width: 40%;float: left">
		<ul id="treeDemo" class="ztree"></ul>
	</div> -->
	
</rapid:override>

<%@ include file="base.jsp" %>