<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=RightsRole.TABLE_ALIAS%>信息</title>
	<!-- 	<link rel="stylesheet" href="css/demo.css" type="text/css">
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
		type="text/css">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js">
		
	</script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js">
		
	</script>
	<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js">
		
	</script>
	<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js">
		
	</script>
	<script type="text/javascript" src="js/json2.js">
		
	</script>
	<SCRIPT type="text/javascript">
		var zNodes = <s:property value="jsonString" escape="false"/>;
		var setting = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId",
						rootPId: 0
					}
				}
			};
			
			
			$(document).ready(function(){
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			});
	</SCRIPT> -->
</rapid:override>

<rapid:override name="content">
<div style="width: 50%;float: left">
	<s:form action="/pages/RightsRole/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/RightsRole/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=RightsRole.ALIAS_NAME%></td>	
				<td><s:property value="%{model.name}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsRole.ALIAS_DESCP%></td>	
				<td><s:property value="%{model.descp}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsRole.ALIAS_STATUS%></td>	
				<td><s:property value='@com.bm.gjb5.system.DictUtil@getDictValue("rights_role","status",model.status)'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsRole.ALIAS_REMARK%></td>	
				<td><s:property value="%{model.remark}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsRole.ALIAS_PERM%></td>	
				<td><s:property value="%{model.perm}" /></td>
			</tr>
		</table>
	</s:form>
</div>
<!-- <div class="zTreeDemoBackground left" style="width: 40%; float: left">
	<ul id="treeDemo" class="ztree"></ul>
</div> -->
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>