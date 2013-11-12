<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DataDisasterDetail.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/DataDisasterDetail/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/DataDisasterDetail/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_EXACT_VALUE%></td>	
				<td><s:property value="%{model.exactValue}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_DESCP%></td>	
				<td><s:property value="%{model.descp}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_FILED1%></td>	
				<td><s:property value="%{model.filed1}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_FILED2%></td>	
				<td><s:property value="%{model.filed2}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_FILED3%></td>	
				<td><s:property value="%{model.filed3}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_LABELED%></td>	
				<td><s:property value="%{model.labeled}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_ITENTITY_ID%></td>	
				<td><s:property value="%{model.itentityId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataDisasterDetail.ALIAS_MEASUREMENT_ID%></td>	
				<td><s:property value="%{model.measurementId}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>