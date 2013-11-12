<%@ page language="java" 
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/meta.jsp"%>
<title>发送异常信息调试页面</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#eventId").combogrid({
		editable:false,						
		panelWidth: 600,
		idField: 'eventId',
		textField: 'location',
		url: '<s:url value="/pages/SysEarthquake/listJson.do" />',
		method: 'get',
		columns: [[
			{field:'eventId',title:'地震序列',width:150},
			{field:'eventTimeString',title:'发震时间',width:150},
			{field:'location',title:'发震地点',width:300,align:'left'}
		]],
		fitColumns: true
	});
});
</script>
</head>
<body>
	<%@ include file="/commons/messages.jsp"%>
	<h3>发送应用异常</h3>
	将wsdl路径配置在码表中
	<s:form action="AppException/send.do" namespace="/pages">
		<%-- <s:select label="事件" name="eventId" list="events" listKey="eventId" listValue="eventId"></s:select> --%>
		<!-- <tr>
			<td class="tdLabel"><label for="eventId" class="label" >地震序列:</label></td>
			<td>
				<select name="eventId" id="eventId" 
				class="easyui-combogrid easyui-validatebox" style="width: 250px"></select>
			</td>
		</tr> -->
		
		<s:radio label="异常等级" list="#{0:'一般异常',1:'关键异常',2:'严重异常'}" name="level" value="0"></s:radio>
		<s:textfield label="异常信息" name="exceptionMessage" />
		<s:submit value="提交"/>
	</s:form>
</body>
</html>