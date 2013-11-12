<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysEarthquake.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/SysEarthquake/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=SysEarthquake.ALIAS_EVENT_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.eventTimeBegin}' pattern='<%=SysEarthquake.FORMAT_EVENT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_EVENT_TIME%>'})" id="eventTimeBegin" name="eventTimeBegin"   />
						<input value="<fmt:formatDate value='${query.eventTimeEnd}' pattern='<%=SysEarthquake.FORMAT_EVENT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_EVENT_TIME%>'})" id="eventTimeEnd" name="eventTimeEnd"   />
					</td>
					<td class="tdLabel"><%=SysEarthquake.ALIAS_LONGITUDE%></td>		
					<td>
						<input value="${query.longitude}" id="longitude" name="longitude" maxlength="10"  class=""/>
					</td>
					<td class="tdLabel"><%=SysEarthquake.ALIAS_LATITUDE%></td>		
					<td>
						<input value="${query.latitude}" id="latitude" name="latitude" maxlength="10"  class=""/>
					</td>
					<td class="tdLabel"><%=SysEarthquake.ALIAS_FOCAL_DEPTH%></td>		
					<td>
						<input value="${query.focalDepth}" id="focalDepth" name="focalDepth" maxlength="10"  class="validate-integer "/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysEarthquake.ALIAS_MAGNITUDE%></td>		
					<td>
						<input value="${query.magnitude}" id="magnitude" name="magnitude" maxlength="8"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=SysEarthquake.ALIAS_LOCATION%></td>		
					<td>
						<input value="${query.location}" id="location" name="location" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel"><%=SysEarthquake.ALIAS_START_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.startTimeBegin}' pattern='<%=SysEarthquake.FORMAT_START_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_START_TIME%>'})" id="startTimeBegin" name="startTimeBegin"   />
						<input value="<fmt:formatDate value='${query.startTimeEnd}' pattern='<%=SysEarthquake.FORMAT_START_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_START_TIME%>'})" id="startTimeEnd" name="startTimeEnd"   />
					</td>
					<td class="tdLabel"><%=SysEarthquake.ALIAS_END_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.endTimeBegin}' pattern='<%=SysEarthquake.FORMAT_END_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_END_TIME%>'})" id="endTimeBegin" name="endTimeBegin"   />
						<input value="<fmt:formatDate value='${query.endTimeEnd}' pattern='<%=SysEarthquake.FORMAT_END_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_END_TIME%>'})" id="endTimeEnd" name="endTimeEnd"   />
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysEarthquake.ALIAS_STATUS%></td>		
					<td>
						<s:select list='statusList' theme="simple"></s:select>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/SysEarthquake/list.do'"/>
			<shiro:hasPermission name="SysEarthquake:create">
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/pages/SysEarthquake/create.do'"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="SysEarthquake:delete">
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/SysEarthquake/delete.do','items',document.forms.queryForm)"/>
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
				<th sortColumn="EVENT_TIME" ><%=SysEarthquake.ALIAS_EVENT_TIME%></th>
				<th sortColumn="LONGITUDE" ><%=SysEarthquake.ALIAS_LONGITUDE%></th>
				<th sortColumn="LATITUDE" ><%=SysEarthquake.ALIAS_LATITUDE%></th>
				<th sortColumn="FOCAL_DEPTH" ><%=SysEarthquake.ALIAS_FOCAL_DEPTH%></th>
				<th sortColumn="MAGNITUDE" ><%=SysEarthquake.ALIAS_MAGNITUDE%></th>
				<th sortColumn="LOCATION" ><%=SysEarthquake.ALIAS_LOCATION%></th>
				<th sortColumn="START_TIME" ><%=SysEarthquake.ALIAS_START_TIME%></th>
				<th sortColumn="END_TIME" ><%=SysEarthquake.ALIAS_END_TIME%></th>
				<th sortColumn="STATUS" ><%=SysEarthquake.ALIAS_STATUS%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result"  status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="eventId=<s:property value='eventId'/>&"></td>
				
				<td><s:property value='eventTimeString'/>&nbsp;</td>
				<td><s:property value='longitude'/>&nbsp;</td>
				<td><s:property value='latitude'/>&nbsp;</td>
				<td><s:property value='focalDepth'/>&nbsp;</td>
				<td><s:property value='magnitude'/>&nbsp;</td>
				<td><s:property value='location'/>&nbsp;</td>
				<td><s:property value='startTimeString'/>&nbsp;</td>
				<td><s:property value='endTimeString'/>&nbsp;</td>
				<td><s:property value='statusList[status]'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/SysEarthquake/show.do?eventId=<s:property value='eventId'/>&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="SysEarthquake:edit">
					<a href="${ctx}/pages/SysEarthquake/edit.do?eventId=<s:property value='eventId'/>&">修改</a>
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

