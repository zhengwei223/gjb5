<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=RightsMapping.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/RightsMapping/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=RightsMapping.ALIAS_OP_DATE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.opDateBegin}' pattern='<%=RightsMapping.FORMAT_OP_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=RightsMapping.FORMAT_OP_DATE%>'})" id="opDateBegin" name="opDateBegin"   />
						<input value="<fmt:formatDate value='${query.opDateEnd}' pattern='<%=RightsMapping.FORMAT_OP_DATE%>'/>" onclick="WdatePicker({dateFmt:'<%=RightsMapping.FORMAT_OP_DATE%>'})" id="opDateEnd" name="opDateEnd"   />
					</td>
					<td class="tdLabel"><%=RightsMapping.ALIAS_OP_USER%></td>		
					<td>
						<input value="${query.opUser}" id="opUser" name="opUser" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=RightsMapping.ALIAS_RESOURCE_ID%></td>		
					<td>
						<input value="${query.resourceId}" id="resourceId" name="resourceId" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=RightsMapping.ALIAS_ROLE_ID%></td>		
					<td>
						<input value="${query.roleId}" id="roleId" name="roleId" maxlength="32"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/RightsMapping/list.do'"/>
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" onclick="getReferenceForm(this).action='${ctx}/pages/RightsMapping/create.do';getReferenceForm(this).submit();" >新增</a>
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" onclick="batchDelete('${ctx}/pages/RightsMapping/delete.do','items',document.forms.queryForm);" >删除</a>
		</div>
	</div>
	
	<div class="gridTable">
	
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="OP_DATE" ><%=RightsMapping.ALIAS_OP_DATE%></th>
				<th sortColumn="OP_USER" ><%=RightsMapping.ALIAS_OP_USER%></th>
				<th sortColumn="RESOURCE_ID" ><%=RightsMapping.ALIAS_RESOURCE_ID%></th>
				<th sortColumn="ROLE_ID" ><%=RightsMapping.ALIAS_ROLE_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><s:property value='#item.opDateString'/>&nbsp;</td>
				<td><s:property value='#item.opUser'/>&nbsp;</td>
				<td><s:property value='#item.resourceId'/>&nbsp;</td>
				<td><s:property value='#item.roleId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/RightsMapping/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/pages/RightsMapping/edit.do?id=${item.id}&">修改</a>
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

