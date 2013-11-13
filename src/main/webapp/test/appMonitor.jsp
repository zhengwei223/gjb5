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
<title>应用监控接口调试</title>
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
	<h3>应用监控接口调试</h3>
	将wsdl路径配置在码表中webService-->appMonitor 
	<s:form action="AppMonitor/send.do" namespace="/wstest">
		<s:radio label="运行状态" list="#{0:'良好',1:'失败'}" name="runStaus" value="0"></s:radio>
		<s:submit value="提交"/>
	</s:form>
</body>
</html>