<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=RightsUser.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/RightsUser/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/RightsUser/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=RightsUser.ALIAS_USERNAME%></td>	
				<td><s:property value="%{model.username}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsUser.ALIAS_PASSWORD%></td>	
				<td><s:property value="%{model.password}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsUser.ALIAS_NAME%></td>	
				<td><s:property value="%{model.name}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsUser.ALIAS_STATUS%></td>	
				<td><s:property value='@com.bm.gjb5.system.DictUtil@getDictValue("rights_user","status",model.status)'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsUser.ALIAS_PHONENUMBER%></td>	
				<td><s:property value="%{model.phonenumber}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=RightsUser.ALIAS_ROLE_ID%></td>	
				<td><s:property value="%{model.rightsRole.name}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>