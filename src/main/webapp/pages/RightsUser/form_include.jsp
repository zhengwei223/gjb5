<%@page import="com.bm.gjb5.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->

<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_USERNAME}"
	key="username" value="%{model.username}" cssClass=":required" required="false" />


<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_PASSWORD}"
	key="password" value="%{model.password}" cssClass=":required :max_length;40 :min_length;8" required="false" />


<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_NAME}"
	key="name" value="%{model.name}" cssClass=":required" required="false" />


<s:select label="%{@com.bm.gjb5.model.RightsUser@ALIAS_STATUS}"
	key="status" value="%{model.status}"
	list='%{@com.bm.gjb5.system.DictUtil@getDictMap("rights_user","status")}' />


<!--<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_DEPT_ID}" key="deptId" value="%{model.deptId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_ORG_ID}" key="orgId" value="%{model.orgId}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_EMP_ID}" key="empId" value="%{model.empId}" cssClass="" required="false" />
	
	
	-->
<s:textfield label="%{@com.bm.gjb5.model.RightsUser@ALIAS_PHONENUMBER}"
	key="phonenumber" value="%{model.phonenumber}" cssClass=":required :number"
	required="false" />



<s:select list="%{@com.bm.gjb5.system.DictUtil@getRoleIdNameMap()}"
	label="%{@com.bm.gjb5.model.RightsUser@ALIAS_ROLE_ID}" key="roleId"
	value="%{model.roleId}"></s:select>