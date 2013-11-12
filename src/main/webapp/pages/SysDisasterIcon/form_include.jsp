<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_DISASTER_LEVEL}" key="disasterLevel" value="%{model.disasterLevel}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_ICON_NAME}" key="iconName" value="%{model.iconName}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_ICON_URL}" key="iconUrl" value="%{model.iconUrl}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysDisasterIcon.ALIAS_UPDATE_TIME%>:
		</td>	
		<td>
		<input value="${model.updateTimeString}" onclick="WdatePicker({dateFmt:'<%=SysDisasterIcon.FORMAT_UPDATE_TIME%>'})" id="updateTimeString" name="updateTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysDisasterIcon.ALIAS_CREATE_TIME%>:
		</td>	
		<td>
		<input value="${model.createTimeString}" onclick="WdatePicker({dateFmt:'<%=SysDisasterIcon.FORMAT_CREATE_TIME%>'})" id="createTimeString" name="createTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_OPUSER}" key="opuser" value="%{model.opuser}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_UNIT}" key="unit" value="%{model.unit}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_MEASUREMENT_ID}" key="measurementId" value="%{model.measurementId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterIcon@ALIAS_RIG_ID}" key="rigId" value="%{model.rigId}" cssClass="" required="false" />
	
