<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Userinfo.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/Userinfo/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/Userinfo/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="uuid" id="uuid" value="%{model.uuid}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_CODE%></td>	
				<td><s:property value="%{model.code}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_USERNAME%></td>	
				<td><s:property value="%{model.username}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_FULLNAME%></td>	
				<td><s:property value="%{model.fullname}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_PNUMBER%></td>	
				<td><s:property value="%{model.pnumber}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_UNIT%></td>	
				<td><s:property value="%{model.unit}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_EMAIL%></td>	
				<td><s:property value="%{model.email}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_ORGUUID%></td>	
				<td><s:property value="%{model.orguuid}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_ORGCODE%></td>	
				<td><s:property value="%{model.orgcode}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Userinfo.ALIAS_STATUS%></td>	
				<td><s:property value="%{@com.bm.gjb5.system.DictUtil@getDictValue('userinfo', 'status',model.status)}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>