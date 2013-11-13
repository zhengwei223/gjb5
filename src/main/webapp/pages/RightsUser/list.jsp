<%@page import="javacommon.util.db.ConvenientTools"%>
<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=RightsUser.TABLE_ALIAS%> 维护</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
	// 分页需要依赖的初始化动作
		$(document).ready(function(){
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/RightsUser/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=RightsUser.ALIAS_USERNAME%></td>		
					<td>
						<input value="${query.username}" id="username" name="username" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=RightsUser.ALIAS_NAME%></td>		
					<td>
						<input value="${query.name}" id="name" name="name" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=RightsUser.ALIAS_STATUS%></td>		
					<td>
						<s:select list='%{@com.bm.gjb5.system.DictUtil@getDictMap("rights_user","status")}' name="status" value="%{query.status}" theme="simple" 
						headerKey="" headerValue="全部"/>
					</td>
					
				</tr>	
				<tr>	
					<td class="tdLabel"><%=RightsUser.ALIAS_PHONENUMBER%></td>		
					<td>
						<input value="${query.phonenumber}" id="phonenumber" name="phonenumber" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=RightsUser.ALIAS_ROLE_ID%></td>		
					<td>
						<s:select name="roleId" value="%{query.roleId}" list="%{@com.bm.gjb5.system.DictUtil@getRoleIdNameMap()}" theme="simple"
						headerKey="" headerValue="全部"/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/RightsUser/list.do'"/>
			<shiro:hasPermission name="RightsUser:create">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" onclick="getReferenceForm(this).action='${ctx}/pages/RightsUser/create.do';getReferenceForm(this).submit();" >新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="RightsUser:delete">
			<input type="button" class="stdButton" style="width:80px" value="禁用" onclick="batchOp('${ctx}/pages/RightsUser/delete.do','items',document.forms.queryForm)"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="RightsUser:activation">
			<input type="button" class="stdButton" style="width:80px" value="激活" onclick="batchOp('${ctx}/pages/RightsUser/activation.do','items',document.forms.queryForm)"/>
			</shiro:hasPermission>
		</div>
	</div>
	
	<div class="gridTable">
	
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="USERNAME" ><%=RightsUser.ALIAS_USERNAME%></th>
				<!--<th sortColumn="PASSWORD" ><%=RightsUser.ALIAS_PASSWORD%></th>
				--><th sortColumn="NAME" ><%=RightsUser.ALIAS_NAME%></th>
				<th sortColumn="STATUS" ><%=RightsUser.ALIAS_STATUS%></th>
				<!--<th sortColumn="DEPT_ID" ><%=RightsUser.ALIAS_DEPT_ID%></th>
				<th sortColumn="ORG_ID" ><%=RightsUser.ALIAS_ORG_ID%></th>
				--><th sortColumn="PHONENUMBER" ><%=RightsUser.ALIAS_PHONENUMBER%></th>
				<th sortColumn="ROLE_ID" ><%=RightsUser.ALIAS_ROLE_ID%></th>
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  
		  	  <s:iterator value="#request.page.result"  status="status">
		  	   <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
		  	 	 <td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
		  	 	 <td><input type="checkbox" name="items" value="id=<s:property value='id'/>&"></td>
		  	 	 <td><s:property value='username'/>&nbsp;</td>
		  	 	 <td><s:property value='name'/>&nbsp;</td>
		  	 	 <td><s:property value='@com.bm.gjb5.system.DictUtil@getDictValue("rights_user","status",status)'/>&nbsp;</td>
		  	 	 <td><s:property value='phonenumber'/>&nbsp;</td>
		  	 	 <td><s:property value='rightsRole.name'/>&nbsp;</td>
		  	 	 <td>
					<a href="${ctx}/pages/RightsUser/show.do?id=<s:property value='id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="RightsUser:edit">
					<a href="${ctx}/pages/RightsUser/edit.do?id=<s:property value='id'/>&">修改</a>
					</shiro:hasPermission>
				</td>
		  	   </tr>
		  	  </s:iterator>
		  </tbody>
		</table>
	<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
	</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>

