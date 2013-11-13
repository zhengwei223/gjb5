<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=LogCooperate.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/LogCooperate/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/LogCooperate/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=LogCooperate.ALIAS_REPORT_TIME%></td>	
				<td><s:property value="%{model.reportTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogCooperate.ALIAS_LOG_TITLE%></td>	
				<td><s:property value="%{model.logTitle}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogCooperate.ALIAS_LOG_MESSAGE%></td>	
				<td><s:property value="%{model.logMessage}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogCooperate.ALIAS_STATUS%></td>	
				<td><s:property value="%{model.status}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogCooperate.ALIAS_EQ_ID%></td>	
				<td><s:property value="%{model.eqId}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>