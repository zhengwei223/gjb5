<%@page import="javacommon.gather.bean.Pageinfo"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Pageinfo.TABLE_ALIAS%> 维护</title>
	
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

	<form id="queryForm" name="queryForm" action="<c:url value="/pages/Pageinfo/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>网络媒体信息汇总</legend>
			<table>
				<tr>	
					<td class="tdLabel">关键字</td>		
					<td>
						<input value="${query.keyWords}" id="keyWords" name="keyWords" maxlength="255" /><span>*多个关键字用空格分开</span>
					</td>
					<td class="tdLabel"><%=Pageinfo.ALIAS_OPTIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.optimeBegin}' pattern='<%=Pageinfo.FORMAT_OPTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_OPTIME%>'})" id="optimeBegin" name="optimeBegin"   />
						<input value="<fmt:formatDate value='${query.optimeEnd}' pattern='<%=Pageinfo.FORMAT_OPTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_OPTIME%>'})" id="optimeEnd" name="optimeEnd"   />
					</td>
				</tr>
				<tr>	
					<td class="tdLabel"><%=Pageinfo.ALIAS_TIMELINE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.timelineBegin}' pattern='<%=Pageinfo.FORMAT_TIMELINE%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_TIMELINE%>'})" id="timelineBegin" name="timelineBegin"   />
						<input value="<fmt:formatDate value='${query.timelineEnd}' pattern='<%=Pageinfo.FORMAT_TIMELINE%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_TIMELINE%>'})" id="timelineEnd" name="timelineEnd"   />
						<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-search"
			onclick="getReferenceForm(this).action='${ctx}/pages/Pageinfo/list.do';getReferenceForm(this).submit();">搜索</a>
					</td>
				</tr>
			</table>
		</fieldset>
		<div class="handleControl">
			<shiro:hasPermission name="Pageinfo:delete">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove"
			 onclick="batchDelete('${ctx}/pages/Pageinfo/delete.do','items',document.forms.queryForm)">删除</a>
			</shiro:hasPermission>
		</div>
	</div>
	
	<div class="gridTable">
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				<th><%=Pageinfo.ALIAS_SOURCE%></th>
				<th><%=Pageinfo.ALIAS_TITLE%></th>
				<th sortColumn="TIMELINE" ><%=Pageinfo.ALIAS_TIMELINE%></th>
				</tr>
			  
		  </thead>
		  <tbody>
							  
		  	  <s:iterator value="#request.page.result" var="item" status="status">
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='#item.id'/>&"></td>
				
				<td><s:property value='#item.source'/>&nbsp;</td>
				<td><a class="easyui-linkbutton" data-options="plain:true" href="${ctx}/pages/Pageinfo/show.do?id=<s:property value='#item.id'/>&"><s:property value='#item.title'/></a>&nbsp;</td>
				<td><s:property value='#item.timeline'/>&nbsp;</td>
				
			  </tr>
			  
		  	  </s:iterator>
		  </tbody>
		</table> 
		<%-- <table border="0">
		 <s:iterator value="#request.page.result" var="item" status="status">
			<tr>
			<td>【<s:property value='#item.source'/>】&nbsp;</td>
			<td><a href="${ctx}/pages/Pageinfo/show.do?id=<s:property value='#item.id'/>&"><s:property value='#item.title'/></a>&nbsp;  </td>
			<td><s:property value='#item.timeline'/>&nbsp;</td>
			</tr>
		  </s:iterator>
		</table> --%>
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%@ include file="base.jsp" %>

