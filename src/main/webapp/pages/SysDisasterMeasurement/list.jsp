<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysDisasterMeasurement.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/SysDisasterMeasurement/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=SysDisasterMeasurement.ALIAS_PREDICATE_ID%></td>		
					<td>
						<input value="${query.predicateId}" id="predicateId" name="predicateId" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=SysDisasterMeasurement.ALIAS_MEASURE%></td>		
					<td>
						<input value="${query.measure}" id="measure" name="measure" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=SysDisasterMeasurement.ALIAS_UNIT%></td>		
					<td>
						<input value="${query.unit}" id="unit" name="unit" maxlength="5"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/SysDisasterMeasurement/list.do'"/>
			<shiro:hasPermission name="SysDisasterMeasurement:create">
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/pages/SysDisasterMeasurement/create.do'"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="SysDisasterMeasurement:delete">
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/SysDisasterMeasurement/delete.do','items',document.forms.queryForm)"/>
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
				<th sortColumn="PREDICATE_ID" ><%=SysDisasterMeasurement.ALIAS_PREDICATE_ID%></th>
				<th sortColumn="MEASURE" ><%=SysDisasterMeasurement.ALIAS_MEASURE%></th>
				<th sortColumn="UNIT" ><%=SysDisasterMeasurement.ALIAS_UNIT%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='id'/>&"></td>
				
				<td><s:property value='predicateId'/>&nbsp;</td>
				<td><s:property value='measure'/>&nbsp;</td>
				<td><s:property value='unit'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/SysDisasterMeasurement/show.do?id=<s:property value='id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="SysDisasterMeasurement:edit">
					<a href="${ctx}/pages/SysDisasterMeasurement/edit.do?id=<s:property value='id'/>&">修改</a>
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

