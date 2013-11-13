<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DataIdentify.TABLE_ALIAS%>编辑</title>
	<%@include file="/commons/meta_validation.jsp"%>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/DataIdentify/update.do" method="post">
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/DataIdentify/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
	</s:form>
	
</rapid:override>

<%@ include file="base.jsp" %>