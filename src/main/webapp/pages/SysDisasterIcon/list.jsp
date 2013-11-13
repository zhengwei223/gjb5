<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysDisasterIcon.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/SysDisasterIcon/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_DISASTER_LEVEL%></td>		
					<td>
						<input value="${query.disasterLevel}" id="disasterLevel" name="disasterLevel" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_ICON_NAME%></td>		
					<td>
						<input value="${query.iconName}" id="iconName" name="iconName" maxlength="50"  class=""/>
					</td>
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_ICON_URL%></td>		
					<td>
						<input value="${query.iconUrl}" id="iconUrl" name="iconUrl" maxlength="255"  class=""/>
					</td>
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_UPDATE_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.updateTimeBegin}' pattern='<%=SysDisasterIcon.FORMAT_UPDATE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysDisasterIcon.FORMAT_UPDATE_TIME%>'})" id="updateTimeBegin" name="updateTimeBegin"   />
						<input value="<fmt:formatDate value='${query.updateTimeEnd}' pattern='<%=SysDisasterIcon.FORMAT_UPDATE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysDisasterIcon.FORMAT_UPDATE_TIME%>'})" id="updateTimeEnd" name="updateTimeEnd"   />
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_CREATE_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.createTimeBegin}' pattern='<%=SysDisasterIcon.FORMAT_CREATE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysDisasterIcon.FORMAT_CREATE_TIME%>'})" id="createTimeBegin" name="createTimeBegin"   />
						<input value="<fmt:formatDate value='${query.createTimeEnd}' pattern='<%=SysDisasterIcon.FORMAT_CREATE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=SysDisasterIcon.FORMAT_CREATE_TIME%>'})" id="createTimeEnd" name="createTimeEnd"   />
					</td>
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_OPUSER%></td>		
					<td>
						<input value="${query.opuser}" id="opuser" name="opuser" maxlength="32"  class=""/>
					</td>
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_UNIT%></td>		
					<td>
						<input value="${query.unit}" id="unit" name="unit" maxlength="5"  class=""/>
					</td>
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_MEASUREMENT_ID%></td>		
					<td>
						<input value="${query.measurementId}" id="measurementId" name="measurementId" maxlength="32"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=SysDisasterIcon.ALIAS_RIG_ID%></td>		
					<td>
						<input value="${query.rigId}" id="rigId" name="rigId" maxlength="32"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/SysDisasterIcon/list.do'"/>
			<shiro:hasPermission name="SysDisasterIcon:create">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-add" onclick="getReferenceForm(this).action='${ctx}/pages/SysDisasterIcon/create.do';getReferenceForm(this).submit();" >新增</a>
			</shiro:hasPermission>
			<shiro:hasPermission name="SysDisasterIcon:delete">
			<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-remove" onclick="batchDelete('${ctx}/pages/SysDisasterIcon/delete.do','items',document.forms.queryForm);" >删除</a>
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
				<th sortColumn="DISASTER_LEVEL" ><%=SysDisasterIcon.ALIAS_DISASTER_LEVEL%></th>
				<th sortColumn="ICON_NAME" ><%=SysDisasterIcon.ALIAS_ICON_NAME%></th>
				<th sortColumn="ICON_URL" ><%=SysDisasterIcon.ALIAS_ICON_URL%></th>
				<th sortColumn="UPDATE_TIME" ><%=SysDisasterIcon.ALIAS_UPDATE_TIME%></th>
				<th sortColumn="CREATE_TIME" ><%=SysDisasterIcon.ALIAS_CREATE_TIME%></th>
				<th sortColumn="OPUSER" ><%=SysDisasterIcon.ALIAS_OPUSER%></th>
				<th sortColumn="UNIT" ><%=SysDisasterIcon.ALIAS_UNIT%></th>
				<th sortColumn="MEASUREMENT_ID" ><%=SysDisasterIcon.ALIAS_MEASUREMENT_ID%></th>
				<th sortColumn="RIG_ID" ><%=SysDisasterIcon.ALIAS_RIG_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='id'/>&"></td>
				
				<td><s:property value='disasterLevel'/>&nbsp;</td>
				<td><s:property value='iconName'/>&nbsp;</td>
				<td><s:property value='iconUrl'/>&nbsp;</td>
				<td><s:property value='updateTimeString'/>&nbsp;</td>
				<td><s:property value='createTimeString'/>&nbsp;</td>
				<td><s:property value='opuser'/>&nbsp;</td>
				<td><s:property value='unit'/>&nbsp;</td>
				<td><s:property value='measurementId'/>&nbsp;</td>
				<td><s:property value='rigId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/SysDisasterIcon/show.do?id=<s:property value='id'/>&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="SysDisasterIcon:edit">
					<a href="${ctx}/pages/SysDisasterIcon/edit.do?id=<s:property value='id'/>&">修改</a>
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

