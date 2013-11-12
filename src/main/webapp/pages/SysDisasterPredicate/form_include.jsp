<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterPredicate@ALIAS_NAME}" key="name" value="%{model.name}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterPredicate@ALIAS_DESCP}" key="descp" value="%{model.descp}" cssClass="" required="false" />
	
	<s:select label="%{@com.bm.gjb5.model.SysDisasterPredicate@ALIAS_CLASSIFY_ID}"
name="classifyId" list="allClassify" value="%{model.descp}" listKey="id" listValue="name" headerKey="" headerValue="--选择分类--"></s:select>
	
