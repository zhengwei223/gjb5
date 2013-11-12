<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=LogException.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/LogException/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=LogException.ALIAS_EVENT_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.eventTimeBegin}' pattern='<%=LogException.FORMAT_EVENT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=LogException.FORMAT_EVENT_TIME%>'})" id="eventTimeBegin" name="eventTimeBegin"   />
						<input value="<fmt:formatDate value='${query.eventTimeEnd}' pattern='<%=LogException.FORMAT_EVENT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=LogException.FORMAT_EVENT_TIME%>'})" id="eventTimeEnd" name="eventTimeEnd"   />
					</td>
					<td class="tdLabel"><%=LogException.ALIAS_OUTLINE%></td>		
					<td>
						<input value="${query.outline}" id="outline" name="outline" maxlength="1000"  class=""/>
					</td>
					<td class="tdLabel"><%=LogException.ALIAS_CALL_STACK%></td>		
					<td>
						<input value="${query.callStack}" id="callStack" name="callStack" maxlength="1000"  class=""/>
					</td>
					<td class="tdLabel"><%=LogException.ALIAS_SUBMODULE%></td>		
					<td>
						<input value="${query.submodule}" id="submodule" name="submodule" maxlength="50"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=LogException.ALIAS_EXCEPTION_LEVEL%></td>		
					<td>
						<input value="${query.exceptionLevel}" id="exceptionLevel" name="exceptionLevel" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=LogException.ALIAS_STATUS%></td>		
					<td>
						<input value="${query.status}" id="status" name="status" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=LogException.ALIAS_EQ_ID%></td>		
					<td>
						<input value="${query.eqId}" id="eqId" name="eqId" maxlength="100"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/LogException/list.do'"/>
		</div>
	</div>
	
	<div class="gridTable">
	
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="EVENT_TIME" ><%=LogException.ALIAS_EVENT_TIME%></th>
				<th sortColumn="OUTLINE" ><%=LogException.ALIAS_OUTLINE%></th>
				<th sortColumn="CALL_STACK" ><%=LogException.ALIAS_CALL_STACK%></th>
				<th sortColumn="SUBMODULE" ><%=LogException.ALIAS_SUBMODULE%></th>
				<th sortColumn="EXCEPTION_LEVEL" ><%=LogException.ALIAS_EXCEPTION_LEVEL%></th>
				<th sortColumn="STATUS" ><%=LogException.ALIAS_STATUS%></th>
				<th sortColumn="EQ_ID" ><%=LogException.ALIAS_EQ_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><s:property value='#item.eventTimeString'/>&nbsp;</td>
				<td><s:property value='#item.outline'/>&nbsp;</td>
				<td><s:property value='#item.callStack'/>&nbsp;</td>
				<td><s:property value='#item.submodule'/>&nbsp;</td>
				<td><s:property value='#item.exceptionLevel'/>&nbsp;</td>
				<td><s:property value='#item.status'/>&nbsp;</td>
				<td><s:property value='#item.eqId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/LogException/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
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

