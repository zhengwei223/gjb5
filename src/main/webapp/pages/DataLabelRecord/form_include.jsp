<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.DataLabelRecord@ALIAS_ICON_ID}" key="iconId" value="%{model.iconId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataLabelRecord@ALIAS_DIS_DETAIL_ID}" key="disDetailId" value="%{model.disDetailId}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=DataLabelRecord.ALIAS_OP_DATE%>:
		</td>	
		<td>
		<input value="${model.opDateString}" onclick="WdatePicker({dateFmt:'<%=DataLabelRecord.FORMAT_OP_DATE%>'})" id="opDateString" name="opDateString"  maxlength="0" class="" />
		</td>
	</tr>
	
