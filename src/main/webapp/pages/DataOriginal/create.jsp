<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title>灾情原始数据录入</title>
</rapid:override>

<rapid:override name="content">
	<h3>灾情录入</h3>
	
	<s:form action="/pages/DataOriginal/save.do" method="post" enctype="multipart/form-data">

		<table class="formTable">
			<tr>
				<td class="tdLabel">地震序列:</td>
				<td>
				<select name="eventId" class="easyui-combogrid easyui-validatebox" style="width:250px" data-options="
						required:true,
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
					" >
				</select>
				</td>
			</tr>
			<s:file label="数据文件" name="upload"  cssClass="easyui-validatebox" data-options="required:true"/>
			<s:textfield label="批次" name="batch"  />
			<tr>
				<td></td>
				<td>
				<input id="submitButton" name="submitButton" type="submit" value="提交" />
				<input type="button" value="返回列表"
					onclick="window.location='${ctx}/pages/DataOriginal/list.do'" />
				<input type="button" value="后退" onclick="history.back();" />
				</td>
			</tr>
		</table>
	</s:form>

</rapid:override>

<%@ include file="base.jsp"%>