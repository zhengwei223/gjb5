<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsRole@ALIAS_NAME}" key="name" value="%{model.name}" cssClass=":required"  />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsRole@ALIAS_DESCP}" key="descp" value="%{model.descp}" cssClass=":required"  />
	
	
	<s:select label="%{@com.bm.gjb5.model.RightsRole@ALIAS_STATUS}" key="status" value="%{model.status}"  list="@com.bm.gjb5.system.DictUtil@getDictMap('rights_role','status')"/>
	
	
	<s:textarea label="%{@com.bm.gjb5.model.RightsRole@ALIAS_REMARK}" key="remark" cssClass="" cols="30" rows="5"></s:textarea>
	
	<s:textarea label="%{@com.bm.gjb5.model.RightsRole@ALIAS_PERM}" key="perm" cssClass="" cols="30" rows="3">
	</s:textarea>
	
