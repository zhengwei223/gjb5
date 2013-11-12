<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterClassify@ALIAS_NAME}" key="name" value="%{model.name}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterClassify@ALIAS_DESCP}" key="descp" value="%{model.descp}" cssClass="" required="false" />
	
	
	<s:select label="%{@com.bm.gjb5.model.SysDisasterClassify@ALIAS_PID}" key="pid" value="%{model.pid}" list="allClassify" listKey="id" listValue="name"  headerKey="" headerValue="一级"></s:select>
	
