<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DataDisasterDetail.TABLE_ALIAS%> 维护</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/DataDisasterDetail/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_EXACT_VALUE%></td>		
					<td>
						<input value="${query.exactValue}" id="exactValue" name="exactValue" maxlength="20"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_DESCP%></td>		
					<td>
						<input value="${query.descp}" id="descp" name="descp" maxlength="1000"  class=""/>
					</td>
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_FILED1%></td>		
					<td>
						<input value="${query.filed1}" id="filed1" name="filed1" maxlength="255"  class=""/>
					</td>
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_FILED2%></td>		
					<td>
						<input value="${query.filed2}" id="filed2" name="filed2" maxlength="255"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_FILED3%></td>		
					<td>
						<input value="${query.filed3}" id="filed3" name="filed3" maxlength="255"  class=""/>
					</td>
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_LABELED%></td>		
					<td>
						<input value="${query.labeled}" id="labeled" name="labeled" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_ITENTITY_ID%></td>		
					<td>
						<input value="${query.itentityId}" id="itentityId" name="itentityId" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=DataDisasterDetail.ALIAS_MEASUREMENT_ID%></td>		
					<td>
						<input value="${query.measurementId}" id="measurementId" name="measurementId" maxlength="32"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/DataDisasterDetail/list.do'"/>
			<shiro:hasPermission name="DataDisasterDetail:create">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" onclick="getReferenceForm(this).action='${ctx}/pages/DataDisasterDetail/create.do';getReferenceForm(this).submit();" >新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="DataDisasterDetail:delete">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" onclick="batchDelete('${ctx}/pages/DataDisasterDetail/delete.do','items',document.forms.queryForm);" >删除</a>
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
				<th sortColumn="EXACT_VALUE" ><%=DataDisasterDetail.ALIAS_EXACT_VALUE%></th>
				<th sortColumn="DESCP" ><%=DataDisasterDetail.ALIAS_DESCP%></th>
				<th sortColumn="FILED1" ><%=DataDisasterDetail.ALIAS_FILED1%></th>
				<th sortColumn="FILED2" ><%=DataDisasterDetail.ALIAS_FILED2%></th>
				<th sortColumn="FILED3" ><%=DataDisasterDetail.ALIAS_FILED3%></th>
				<th sortColumn="LABELED" ><%=DataDisasterDetail.ALIAS_LABELED%></th>
				<th sortColumn="ITENTITY_ID" ><%=DataDisasterDetail.ALIAS_ITENTITY_ID%></th>
				<th sortColumn="MEASUREMENT_ID" ><%=DataDisasterDetail.ALIAS_MEASUREMENT_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><s:property value='#item.exactValue'/>&nbsp;</td>
				<td><s:property value='#item.descp'/>&nbsp;</td>
				<td><s:property value='#item.filed1'/>&nbsp;</td>
				<td><s:property value='#item.filed2'/>&nbsp;</td>
				<td><s:property value='#item.filed3'/>&nbsp;</td>
				<td><s:property value='#item.labeled'/>&nbsp;</td>
				<td><s:property value='#item.itentityId'/>&nbsp;</td>
				<td><s:property value='#item.measurementId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/DataDisasterDetail/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="DataDisasterDetail:edit">
						<a href="${ctx}/pages/DataDisasterDetail/edit.do?id=${item.id}&">修改</a>
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

