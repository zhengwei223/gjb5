<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Orginfo.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/Orginfo/save.do" method="post">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/Orginfo/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</s:form>
	
</rapid:override>

<%@ include file="base.jsp" %>