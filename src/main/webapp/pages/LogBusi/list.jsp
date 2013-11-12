<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=LogBusi.TABLE_ALIAS%> 维护</title>
	
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

	<form id="queryForm" name="queryForm" action="<c:url value="/pages/LogBusi/list.do"/>" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=LogBusi.ALIAS_OP_TYPE%></td>		
					<td>
						<s:select list='%{@com.bm.gjb5.system.DictUtil@getDictMap("log_busi","op_type")}' name="opType" value="%{query.opType}" theme="simple" 
						headerKey="" headerValue="全部"/>
					</td>
					<td class="tdLabel"><%=LogBusi.ALIAS_EQ_ID%></td>		
					<td>
						<s:select list='eqIdList' name="eqId" value="%{query.eqId}" theme="simple" 
						headerKey="" headerValue="全部"/>
					</td>
					<td class="tdLabel"><%=LogBusi.ALIAS_OP_USER%></td>		
					<td>
						<s:select list='opUserList' name="opUser" value="%{query.opUser}" theme="simple" 
						headerKey="" headerValue="全部"/>
					</td>
					
					<td class="tdLabel"><%=LogBusi.ALIAS_SUBMODULE%></td>		
					<td>
						<s:select list='submoduleList' name="submodule" value="%{query.submodule}" theme="simple" 
						headerKey="" headerValue="全部"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=LogBusi.ALIAS_IP%></td>		
					<td>
						<input value="${query.ip}" id="ip" name="ip" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel"><%=LogBusi.ALIAS_OP_TIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.opTimeBegin}' pattern='<%=LogBusi.FORMAT_OP_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=LogBusi.FORMAT_OP_TIME%>'})" id="opTimeBegin" name="opTimeBegin"   />
						<input value="<fmt:formatDate value='${query.opTimeEnd}' pattern='<%=LogBusi.FORMAT_OP_TIME%>'/>" onclick="WdatePicker({dateFmt:'<%=LogBusi.FORMAT_OP_TIME%>'})" id="opTimeEnd" name="opTimeEnd"   />
					</td>
				</tr>	
				
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/LogBusi/list.do'"/>
		<div>
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="OP_TYPE" ><%=LogBusi.ALIAS_OP_TYPE%></th>
				<th sortColumn="OP_USER" ><%=LogBusi.ALIAS_OP_USER%></th>
				<th sortColumn="OP_TIME" ><%=LogBusi.ALIAS_OP_TIME%></th>
				<th sortColumn="SUBMODULE" ><%=LogBusi.ALIAS_SUBMODULE%></th>
				<th sortColumn="IP" ><%=LogBusi.ALIAS_IP%></th>
				<th sortColumn="EQ_ID" ><%=LogBusi.ALIAS_EQ_ID%></th>
				<th sortColumn="CONTENT" ><%=LogBusi.ALIAS_CONTENT%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <s:iterator value="#request.page.result"  status="status">
		  	  
			  <tr class='<s:property value="%{#status.count % 2 == 0 ? 'odd' : 'even'}"/>'>
				<td><s:property value="#request.page.thisPageFirstElementNumber + #status.index"/></td>
				<td><input type="checkbox" name="items" value="id=<s:property value='id'/>&"></td>
				<td><s:property value='@com.bm.gjb5.system.DictUtil@getDictValue("log_busi","op_type",opType)'/>&nbsp;</td>
				<td><s:property value='opUserList[opUser].username'/>
				&nbsp;</td>
				<td><s:property value='opTimeString'/>&nbsp;</td>
				<td><s:property value='submoduleList[submodule]'/>&nbsp;</td>
				<td><s:property value='ip'/>&nbsp;</td>
				<td><s:property value='eqId=="null"?"":eqId'/>&nbsp;</td>
				<td><s:property value='content'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/LogBusi/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
				</td>
			  </tr>
			  
		  	</s:iterator>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%@ include file="base.jsp" %>

