<%@ page language="java" pageEncoding="UTF-8"%>
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
<title>产出物通知消息接口调试页面</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#eventId").combogrid({
			editable : false,
			panelWidth : 600,
			idField : 'eventId',
			textField : 'location',
			url : '<s:url value="/pages/SysEarthquake/listJson.do" />',
			method : 'get',
			columns : [ [ {
				field : 'eventId',
				title : '地震序列',
				width : 150
			}, {
				field : 'eventTimeString',
				title : '发震时间',
				width : 150
			}, {
				field : 'location',
				title : '发震地点',
				width : 300,
				align : 'left'
			} ] ],
			fitColumns : true
		});
	});
</script>
</head>
<body>
	<%@ include file="/commons/messages.jsp"%>
	<h3>发送应用日志</h3>
	将wsdl路径配置在码表中，webService-->dataUpdate
	<s:form action="DataUpdate/send.do" namespace="/wstest">
		<tr>
			<td class="tdLabel"><label for="eventId" class="label">地震序列:</label></td>
			<td><select name="earthquakeId" id="eventId" class="easyui-combogrid easyui-validatebox" style="width: 250px"></select></td>
		</tr>
		<s:textfield label="数据记录主键" name="pkId" />
		<s:textfield label="数据名称" name="dataName" />
		<s:select label="数据类型" name="dataType" list="#{1:'文本',2:'图片',3:'文档',4:'音视频',5:'其它信息'}"></s:select>
		<s:textfield label="数据路径" name="dataPath" />
		<s:select label="重要程度" name="important" list="#{1:'非常重要',2:'比较重要',3:'普通',4:'不重要'}"></s:select>
		<s:textfield label="地点" name="disasterSite" />
		<s:textfield label="关键字" name="keyword" />
		<s:textfield label="描述" name="describe" />
		<tr>
			<td class="tdLabel"><label for="eventId" class="label">获取时间:</label></td>
			<td><input name="getTime" class="easyui-datetimebox" /></td>
		</tr>
		<s:textfield label="生产包" name="creator" />
		<s:textfield label="收集类型？" name="dateColType" />
		<s:textfield label="责任人" name="expert" />
		<s:textfield label="责任单位" name="organization" />
		<s:submit value="提交" />
	</s:form>
</body>
</html>