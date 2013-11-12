<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_EXACT_VALUE}" key="exactValue" value="%{model.exactValue}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_DESCP}" key="descp" value="%{model.descp}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_FILED1}" key="filed1" value="%{model.filed1}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_FILED2}" key="filed2" value="%{model.filed2}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_FILED3}" key="filed3" value="%{model.filed3}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_LABELED}" key="labeled" value="%{model.labeled}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_ITENTITY_ID}" key="itentityId" value="%{model.itentityId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataDisasterDetail@ALIAS_MEASUREMENT_ID}" key="measurementId" value="%{model.measurementId}" cssClass="" required="false" />
	
