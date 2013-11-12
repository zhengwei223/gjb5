<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<tr>	
		<td class="tdLabel">
			<%=LogException.ALIAS_EVENT_TIME%>:
		</td>	
		<td>
		<input value="${model.eventTimeString}" onclick="WdatePicker({dateFmt:'<%=LogException.FORMAT_EVENT_TIME%>'})" id="eventTimeString" name="eventTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogException@ALIAS_OUTLINE}" key="outline" value="%{model.outline}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogException@ALIAS_CALL_STACK}" key="callStack" value="%{model.callStack}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogException@ALIAS_SUBMODULE}" key="submodule" value="%{model.submodule}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogException@ALIAS_EXCEPTION_LEVEL}" key="exceptionLevel" value="%{model.exceptionLevel}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogException@ALIAS_STATUS}" key="status" value="%{model.status}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.LogException@ALIAS_EQ_ID}" key="eqId" value="%{model.eqId}" cssClass="" required="false" />
	
