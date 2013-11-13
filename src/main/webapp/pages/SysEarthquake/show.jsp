<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysEarthquake.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/SysEarthquake/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/SysEarthquake/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="eventId" id="eventId" value="eventId"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_EVENT_TIME%></td>	
				<td><s:property value="eventTimeString" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_LONGITUDE%></td>	
				<td><s:property value="longitude" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_LATITUDE%></td>	
				<td><s:property value="latitude" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_FOCAL_DEPTH%></td>	
				<td><s:property value="focalDepth" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_MAGNITUDE%></td>	
				<td><s:property value="magnitude" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_LOCATION%></td>	
				<td><s:property value="location" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_START_TIME%></td>	
				<td><s:property value="startTimeString" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_END_TIME%></td>	
				<td><s:property value="endTimeString" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysEarthquake.ALIAS_STATUS%></td>	
				<td><s:property value="statusList[status]" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>