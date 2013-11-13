<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=CommonDict.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
	<div style="margin: 10px 5px;text-align: left">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="$('#update').submit()" >提交</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/CommonDict/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
	</div>
	<s:form action="/pages/CommonDict/update.do" method="post">
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>