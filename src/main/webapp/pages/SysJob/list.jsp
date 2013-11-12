<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>
<rapid:override name="head">
	<title><%=SysJob.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/SysJob/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=SysJob.ALIAS_IS_INTERNAL%></td>		
					<td>
						<input value="${query.isInternal}" id="isInternal" name="isInternal" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_BEGIN_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.beginTimeBegin}' pattern='<%=SysJob.FORMAT_BEGIN_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysJob.FORMAT_BEGIN_TIME%>'})" id="beginTimeBegin" name="beginTimeBegin"   />
						<input value="<fmt:formatDate value='${query.beginTimeEnd}' pattern='<%=SysJob.FORMAT_BEGIN_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysJob.FORMAT_BEGIN_TIME%>'})" id="beginTimeEnd" name="beginTimeEnd"   />
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_END_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.endTimeBegin}' pattern='<%=SysJob.FORMAT_END_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysJob.FORMAT_END_TIME%>'})" id="endTimeBegin" name="endTimeBegin"   />
						<input value="<fmt:formatDate value='${query.endTimeEnd}' pattern='<%=SysJob.FORMAT_END_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysJob.FORMAT_END_TIME%>'})" id="endTimeEnd" name="endTimeEnd"   />
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_EXECUTE_METHOD%></td>		
					<td>
						<input value="${query.executeMethod}" id="executeMethod" name="executeMethod" maxlength="1"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysJob.ALIAS_FREQUENCY%></td>		
					<td>
						<input value="${query.frequency}" id="frequency" name="frequency" maxlength="8"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_PRIORITY%></td>		
					<td>
						<input value="${query.priority}" id="priority" name="priority" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_BATCH%></td>		
					<td>
						<input value="${query.batch}" id="batch" name="batch" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_URL%></td>		
					<td>
						<input value="${query.url}" id="url" name="url" maxlength="255"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysJob.ALIAS_STATUS%></td>		
					<td>
						<input value="${query.status}" id="status" name="status" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_SCALE%></td>		
					<td>
						<input value="${query.scale}" id="scale" name="scale" maxlength="8"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_ORIGIN_TYPE_ID%></td>		
					<td>
						<input value="${query.originTypeId}" id="originTypeId" name="originTypeId" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=SysJob.ALIAS_EVENT_ID%></td>		
					<td>
						<input value="${query.eventId}" id="eventId" name="eventId" maxlength="100"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/SysJob/list.do'"/>
			<shiro:hasPermission name="SysJob:create">
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/pages/SysJob/create.do'"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="SysJob:delete">
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/SysJob/delete.do','items',document.forms.queryForm)"/>
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
				<th sortColumn="IS_INTERNAL" ><%=SysJob.ALIAS_IS_INTERNAL%></th>
				<th sortColumn="BEGIN_TIME" ><%=SysJob.ALIAS_BEGIN_TIME%></th>
				<th sortColumn="END_TIME" ><%=SysJob.ALIAS_END_TIME%></th>
				<th sortColumn="EXECUTE_METHOD" ><%=SysJob.ALIAS_EXECUTE_METHOD%></th>
				<th sortColumn="FREQUENCY" ><%=SysJob.ALIAS_FREQUENCY%></th>
				<th sortColumn="PRIORITY" ><%=SysJob.ALIAS_PRIORITY%></th>
				<th sortColumn="BATCH" ><%=SysJob.ALIAS_BATCH%></th>
				<th sortColumn="URL" ><%=SysJob.ALIAS_URL%></th>
				<th sortColumn="STATUS" ><%=SysJob.ALIAS_STATUS%></th>
				<th sortColumn="SCALE" ><%=SysJob.ALIAS_SCALE%></th>
				<th sortColumn="ORIGIN_TYPE_ID" ><%=SysJob.ALIAS_ORIGIN_TYPE_ID%></th>
				<th sortColumn="EVENT_ID" ><%=SysJob.ALIAS_EVENT_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='#item.id'/>&"></td>
				
				<td><s:property value='#item.isInternal'/>&nbsp;</td>
				<td><s:property value='#item.beginTimeString'/>&nbsp;</td>
				<td><s:property value='#item.endTimeString'/>&nbsp;</td>
				<td><s:property value='#item.executeMethod'/>&nbsp;</td>
				<td><s:property value='#item.frequency'/>&nbsp;</td>
				<td><s:property value='#item.priority'/>&nbsp;</td>
				<td><s:property value='#item.batch'/>&nbsp;</td>
				<td><s:property value='#item.url'/>&nbsp;</td>
				<td><s:property value='#item.status'/>&nbsp;</td>
				<td><s:property value='#item.scale'/>&nbsp;</td>
				<td><s:property value='#item.originTypeId'/>&nbsp;</td>
				<td><s:property value='#item.eventId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/SysJob/show.do?id=<s:property value='#item.id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="SysJob:edit">
					<a href="${ctx}/pages/SysJob/edit.do?id=<s:property value='#item.id'/>&">修改</a>
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

