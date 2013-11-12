<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysDisasterMeasurement.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/SysDisasterMeasurement/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/SysDisasterMeasurement/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=SysDisasterMeasurement.ALIAS_PREDICATE_ID%></td>	
				<td><s:property value="%{model.predicateId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterMeasurement.ALIAS_MEASURE%></td>	
				<td><s:property value="%{model.measure}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterMeasurement.ALIAS_UNIT%></td>	
				<td><s:property value="%{model.unit}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>