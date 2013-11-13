<%@page import="javacommon.gather.bean.Pageinfo"%>
<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Pageinfo.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/Pageinfo/list.do" method="get" theme="simple">
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/Pageinfo/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_TITLE%></td>	
				<td><s:property value="%{model.title}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_LINK%></td>	
				<td><s:property value="%{model.link}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_TIMELINE%></td>	
				<td><s:property value="%{model.timelineString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_CONTENT%></td>	
				<td><s:property value="%{model.content}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_AUTHOR%></td>	
				<td><s:property value="%{model.author}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_SOURCE%></td>	
				<td><s:property value="%{model.source}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_SUMMARY%></td>	
				<td><s:property value="%{model.summary}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_SITE_ID%></td>	
				<td><s:property value="%{model.grabageSiteconfig.name}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=Pageinfo.ALIAS_OPTIME%></td>	
				<td><s:property value="%{model.optimeString}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>