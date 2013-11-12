<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<tr>	
		<td class="tdLabel">
			<%=RightsMapping.ALIAS_OP_DATE%>:
		</td>	
		<td>
		<input value="${model.opDateString}" onclick="WdatePicker({dateFmt:'<%=RightsMapping.FORMAT_OP_DATE%>'})" id="opDateString" name="opDateString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsMapping@ALIAS_OP_USER}" key="opUser" value="%{model.opUser}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsMapping@ALIAS_RESOURCE_ID}" key="resourceId" value="%{model.resourceId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsMapping@ALIAS_ROLE_ID}" key="roleId" value="%{model.roleId}" cssClass="" required="false" />
	
