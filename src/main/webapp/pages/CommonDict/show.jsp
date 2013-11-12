<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=CommonDict.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/CommonDict/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/CommonDict/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=CommonDict.ALIAS_TABLE_NAME%></td>	
				<td><s:property value="%{model.tableName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=CommonDict.ALIAS_FIELD_NAME%></td>	
				<td><s:property value="%{model.fieldName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=CommonDict.ALIAS_FIELD_VALUE%></td>	
				<td><s:property value="%{model.fieldValue}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=CommonDict.ALIAS_TEXT%></td>	
				<td><s:property value="%{model.text}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=CommonDict.ALIAS_DESCP%></td>	
				<td><s:property value="%{model.descp}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>