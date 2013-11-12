<%@page import="javacommon.gather.bean.GrabageSiteconfig"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=GrabageSiteconfig.TABLE_ALIAS%>信息</title>
</rapid:override>


<rapid:override name="content">
	<s:form action="/pages/GrabageSiteconfig/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/GrabageSiteconfig/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_ADVERT_PATHS%></td>	
				<td><s:property value="%{model.advertPaths}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_AUTHOR%></td>	
				<td><s:property value="%{model.author}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_CONTENT%></td>	
				<td><s:property value="%{model.content}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_FORWARD%></td>	
				<td><s:property value="%{model.forward}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_LINK%></td>	
				<td><s:property value="%{model.link}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_PAGECOUNT%></td>	
				<td><s:property value="%{model.pagecount}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_SOURCE%></td>	
				<td><s:property value="%{model.source}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_SPLITPATH%></td>	
				<td><s:property value="%{model.splitpath}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_SUMMARY%></td>	
				<td><s:property value="%{model.summary}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_TIMELINE%></td>	
				<td><s:property value="%{model.timeline}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_TITLE%></td>	
				<td><s:property value="%{model.title}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_USABLE%></td>	
				<td><s:property value="%{model.usable}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_XLINK%></td>	
				<td><s:property value="%{model.xlink}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_KEYWORD%></td>	
				<td><s:property value="%{model.keyword}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_NAME%></td>	
				<td><s:property value="%{model.name}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>