<%@page import="com.bm.gjb5.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<base href="<%=basePath%>">
<title><%=Userinfo.TABLE_ALIAS%> 维护</title>

<link href="widgets/simpletable/simpletable.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="widgets/simpletable/simpletable.js"></script>

<script type="text/javascript" src="js/jquery.skygqbox.1.3.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				//弹出层上的按钮处理
				$("#overlay_cancle").click(function() {
					$.skygqbox.hide();
				});
				$("#overlay_submit").click(function() {
					batchActivate();
				});
				// 分页需要依赖的初始化动作
				window.simpleTable = new SimpleTable('queryForm',
						'${page.thisPageNumber}', '${page.pageSize}',
						'${pageRequest.sortColumns}');
			});
	function showOverlay() {
		$('#overlayDiv').skygqbox();//弹出编辑框
	}
	function batchActivate() {
		if (!hasOneChecked('roleId')) {
			alert('请选择角色!');
			return;
		}
	//	alert($(":radio:checked").val());
		batchOp('${ctx}/pages/Userinfo/activate.do?roleId='
				+ $(":radio:checked").val(), 'items', document.forms.queryForm);
	}
</script>
</head>
<body>
<%@ include file="/commons/messages.jsp" %>
<div id="wrapper">
	<form id="queryForm" name="queryForm"
		action="<c:url value="/pages/Userinfo/list.do"/>" method="post"
		style="display: inline;">

		<div class="queryPanel">
			<fieldset>
				<legend>搜索</legend>
				<table>
					<tr>
						<td class="tdLabel"><%=Userinfo.ALIAS_USERNAME%></td>
						<td><input value="${query.username}" id="username"
							name="username" maxlength="50" class="" /></td>
						<td class="tdLabel"><%=Userinfo.ALIAS_STATUS%></td>
						<td><s:select
								list="%{@com.bm.gjb5.system.DictUtil@getDictMap('userinfo', 'status')}"
								id="status" name="status" theme="simple"></s:select></td>
					</tr>
					<tr>
						<td class="tdLabel"><%=Userinfo.ALIAS_PNUMBER%></td>
						<td><input value="${query.pnumber}" id="pnumber"
							name="pnumber" maxlength="11" class="" /></td>
						<td class="tdLabel"><%=Userinfo.ALIAS_UNIT%></td>
						<td><input value="${query.unit}" id="unit" name="unit"
							maxlength="50" class="" /></td>
					</tr>
					
				</table>
			</fieldset>
			<div class="handleControl">
				<input type="submit" class="stdButton" style="width: 80px"
					value="查询"
					onclick="getReferenceForm(this).action='${ctx}/pages/Userinfo/list.do'" />
				<shiro:hasPermission name="Userinfo:sync">
				<input type="submit" class="stdButton" style="width: 80px"
					value="手动同步"
					onclick="getReferenceForm(this).action='${ctx}/pages/Userinfo/sync.do'" />
				</shiro:hasPermission>
				<shiro:hasPermission  name="Userinfo:activate">	
				<input type="button" class="stdButton" style="width: 80px"
					value="激活并授权" onclick="showOverlay()" />
				</shiro:hasPermission>
				<%-- <input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/Userinfo/delete.do','items',document.forms.queryForm)"/> --%>
			</div>
		</div>
		<div class="gridTable">

			<simpletable:pageToolbar page="${page}">
			</simpletable:pageToolbar>

			<table width="100%" border="0" cellspacing="0" class="gridBody">
				<thead>

					<tr>
						<th style="width: 1px;"></th>
						<th style="width: 1px;"><input type="checkbox"
							onclick="setAllCheckboxState('items',this.checked)"></th>

						<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
						<th sortColumn="CODE"><%=Userinfo.ALIAS_CODE%></th>
						<th sortColumn="USERNAME"><%=Userinfo.ALIAS_USERNAME%></th>
						<th sortColumn="FULLNAME"><%=Userinfo.ALIAS_FULLNAME%></th>
						<th sortColumn="PNUMBER"><%=Userinfo.ALIAS_PNUMBER%></th>
						<th sortColumn="UNIT"><%=Userinfo.ALIAS_UNIT%></th>
						<th sortColumn="EMAIL"><%=Userinfo.ALIAS_EMAIL%></th>
						<th sortColumn="ORGUUID"><%=Userinfo.ALIAS_ORGUUID%></th>
						<th sortColumn="ORGCODE"><%=Userinfo.ALIAS_ORGCODE%></th>
						<th sortColumn="STATUS"><%=Userinfo.ALIAS_STATUS%></th>

						<th>操作</th>
					</tr>

				</thead>
				<tbody>
					<s:iterator value="#request.page.result" var="item" status="status">
						<tr
							class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
							<td><s:property
									value="#request.page.thisPageFirstElementNumber + #status.index" /></td>
							<td><input type="checkbox" name="items"
								value="uuid=<s:property value='#item.uuid'/>&"></td>

							<td><s:property value='#item.code' />&nbsp;</td>
							<td><s:property value='#item.username' />&nbsp;</td>
							<td><s:property value='#item.fullname' />&nbsp;</td>
							<td><s:property value='#item.pnumber' />&nbsp;</td>
							<td><s:property value='#item.unit' />&nbsp;</td>
							<td><s:property value='#item.email' />&nbsp;</td>
							<td><s:property value='#item.orguuid' />&nbsp;</td>
							<td><s:property value='#item.orgcode' />&nbsp;</td>
							<td><s:property
									value="%{@com.bm.gjb5.system.DictUtil@getDictValue('userinfo', 'status',#item.status)}" />&nbsp;</td>
							<td><a
								href="${ctx}/pages/Userinfo/show.do?uuid=${item.uuid}&">查看</a>&nbsp;&nbsp;&nbsp;

							</td>
						</tr>

					</s:iterator>
				</tbody>
			</table>

			<simpletable:pageToolbar page="${page}">
			</simpletable:pageToolbar>

		</div>

	</form>
	<div id="overlayDiv" style="padding: 30px; display: none; width: 700px">
		<s:radio list="%{@com.bm.gjb5.system.DictUtil@getRoleIdNameMap()}"
			name="roleId"></s:radio>
		<input type="button" value="确定" id="overlay_submit" /> <input
			type="button" value="取消" id="overlay_cancle">
	</div>
</div>	
</body>

</html>