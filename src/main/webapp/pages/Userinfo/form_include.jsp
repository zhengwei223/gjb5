<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="uuid" name="uuid" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_CODE}" key="code" value="%{model.code}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_USERNAME}" key="username" value="%{model.username}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_FULLNAME}" key="fullname" value="%{model.fullname}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_PNUMBER}" key="pnumber" value="%{model.pnumber}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_UNIT}" key="unit" value="%{model.unit}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_EMAIL}" key="email" value="%{model.email}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_ORGUUID}" key="orguuid" value="%{model.orguuid}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_ORGCODE}" key="orgcode" value="%{model.orgcode}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Userinfo@ALIAS_STATUS}" key="status" value="%{model.status}" cssClass="" required="false" />
	
