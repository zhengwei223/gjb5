<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=CommonDict.TABLE_ALIAS%>编辑</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/CommonDict/update.do" method="post">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/CommonDict/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>