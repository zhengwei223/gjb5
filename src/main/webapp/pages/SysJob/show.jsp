<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysJob.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/SysJob/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/SysJob/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_IS_INTERNAL%></td>	
				<td><s:property value="%{model.isInternal}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_BEGIN_TIME%></td>	
				<td><s:property value="%{model.beginTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_END_TIME%></td>	
				<td><s:property value="%{model.endTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_EXECUTE_METHOD%></td>	
				<td><s:property value="%{model.executeMethod}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_FREQUENCY%></td>	
				<td><s:property value="%{model.frequency}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_PRIORITY%></td>	
				<td><s:property value="%{model.priority}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_BATCH%></td>	
				<td><s:property value="%{model.batch}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_URL%></td>	
				<td><s:property value="%{model.url}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_STATUS%></td>	
				<td><s:property value="%{model.status}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_SCALE%></td>	
				<td><s:property value="%{model.scale}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_ORIGIN_TYPE_ID%></td>	
				<td><s:property value="%{model.originTypeId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysJob.ALIAS_EVENT_ID%></td>	
				<td><s:property value="%{model.eventId}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>