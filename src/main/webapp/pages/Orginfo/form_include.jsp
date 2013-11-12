<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="orguuid" name="orguuid" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.Orginfo@ALIAS_PARENTUUID}" key="parentuuid" value="%{model.parentuuid}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Orginfo@ALIAS_ORGNAME}" key="orgname" value="%{model.orgname}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Orginfo@ALIAS_ORGCODE}" key="orgcode" value="%{model.orgcode}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Orginfo@ALIAS_CONTENT}" key="content" value="%{model.content}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Orginfo@ALIAS_DUTY_OFFICER}" key="dutyOfficer" value="%{model.dutyOfficer}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.Orginfo@ALIAS_PNUMBER}" key="pnumber" value="%{model.pnumber}" cssClass="" required="false" />
	
