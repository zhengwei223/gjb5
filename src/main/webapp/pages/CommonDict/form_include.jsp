<%@page import="com.bm.gjb5.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	<s:select label="表名/一级分类" list="tableList" id="tableName"
		cssClass="easyui-combobox" name="tableName" cssStyle="width:200px;" >
	</s:select>
<s:textfield label="%{@com.bm.gjb5.model.CommonDict@ALIAS_FIELD_NAME}"
	key="fieldName" value="%{model.fieldName}" cssClass=":required" />


<s:textfield label="%{@com.bm.gjb5.model.CommonDict@ALIAS_FIELD_VALUE}"
	key="fieldValue" value="%{model.fieldValue}"
	cssClass=":required :digits" />


<s:textfield label="%{@com.bm.gjb5.model.CommonDict@ALIAS_TEXT}"
	key="text" value="%{model.text}" cssClass=":required" />


<s:textfield label="%{@com.bm.gjb5.model.CommonDict@ALIAS_DESCP}"
	key="descp" value="%{model.descp}" cssClass="" />

<script type="text/javascript">
		$(function(){
			$('#tableName').combobox('setText', '${model.tableName}').combobox('setValue', '${model.tableName}');
		});
	</script>