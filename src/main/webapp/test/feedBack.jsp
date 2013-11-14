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
<title>协同控制反馈调试</title>
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
	<h3>发送协同控制反馈消息</h3>
	将wsdl路径配置在码表中webService-->controlFeedback 
	<s:form action="ControlFeedback/feedBack.do" namespace="/wstest">
		<tr>
			<td class="tdLabel"><label for="eventId" class="label" >地震序列:</label></td>
			<td>
				<select name="eventId" id="eventId" 
				class="easyui-combogrid easyui-validatebox" style="width: 250px"></select>
			</td>
		</tr>
		<s:select label="命令" name="order" list="orders"></s:select>
		<s:radio label="执行情况" list="#{0:'任务执行失败',1:'成功完成'}" name="performance" value="1"></s:radio>
		<s:textfield label="失败原因" name="failuneReasons" />
		<s:submit value="提交"/>
	</s:form>
</body>
</html>