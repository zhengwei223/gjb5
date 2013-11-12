<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<tr>	
		<td class="tdLabel">
			<%=LogCooperate.ALIAS_REPORT_TIME%>:
		</td>	
		<td>
		<input value="${model.reportTimeString}" onclick="WdatePicker({dateFmt:'<%=LogCooperate.FORMAT_REPORT_TIME%>'})" id="reportTimeString" name="reportTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogCooperate@ALIAS_LOG_TITLE}" key="logTitle" value="%{model.logTitle}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogCooperate@ALIAS_LOG_MESSAGE}" key="logMessage" value="%{model.logMessage}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogCooperate@ALIAS_STATUS}" key="status" value="%{model.status}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogCooperate@ALIAS_EQ_ID}" key="eqId" value="%{model.eqId}" cssClass="" required="false" />
	
