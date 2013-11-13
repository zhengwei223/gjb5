<%@page import="javacommon.gather.bean.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
<%@ include file="/commons/meta.jsp"%>

<link href="<c:url value="/widgets/simpletable/simpletable.css"/>"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/js/jquery-easyui-1.3.4/jquery.easyui.min.js"/>"></script>
<title><%=GrabageSiteconfig.TABLE_ALIAS%> 维护</title>

<script type="text/javascript">
	$(document).ready(
			function() {
				// 分页需要依赖的初始化动作
				window.simpleTable = new SimpleTable('queryForm',
						'${page.thisPageNumber}', '${page.pageSize}',
						'${pageRequest.sortColumns}');
				//$('#overlayDiv').dialog('close');
			});
	var to;
	var msg="";
	var total_msg = "";
	function showStatus() {
		//alert();
		$.get("${ctx}/pages/GrabageSiteconfig/status.jsp?p="+Math.random(), function(data) {
			if(data.msg=='存储完成'){
				window.clearInterval(to);
				$('#overlayDiv').dialog({
					buttons:[{
						text:'查看结果',
						handler:function(){window.location.href='${ctx}/pages/Pageinfo/list.do';}
					},{
						text:'关闭',
						handler:function(){$('#overlayDiv').dialog('close');}
					}],
					closable:true
				});
				$('#overlayDiv').dialog('open');
			}
			if(data.msg.indexOf('采集错误')>0||data.msg.indexOf('存储错误')>0){
				window.clearInterval(to);
				$('#overlayDiv').dialog({
					buttons:[{
						text:'关闭',
						handler:function(){$('#overlayDiv').dialog('close');}
					}],
					closable:true
				});
				$('#overlayDiv').dialog('open');
			}
			var value = $('#p').progressbar('getValue');
			if (value < 100) {
				//value += Math.floor(Math.random() * 10);
				value = data.value;
				if(value>0){
					$('#p').progressbar('setValue', value);
					//$('#msg_content').append("<p>123</p>");
				}
				
				if(total_msg==""&&data.total_msg!='null'){
					total_msg = data.total_msg;
					$('#msg_0').after("<p>"+total_msg+"</p>");
				}
				if(msg!=data.msg&&data.msg!=""){
					msg=data.msg;				
					//alert(msg);
					$('#msg_0').after("<p>"+msg+"</p>");
				}
			} 
		}, "json");
	}
	function beginCollect() {
		//----提交表单(异步) begin
		if (!hasOneChecked('items')) {
			alert('请选择要操作的对象!');
			return;
		}
		$.get('${ctx}/pages/GrabageSiteconfig/collect.do?random='+Math.random()+"&"+$("#queryForm").serialize());
		//----提交表单 end
		//弹出状态框
		$('#overlayDiv').dialog({
			modal : true,
			value : 0,
			closable:false
		});
		$('#overlayDiv').dialog('open');
		//定时请求状态页
		to = window.setInterval('showStatus()', 1000);

	}
</script>
</head>
<body>
	<div class="wrapper">
		<form id="queryForm" name="queryForm"
			action="<c:url value="/pages/GrabageSiteconfig/list.do"/>"
			method="post" style="display: inline;">
			<div class="queryPanel">
				<fieldset>
					<legend>搜索</legend>
					<table>
						<tr>
							<td class="tdLabel"><%=GrabageSiteconfig.ALIAS_NAME%></td>
							<td><input value="${query.name}" id="name" name="name"
								maxlength="1020" class="" /></td>
						</tr>
					</table>
				</fieldset>
				<div class="handleControl">
					<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search" onclick="getReferenceForm(this).action='${ctx}/pages/GrabageSiteconfig/list.do';getReferenceForm(this).submit();" >搜索</a>
					<shiro:hasPermission name="GrabageSiteconfig:create">
					<input type="submit" class="stdButton" style="width: 80px"
						value="新增"
						onclick="getReferenceForm(this).action='${ctx}/pages/GrabageSiteconfig/create.do'" />
					</shiro:hasPermission>
					<shiro:hasPermission name="GrabageSiteconfig:delete">
					<input type="button" class="stdButton" style="width: 80px"
						value="删除"
						onclick="batchDelete('${ctx}/pages/GrabageSiteconfig/delete.do','items',document.forms.queryForm)" />
					</shiro:hasPermission>
					<shiro:hasPermission name="GrabageSiteconfig:collect">						
					<input type="button" class="stdButton" style="width: 80px"
						value="开始采集" onclick="beginCollect()" />
					</shiro:hasPermission>	
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
							<th sortColumn="NAME"><%=GrabageSiteconfig.ALIAS_NAME%></th>
							<th sortColumn="LINK"><%=GrabageSiteconfig.ALIAS_LINK%></th>
							<th sortColumn="USABLE"><%=GrabageSiteconfig.ALIAS_USABLE%></th>
							<th sortColumn="KEYWORD"><%=GrabageSiteconfig.ALIAS_KEYWORD%></th>
							<th sortColumn="PAGECOUNT"><%=GrabageSiteconfig.ALIAS_PAGECOUNT%></th>

							<th>操作</th>
						</tr>

					</thead>
					<tbody>
						<s:iterator value="#request.page.result" var="item"
							status="status">
							<tr
								class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
								<td><s:property
										value="#request.page.thisPageFirstElementNumber + #status.index" /></td>
								<td><input type="checkbox" name="items"
									value="id=<s:property value='#item.id'/>"></td>

								<td><s:property value='#item.name' />&nbsp;</td>
								<td><s:property value='#item.link' />&nbsp;</td>
								<td><s:property value='#item.usable' />&nbsp;</td>
								<td><s:property value='#item.keyword' />&nbsp;</td>
								<td><s:property value='#item.pagecount' />&nbsp;</td>
								<td><a href="${ctx}/pages/GrabageSiteconfig/show.do?id=<s:property value='#item.id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
									<shiro:hasPermission name="GrabageSiteconfig:edit">
									<a href="${ctx}/pages/GrabageSiteconfig/edit.do?id=<s:property value='#item.id'/>&">修改</a>
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

		<div id="overlayDiv" class="easyui-dialog" closed="true" modal="true"
			title="进度" style="width: 700px; height: 200px; padding: 10px">
			<div id="p" class="easyui-progressbar" style="width: 400px;"></div>
			<div id="msg_content">
				<p id="msg_0"></p>
				<p>开始分析……</p>
			</div>
		</div>
	</div>
</body>
</html>
