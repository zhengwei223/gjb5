<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_IS_INTERNAL}" key="isInternal" value="%{model.isInternal}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysJob.ALIAS_BEGIN_TIME%>:
		</td>	
		<td>
		<input value="${model.beginTimeString}" onclick="WdatePicker({dateFmt:'<%=SysJob.FORMAT_BEGIN_TIME%>'})" id="beginTimeString" name="beginTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysJob.ALIAS_END_TIME%>:
		</td>	
		<td>
		<input value="${model.endTimeString}" onclick="WdatePicker({dateFmt:'<%=SysJob.FORMAT_END_TIME%>'})" id="endTimeString" name="endTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_EXECUTE_METHOD}" key="executeMethod" value="%{model.executeMethod}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_FREQUENCY}" key="frequency" value="%{model.frequency}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_PRIORITY}" key="priority" value="%{model.priority}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_BATCH}" key="batch" value="%{model.batch}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_URL}" key="url" value="%{model.url}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_STATUS}" key="status" value="%{model.status}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_SCALE}" key="scale" value="%{model.scale}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_ORIGIN_TYPE_ID}" key="originTypeId" value="%{model.originTypeId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysJob@ALIAS_EVENT_ID}" key="eventId" value="%{model.eventId}" cssClass="" required="false" />
	
