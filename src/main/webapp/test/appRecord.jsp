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
<title>应用日志调试页面</title>
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
	<h3>发送应用日志</h3>
	将wsdl路径配置在码表中，webService-->appRecord 
	<s:form action="AppRecord/send.do" namespace="/wstest">
		<%-- <s:select label="事件" name="eventId" list="events" listKey="eventId" listValue="eventId"></s:select> --%>
		<tr>
			<td class="tdLabel"><label for="eventId" class="label" >地震序列:</label></td>
			<td>
				<select name="eventId" id="eventId" 
				class="easyui-combogrid easyui-validatebox" style="width: 250px"></select>
			</td>
		</tr>
		<s:textfield label="日志标题" name="logtitle" />
		<s:textfield label="日志消息" name="logmessage" />
		<s:submit value="提交"/>
	</s:form>
</body>
</html>