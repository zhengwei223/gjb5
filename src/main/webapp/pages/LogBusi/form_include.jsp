<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<html:hidden styleId="id" property="id" name="LogBusiForm"/>

	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_OP_TYPE%>:
		</td>
		<td>
		<html:text  styleId="opType" property="opType" name="LogBusiForm"  maxlength="3" styleClass="validate-integer max-value-2147483647" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_OP_USER%>:
		</td>
		<td>
		<html:text  styleId="opUser" property="opUser" name="LogBusiForm"  maxlength="32" styleClass="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_OP_TIME%>:
		</td>
		<td>
		<input value="${LogBusiForm.opTimeString}" onclick="WdatePicker({dateFmt:'<%=LogBusi.FORMAT_OP_TIME%>'})"  id="opTimeString" name="opTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_SUBMODULE%>:
		</td>
		<td>
		<html:text  styleId="submodule" property="submodule" name="LogBusiForm"  maxlength="50" styleClass="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_IP%>:
		</td>
		<td>
		<html:text  styleId="ip" property="ip" name="LogBusiForm"  maxlength="20" styleClass="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_EQ_ID%>:
		</td>
		<td>
		<html:text  styleId="eqId" property="eqId" name="LogBusiForm"  maxlength="100" styleClass="" />
		</td>
	</tr>
	
	<tr>
		<td class="tdLabel">
			<%=LogBusi.ALIAS_CONTENT%>:
		</td>
		<td>
		<html:text  styleId="content" property="content" name="LogBusiForm"  maxlength="1000" styleClass="" />
		</td>
	</tr>

