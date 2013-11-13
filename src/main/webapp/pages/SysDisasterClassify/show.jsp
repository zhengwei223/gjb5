<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysDisasterClassify.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/SysDisasterClassify/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/SysDisasterClassify/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=SysDisasterClassify.ALIAS_NAME%></td>	
				<td><s:property value="%{model.name}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterClassify.ALIAS_DESCP%></td>	
				<td><s:property value="%{model.descp}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=SysDisasterClassify.ALIAS_PID%></td>	
				<td><s:property value="%{model.sysDisasterClassify.name}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>