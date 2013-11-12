<%@page import="com.bm.gjb5.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<rapid:override name="head">
	<title><%=DataOriginal.TABLE_ALIAS%>信息</title>
	<script type="text/javascript">
		var play=function(_id){
			$("#mediaDiv").window('open');
			$("#mediaPlay").load('pages/DataOriginal/play.do',{id:_id,t:new Date()});
		};
		$(function(){
			$("#mediaDiv").window({
				title:"原始内容",
				inline:true,
				closed:true,
				minimizable:false,
				width:800,
				height:200,
				top:200,
				left:0,
				draggable:false
				
			});
			
		});
	</script>
<style>
.form{
	float: left;
}

</style>
</rapid:override>

<rapid:override name="content">
<div class="form">

	<s:form action="/pages/DataOriginal/list.do" method="get"
		theme="simple">
		<input type="button" value="返回列表"
			onclick="window.location='${ctx}/pages/DataOriginal/list.do'" />
		<input type="button" value="后退" onclick="history.back();" />
		<hr>
		<s:hidden name="id" id="id" value="id" />
		<s:url value='/pages/DataOriginal/play.do' var="playUrl"
			includeContext="false">
			<s:param name="id" value="%{id}"></s:param>
		</s:url>
		<table class="formTable">
			<tr>
				<td class="tdLabel">灾情名称</td>
				<td><s:property value="eqinfo" /></td>
			</tr>
			<tr>
				<td class="tdLabel">灾情文件</td>
				<td>
					${filename}&nbsp; 
					<a href="javascript:;" class="easyui-linkbutton" onclick="play('${id}')">查看/播放</a>
					<%-- <s:if test="exists">
					</s:if>
					<s:else>
						文件不存在!
					</s:else> --%>
				</td>
			</tr>
			<tr>
				<td class="tdLabel">数据来源</td>
				<td><s:property value="originalName" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataOriginal.ALIAS_NOTICE_TIME%></td>
				<td><s:property value="noticeTimeString" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataOriginal.ALIAS_COLL_TIME%></td>
				<td><s:property value="collTimeString" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataOriginal.ALIAS_FILE_SIZE%></td>
				<td><s:property value="fileSizeString" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataOriginal.ALIAS_STATUS%></td>
				<td><s:property value="statusList[status]" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataOriginal.ALIAS_BATCH%></td>
				<td><s:property value="batch" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataOriginal.ALIAS_EQ%></td>
				<td><s:property value="eventId" /></td>
			</tr>
		</table>
	</s:form>
	</div>

<div id="mediaDiv" class="easyui-window" >
	<div id="mediaPlay"></div>
</div>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp"%>