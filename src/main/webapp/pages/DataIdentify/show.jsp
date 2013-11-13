<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DataIdentify.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/DataIdentify/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/DataIdentify/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_CREATE_TIME%></td>	
				<td><s:property value="%{model.createTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_EVENT_TIME%></td>	
				<td><s:property value="%{model.eventTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_LOCATION%></td>	
				<td><s:property value="%{model.location}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_LONGITUDE%></td>	
				<td><s:property value="%{model.longitude}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_LATITUDE%></td>	
				<td><s:property value="%{model.latitude}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_TXT_INFO1%></td>	
				<td><s:property value="%{model.txtInfo1}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_TXT_INFO2%></td>	
				<td><s:property value="%{model.txtInfo2}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_SEMANTICS%></td>	
				<td><s:property value="%{model.semantics}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_MAGNITUDE%></td>	
				<td><s:property value="%{model.magnitude}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_SEISESTHESIA%></td>	
				<td><s:property value="%{model.seisesthesia}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_REPORT_MAN%></td>	
				<td><s:property value="%{model.reportMan}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_REPORT_TIME%></td>	
				<td><s:property value="%{model.reportTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_MANUAL%></td>	
				<td><s:property value="%{model.manual}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=DataIdentify.ALIAS_ORIGINAL_ID%></td>	
				<td><s:property value="%{model.originalId}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>