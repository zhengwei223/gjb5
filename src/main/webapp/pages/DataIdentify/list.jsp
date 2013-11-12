<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DataIdentify.TABLE_ALIAS%> 维护</title>
	
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
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/DataIdentify/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=DataIdentify.ALIAS_CREATE_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.createTimeBegin}' pattern='<%=DataIdentify.FORMAT_CREATE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_CREATE_TIME%>'})" id="createTimeBegin" name="createTimeBegin"   />
						<input value="<fmt:formatDate value='${query.createTimeEnd}' pattern='<%=DataIdentify.FORMAT_CREATE_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_CREATE_TIME%>'})" id="createTimeEnd" name="createTimeEnd"   />
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_EVENT_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.eventTimeBegin}' pattern='<%=DataIdentify.FORMAT_EVENT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_EVENT_TIME%>'})" id="eventTimeBegin" name="eventTimeBegin"   />
						<input value="<fmt:formatDate value='${query.eventTimeEnd}' pattern='<%=DataIdentify.FORMAT_EVENT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_EVENT_TIME%>'})" id="eventTimeEnd" name="eventTimeEnd"   />
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_LOCATION%></td>		
					<td>
						<input value="${query.location}" id="location" name="location" maxlength="100"  class=""/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_LONGITUDE%></td>		
					<td>
						<input value="${query.longitude}" id="longitude" name="longitude" maxlength="10"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=DataIdentify.ALIAS_LATITUDE%></td>		
					<td>
						<input value="${query.latitude}" id="latitude" name="latitude" maxlength="10"  class=""/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_TXT_INFO1%></td>		
					<td>
						<input value="${query.txtInfo1}" id="txtInfo1" name="txtInfo1" maxlength="4000"  class=""/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_TXT_INFO2%></td>		
					<td>
						<input value="${query.txtInfo2}" id="txtInfo2" name="txtInfo2" maxlength="2000"  class=""/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_SEMANTICS%></td>		
					<td>
						<input value="${query.semantics}" id="semantics" name="semantics" maxlength="2000"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=DataIdentify.ALIAS_MAGNITUDE%></td>		
					<td>
						<input value="${query.magnitude}" id="magnitude" name="magnitude" maxlength="8"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_SEISESTHESIA%></td>		
					<td>
						<input value="${query.seisesthesia}" id="seisesthesia" name="seisesthesia" maxlength="3"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_REPORT_MAN%></td>		
					<td>
						<input value="${query.reportMan}" id="reportMan" name="reportMan" maxlength="10"  class=""/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_REPORT_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.reportTimeBegin}' pattern='<%=DataIdentify.FORMAT_REPORT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_REPORT_TIME%>'})" id="reportTimeBegin" name="reportTimeBegin"   />
						<input value="<fmt:formatDate value='${query.reportTimeEnd}' pattern='<%=DataIdentify.FORMAT_REPORT_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_REPORT_TIME%>'})" id="reportTimeEnd" name="reportTimeEnd"   />
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=DataIdentify.ALIAS_MANUAL%></td>		
					<td>
						<input value="${query.manual}" id="manual" name="manual" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=DataIdentify.ALIAS_ORIGINAL_ID%></td>		
					<td>
						<input value="${query.originalId}" id="originalId" name="originalId" maxlength="32"  class=""/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/DataIdentify/list.do'"/>
			<shiro:hasPermission name="DataIdentify:create">
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/pages/DataIdentify/create.do'"/>
			</shiro:hasPermission>
			<shiro:hasPermission name="DataIdentify:delete">
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/DataIdentify/delete.do','items',document.forms.queryForm)"/>
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
				<th sortColumn="CREATE_TIME" ><%=DataIdentify.ALIAS_CREATE_TIME%></th>
				<th sortColumn="EVENT_TIME" ><%=DataIdentify.ALIAS_EVENT_TIME%></th>
				<th sortColumn="LOCATION" ><%=DataIdentify.ALIAS_LOCATION%></th>
				<th sortColumn="LONGITUDE" ><%=DataIdentify.ALIAS_LONGITUDE%></th>
				<th sortColumn="LATITUDE" ><%=DataIdentify.ALIAS_LATITUDE%></th>
				<th sortColumn="TXT_INFO1" ><%=DataIdentify.ALIAS_TXT_INFO1%></th>
				<th sortColumn="TXT_INFO2" ><%=DataIdentify.ALIAS_TXT_INFO2%></th>
				<th sortColumn="SEMANTICS" ><%=DataIdentify.ALIAS_SEMANTICS%></th>
				<th sortColumn="MAGNITUDE" ><%=DataIdentify.ALIAS_MAGNITUDE%></th>
				<th sortColumn="SEISESTHESIA" ><%=DataIdentify.ALIAS_SEISESTHESIA%></th>
				<th sortColumn="REPORT_MAN" ><%=DataIdentify.ALIAS_REPORT_MAN%></th>
				<th sortColumn="REPORT_TIME" ><%=DataIdentify.ALIAS_REPORT_TIME%></th>
				<th sortColumn="MANUAL" ><%=DataIdentify.ALIAS_MANUAL%></th>
				<th sortColumn="ORIGINAL_ID" ><%=DataIdentify.ALIAS_ORIGINAL_ID%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result" var="item" status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><s:property value='#item.createTimeString'/>&nbsp;</td>
				<td><s:property value='#item.eventTimeString'/>&nbsp;</td>
				<td><s:property value='#item.location'/>&nbsp;</td>
				<td><s:property value='#item.longitude'/>&nbsp;</td>
				<td><s:property value='#item.latitude'/>&nbsp;</td>
				<td><s:property value='#item.txtInfo1'/>&nbsp;</td>
				<td><s:property value='#item.txtInfo2'/>&nbsp;</td>
				<td><s:property value='#item.semantics'/>&nbsp;</td>
				<td><s:property value='#item.magnitude'/>&nbsp;</td>
				<td><s:property value='#item.seisesthesia'/>&nbsp;</td>
				<td><s:property value='#item.reportMan'/>&nbsp;</td>
				<td><s:property value='#item.reportTimeString'/>&nbsp;</td>
				<td><s:property value='#item.manual'/>&nbsp;</td>
				<td><s:property value='#item.originalId'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/DataIdentify/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<shiro:hasPermission name="DataIdentify:edit">
					<a href="${ctx}/pages/DataIdentify/edit.do?id=${item.id}&">修改</a>
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

