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
				</tr>
				<tr>	
					<td class="tdLabel"><%=Pageinfo.ALIAS_OPTIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.optimeBegin}' pattern='<%=Pageinfo.FORMAT_OPTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_OPTIME%>'})" id="optimeBegin" name="optimeBegin"   />
						<input value="<fmt:formatDate value='${query.optimeEnd}' pattern='<%=Pageinfo.FORMAT_OPTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_OPTIME%>'})" id="optimeEnd" name="optimeEnd"   />
					</td>
					<td class="tdLabel"><%=Pageinfo.ALIAS_TIMELINE%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.timelineBegin}' pattern='<%=Pageinfo.FORMAT_TIMELINE%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_TIMELINE%>'})" id="timelineBegin" name="timelineBegin"   />
						<input value="<fmt:formatDate value='${query.timelineEnd}' pattern='<%=Pageinfo.FORMAT_TIMELINE%>'/>" onclick="WdatePicker({dateFmt:'<%=Pageinfo.FORMAT_TIMELINE%>'})" id="timelineEnd" name="timelineEnd"   />
					</td>
				</tr>
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/Pageinfo/list.do'"/>
			<%-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="getReferenceForm(this).action='${ctx}/pages/Pageinfo/list.do';getReferenceForm(this).submit();" >查询</a> --%>
			<shiro:hasPermission name="Pageinfo:delete">
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/Pageinfo/delete.do','items',document.forms.queryForm)"/>
			</shiro:hasPermission>
		</div>
	</div>
	
	<div class="gridTable">
	
		<%-- <simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
	
				<!-- 
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
			 -->	
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="SOURCE" ><%=Pageinfo.ALIAS_SOURCE%></th>
				<th sortColumn="TITLE" ><%=Pageinfo.ALIAS_TITLE%></th>
				<th sortColumn="TIMELINE" ><%=Pageinfo.ALIAS_TIMELINE%></th>
				
				<th sortColumn="AUTHOR" ><%=Pageinfo.ALIAS_AUTHOR%></th>
				<th sortColumn="SUMMARY" ><%=Pageinfo.ALIAS_SUMMARY%></th>
				<th sortColumn="SITE_ID" ><%=Pageinfo.ALIAS_SITE_ID%></th>
	
				<th>操作</th>
				</tr>
			  
		  </thead>
		  <tbody>
							  
		  	  <s:iterator value="#request.page.result" var="item" status="status">
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='#item.id'/>&"></td>
				
				<td><s:property value='#item.source'/>&nbsp;</td>
				<td><a href="${ctx}/pages/Pageinfo/show.do?id=<s:property value='#item.id'/>&"><s:property value='#item.title'/></a>&nbsp;</td>
				<td><s:property value='#item.timeline'/>&nbsp;</td>
				
				<td><s:property value='#item.author'/>&nbsp;</td>
				<td><s:property value='#item.summary'/>&nbsp;</td>
				<td><s:property value='#item.grabageSiteconfig.name'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/Pageinfo/show.do?id=<s:property value='#item.id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/pages/Pageinfo/edit.do?id=<s:property value='#item.id'/>&">修改</a>
				</td>
			  </tr>
			  
		  	  </s:iterator>
		  </tbody>
		</table> --%>
		<table border="0">
		 <s:iterator value="#request.page.result" var="item" status="status">
			<tr>
			<td>【<s:property value='#item.source'/>】&nbsp;</td>
			<td><a href="${ctx}/pages/Pageinfo/show.do?id=<s:property value='#item.id'/>&"><s:property value='#item.title'/></a>&nbsp;  </td>
			<td><s:property value='#item.timeline'/>&nbsp;</td>
			</tr>
		  </s:iterator>
		</table>
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%@ include file="base.jsp" %>

