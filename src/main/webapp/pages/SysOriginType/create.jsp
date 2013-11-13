<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysOriginType.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<div style="margin: 10px 0px;text-align: left">
		<a class="easyui-linkbutton" data-options="plain:true" href="javascript:;" onclick="$('#save').submit();">提交</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/SysOriginType/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
	</div>
	<s:form action="/pages/SysOriginType/save.do" method="post">
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</s:form>
	
	
</rapid:override>

<%@ include file="base.jsp" %>