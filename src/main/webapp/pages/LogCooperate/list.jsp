<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=LogCooperate.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/LogCooperate/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=LogCooperate.ALIAS_REPORT_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.reportTimeBegin}' pattern='<%=LogCooperate.FORMAT_REPORT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=LogCooperate.FORMAT_REPORT_TIME%>'})" id="reportTimeBegin" name="reportTimeBegin"   />
						<input value="<fmt:formatDate value='${query.reportTimeEnd}' pattern='<%=LogCooperate.FORMAT_REPORT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=LogCooperate.FORMAT_REPORT_TIME%>'})" id="reportTimeEnd" name="reportTimeEnd"   />
					</td>
					<td class="tdLabel"><%=LogCooperate.ALIAS_LOG_TITLE%></td>		
					<td>
						<input value="${query.logTitle}" id="logTitle" name="logTitle" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=LogCooperate.ALIAS_LOG_MESSAGE%></td>		
					<td>
						<input value="${query.logMessage}" id="logMessage" name="logMessage" maxlength="1000"  class=""/>
					</td>
					<td class="tdLabel"><%=LogCooperate.ALIAS_STATUS%></td>		
					<td>
						<input value="${query.status}" id="status" name="status" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=LogCooperate.ALIAS_EQ_ID%></td>		
					<td>
						<input value="${query.eqId}" id="eqId" name="eqId" maxlength="100"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/LogCooperate/list.do'"/>
		</div>
	</div>
	
	<div class="gridTable">
	
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="REPORT_TIME" ><%=LogCooperate.ALIAS_REPORT_TIME%></th>
				<th sortColumn="LOG_TITLE" ><%=LogCooperate.ALIAS_LOG_TITLE%></th>
				<th sortColumn="LOG_MESSAGE" ><%=LogCooperate.ALIAS_LOG_MESSAGE%></th>
				<th sortColumn="STATUS" ><%=LogCooperate.ALIAS_STATUS%></th>
				<th sortColumn="EQ_ID" ><%=LogCooperate.ALIAS_EQ_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><s:property value='#item.reportTimeString'/>&nbsp;</td>
				<td><s:property value='#item.logTitle'/>&nbsp;</td>
				<td><s:property value='#item.logMessage'/>&nbsp;</td>
				<td><s:property value='#item.status'/>&nbsp;</td>
				<td><s:property value='#item.eqId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/LogCooperate/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
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

