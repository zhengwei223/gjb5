<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=GrabageSiteconfig.TABLE_ALIAS%>新增</title>
	<%@ include file="/commons/meta_validation.jsp" %>
	
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/GrabageSiteconfig/save.do" method="post">
		<input id="submitButton" name="submitButton" type="submit" value="提交" />
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/GrabageSiteconfig/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</s:form>
	
</rapid:override>

<%@ include file="base.jsp" %>