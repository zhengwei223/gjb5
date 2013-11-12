<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterMeasurement@ALIAS_PREDICATE_ID}" key="predicateId" value="%{model.predicateId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterMeasurement@ALIAS_MEASURE}" key="measure" value="%{model.measure}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysDisasterMeasurement@ALIAS_UNIT}" key="unit" value="%{model.unit}" cssClass="" required="false" />
	
