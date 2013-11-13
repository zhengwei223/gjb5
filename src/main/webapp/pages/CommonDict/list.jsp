<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=CommonDict.TABLE_ALIAS%> 维护</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm','${page.thisPageNumber}','${page.pageSize}','${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/CommonDict/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend></legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=CommonDict.ALIAS_TABLE_NAME%></td>		
					<td>
						<input value="${query.tableName}" id="tableName" name="tableName" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=CommonDict.ALIAS_FIELD_NAME%></td>		
					<td>
						<input value="${query.fieldName}" id="fieldName" name="fieldName" maxlength="50"  class=""/>
						<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search"
			onclick="getReferenceForm(this).action='${ctx}/pages/CommonDict/list.do';getReferenceForm(this).submit();">搜索</a>
			
					</td>
					
				</tr>	
				
			</table>
			
		</fieldset>
		<div style="margin:10px 0;"></div>
		<div class="handleControl">
			
			<shiro:hasPermission name="CommonDict:create">
				<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" 
				onclick="getReferenceForm(this).action='${ctx}/pages/CommonDict/create.do';getReferenceForm(this).submit();">新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="CommonDict:delete">
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-remove'"
				onclick="batchDelete('${ctx}/pages/CommonDict/delete.do','items',document.forms.queryForm)">删除</a>
			</shiro:hasPermission>
		</div>
		<div style="margin:10px 0;"></div>
	</div>
	
	<div class="gridTable">
	
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="TABLE_NAME" ><%=CommonDict.ALIAS_TABLE_NAME%></th>
				<th sortColumn="FIELD_NAME" ><%=CommonDict.ALIAS_FIELD_NAME%></th>
				<th sortColumn="FIELD_VALUE" ><%=CommonDict.ALIAS_FIELD_VALUE%></th>
				<th sortColumn="TEXT" ><%=CommonDict.ALIAS_TEXT%></th>
				<th sortColumn="DESCP" ><%=CommonDict.ALIAS_DESCP%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><c:out value='${item.tableName}'/>&nbsp;</td>
				<td><c:out value='${item.fieldName}'/>&nbsp;</td>
				<td><c:out value='${item.fieldValue}'/>&nbsp;</td>
				<td><c:out value='${item.text}'/>&nbsp;</td>
				<td><c:out value='${item.descp}'/>&nbsp;</td>
				<td>
					<a class="easyui-linkbutton" data-options="plain:true"" href="${ctx}/pages/CommonDict/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="CommonDict:edit">
						<a class="easyui-linkbutton" data-options="plain:true" href="${ctx}/pages/CommonDict/edit.do?id=${item.id}&">修改</a>
					</shiro:hasPermission>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
	</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>

