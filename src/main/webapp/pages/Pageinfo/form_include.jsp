<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_TITLE}" key="title" value="%{model.title}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_LINK}" key="link" value="%{model.link}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=Pageinfo.ALIAS_TIMELINE%>:
		</td>	
		<td>
		<input value="${model.timelineString}" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_TIMELINE%>'})" id="timelineString" name="timelineString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_CONTENT}" key="content" value="%{model.content}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_AUTHOR}" key="author" value="%{model.author}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_SOURCE}" key="source" value="%{model.source}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_SUMMARY}" key="summary" value="%{model.summary}" cssClass="" required="false" />
	
	<s:select label="%{@com.bm.gjb5.model.Pageinfo@ALIAS_SITE_ID}" key="siteId" list='sites' value="%{model.siteId}"></s:select>
	
	
	<tr>	
		<td class="tdLabel">
			<%=Pageinfo.ALIAS_OPTIME%>:
		</td>	
		<td>
		<input value="${model.optimeString}" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_OPTIME%>'})" id="optimeString" name="optimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
