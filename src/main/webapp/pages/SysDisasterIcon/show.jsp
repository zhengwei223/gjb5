<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysDisasterIcon.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/SysDisasterIcon/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/SysDisasterIcon/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_DISASTER_LEVEL%></td>	
				<td><s:property value="%{model.disasterLevel}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_ICON_NAME%></td>	
				<td><s:property value="%{model.iconName}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_ICON_URL%></td>	
				<td><s:property value="%{model.iconUrl}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_UPDATE_TIME%></td>	
				<td><s:property value="%{model.updateTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_CREATE_TIME%></td>	
				<td><s:property value="%{model.createTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_OPUSER%></td>	
				<td><s:property value="%{model.opuser}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_UNIT%></td>	
				<td><s:property value="%{model.unit}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_MEASUREMENT_ID%></td>	
				<td><s:property value="%{model.measurementId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterIcon.ALIAS_RIG_ID%></td>	
				<td><s:property value="%{model.rigId}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>