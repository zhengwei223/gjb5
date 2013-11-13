<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Orginfo.TABLE_ALIAS%> 维护</title>
	
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

	<form id="queryForm" name="queryForm" action="<c:url value="/pages/Orginfo/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=Orginfo.ALIAS_PARENTUUID%></td>		
					<td>
						<input value="${query.parentuuid}" id="parentuuid" name="parentuuid" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=Orginfo.ALIAS_ORGNAME%></td>		
					<td>
						<input value="${query.orgname}" id="orgname" name="orgname" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=Orginfo.ALIAS_ORGCODE%></td>		
					<td>
						<input value="${query.orgcode}" id="orgcode" name="orgcode" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=Orginfo.ALIAS_CONTENT%></td>		
					<td>
						<input value="${query.content}" id="content" name="content" maxlength="500"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Orginfo.ALIAS_DUTY_OFFICER%></td>		
					<td>
						<input value="${query.dutyOfficer}" id="dutyOfficer" name="dutyOfficer" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=Orginfo.ALIAS_PNUMBER%></td>		
					<td>
						<input value="${query.pnumber}" id="pnumber" name="pnumber" maxlength="11"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/Orginfo/list.do'"/>
			<shiro:hasPermission name="Orginfo:create">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" onclick="getReferenceForm(this).action='${ctx}/pages/Orginfo/create.do';getReferenceForm(this).submit();" >新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="Orginfo:delete">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" onclick="batchDelete('${ctx}/pages/Orginfo/delete.do','items',document.forms.queryForm);" >删除</a>
			</shiro:hasPermission>
		<div>
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="PARENTUUID" ><%=Orginfo.ALIAS_PARENTUUID%></th>
				<th sortColumn="ORGNAME" ><%=Orginfo.ALIAS_ORGNAME%></th>
				<th sortColumn="ORGCODE" ><%=Orginfo.ALIAS_ORGCODE%></th>
				<th sortColumn="CONTENT" ><%=Orginfo.ALIAS_CONTENT%></th>
				<th sortColumn="DUTY_OFFICER" ><%=Orginfo.ALIAS_DUTY_OFFICER%></th>
				<th sortColumn="PNUMBER" ><%=Orginfo.ALIAS_PNUMBER%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='#item.id'/>"></td>
				
				<td><s:property value='#item.parentuuid'/>&nbsp;</td>
				<td><s:property value='#item.orgname'/>&nbsp;</td>
				<td><s:property value='#item.orgcode'/>&nbsp;</td>
				<td><s:property value='#item.content'/>&nbsp;</td>
				<td><s:property value='#item.dutyOfficer'/>&nbsp;</td>
				<td><s:property value='#item.pnumber'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/Orginfo/show.do?orguuid=${item.orguuid}&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="Orginfo:edit">
					<a href="${ctx}/pages/Orginfo/edit.do?orguuid=${item.orguuid}&">修改</a>
					</shiro:hasPermission>
				</td>
			  </tr>
			  
		  	  </s:iterator>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%@ include file="base.jsp" %>

