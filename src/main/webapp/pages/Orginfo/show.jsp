<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Orginfo.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/Orginfo/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/Orginfo/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="orguuid" id="orguuid" value="%{model.orguuid}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Orginfo.ALIAS_PARENTUUID%></td>	
				<td><s:property value="%{model.parentuuid}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Orginfo.ALIAS_ORGNAME%></td>	
				<td><s:property value="%{model.orgname}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Orginfo.ALIAS_ORGCODE%></td>	
				<td><s:property value="%{model.orgcode}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Orginfo.ALIAS_CONTENT%></td>	
				<td><s:property value="%{model.content}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Orginfo.ALIAS_DUTY_OFFICER%></td>	
				<td><s:property value="%{model.dutyOfficer}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Orginfo.ALIAS_PNUMBER%></td>	
				<td><s:property value="%{model.pnumber}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>