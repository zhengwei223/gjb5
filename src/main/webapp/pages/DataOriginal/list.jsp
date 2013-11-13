<%@page import="com.bm.gjb5.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title><%=DataOriginal.TABLE_ALIAS%> 维护</title>

	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>"
		type="text/css" rel="stylesheet">
	<script type="text/javascript"
		src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm','${page.thisPageNumber}','${page.pageSize}','${pageRequest.sortColumns}');
			$("#eventId").combogrid({
				editable:false,						
				panelWidth: 600,
				idField: 'eventId',
				textField: 'location',
				url: '<s:url value="/pages/SysEarthquake/listJson.do" />',
				method: 'get',
				columns: [[
					{field:'eventId',title:'地震序列',width:150},
					{field:'eventTimeString',title:'发震时间',width:150},
					{field:'location',title:'发震地点',width:300,align:'left'}
				]],
				fitColumns: true
			});
			//$("#eventId").combogrid('setValue', '${query.eventId }');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm"
		action="<c:url value="/pages/DataOriginal/list.do"/>" method="post"
		style="display: inline;">
		<div class="queryPanel" style="margin: 10px 0;">
			<fieldset>
				<legend>搜索</legend>
				<table>
					<tr>
						<td class="tdLabel"><%=DataOriginal.ALIAS_FILENAME%></td>
						<td><input value="${query.filename}" id="filename"
							name="filename" maxlength="50" class="" /></td>
						<td class="tdLabel"><%=DataOriginal.ALIAS_COLL_TIME%></td>
						<td><input
							value="<fmt:formatDate value='${query.collTimeBegin}' pattern='<%=DataOriginal.FORMAT_COLL_TIME%>'/>"
							onclick="WdatePicker({dateFmt:'<%=DataOriginal.FORMAT_COLL_TIME%>'})"
							id="collTimeBegin" name="collTimeBegin" /> <input
							value="<fmt:formatDate value='${query.collTimeEnd}' pattern='<%=DataOriginal.FORMAT_COLL_TIME%>'/>"
							onclick="WdatePicker({dateFmt:'<%=DataOriginal.FORMAT_COLL_TIME%>'})"
							id="collTimeEnd" name="collTimeEnd" /></td>
						<td class="tdLabel"><%=DataOriginal.ALIAS_FORM%></td>
						<td><s:select value="%{#request.query.form}" list="formList"
								name="form" theme="simple" headerKey="" headerValue="选择格式" />
						<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search"
			onclick="getReferenceForm(this).action='${ctx}/pages/DataOriginal/list.do';getReferenceForm(this).submit();">搜索</a>
								</td>
													
					</tr>
				</table>
			</fieldset>
			<div class="handleControl" style="margin: 10px 0;">
				<shiro:hasPermission name="DataOriginal:create">
					<a href="${ctx}/pages/DataOriginal/create.do" class="easyui-linkbutton" iconCls="icon-add" >灾情录入</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="DataOriginal:delete">
					<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove"
			onclick="batchDelete('${ctx}/pages/DataOriginal/delete.do','items',document.forms.queryForm)" >删除</a>
								
				</shiro:hasPermission>
			</div>
		</div>

		<div class="gridTable">


			<table width="100%" border="0" cellspacing="0" class="gridBody">
				<thead>

					<tr>
						<th style="width: 1px;"></th>
						<th style="width: 1px;"><input type="checkbox"
							onclick="setAllCheckboxState('items',this.checked)"></th>

						<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
						<th sortColumn="FILENAME"><%=DataOriginal.ALIAS_FILENAME%></th>
						<th sortColumn="NOTICE_TIME"><%=DataOriginal.ALIAS_NOTICE_TIME%></th>
						<th sortColumn="COLL_TIME"><%=DataOriginal.ALIAS_COLL_TIME%></th>
						<th><%=DataOriginal.ALIAS_FORM%></th>
						<th><%=DataOriginal.ALIAS_EQ%></th>
						<th>操作</th>
					</tr>

				</thead>
				<tbody>
					<s:iterator value="#request.page.result" status="status">

						<tr
							class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
							<td><s:property
									value="#request.page.thisPageFirstElementNumber + #status.index" /></td>
							<td><input type="checkbox" name="items"
								value="id=<s:property value='id'/>&"></td>
							<td><s:property value='filename' />&nbsp;</td>
							<td><s:property value='noticeTimeString' />&nbsp;</td>
							<td><s:property value='collTimeString' />&nbsp;</td>
							<td><s:property value='form' />&nbsp;</td>
							<td><s:property value='eqinfo' />&nbsp;</td>
							<!-- 地震序列 -->
							<td><a class="easyui-linkbutton" data-options="plain:true"
								href="${ctx}/pages/DataOriginal/show.do?id=<s:property value='id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
								<%-- <shiro:hasPermission name="DataOriginal:edit">
					<a href="${ctx}/pages/DataOriginal/edit.do?id=<s:property value='id'/>&">修改</a>
								<a href="${ctx}/pages/DataIdentify/dispatch.do?data_ori_id=<s:property value='id'/>&">辅助处理</a>
					</shiro:hasPermission> --%>
							</td>
						</tr>

					</s:iterator>
				</tbody>
			</table>
			<p style="margin: 10px 0;">
			<simpletable:pageToolbar page="${page}"></simpletable:pageToolbar>
		</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>

