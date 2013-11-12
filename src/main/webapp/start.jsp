<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<div>
	<s:if test="#session.event==null">
		<h2>
			<span style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;未选择地震事件，请在下方列表选择。 </span>
		</h2>
	</s:if>
	<s:else>
		<h2 style="background-color: #ddd;text-align: center"><s:property value="#session.event.location"/><s:property value="#session.event.magnitude"/>级地震</h2>
		<div style="width: 30%;float: left;position: relative;left: 100px">
			<h3>基本信息</h3>
			<table class="formTable">
				<s:label label="发震时刻" value="%{#session.event.eventTimeString}"></s:label>
				<s:label label="经度" value="%{#session.event.longitude}°"></s:label>
				<s:label label="纬度" value="%{#session.event.latitude}°"></s:label>
				<s:label label="震源深度" value="%{#session.event.focalDepth}"></s:label>
				<s:label label="震级" value="%{#session.event.magnitude}km"></s:label>
				<s:label label="参考位置" value="%{#session.event.location}"></s:label>
			</table>
		</div>
		<div style="width: 30%;float: left">
			<img src="${ctx }/html/初始页_files/u23_normal.png" />
		</div>
		<div style="width: 30%;float: left;position: relative;left: -50px">
			<h3>数据更新情况</h3>
			<p>【热线语音数据】&nbsp;&nbsp;100条</p>
			<p>【现场指挥数据】&nbsp;&nbsp;1000条</p>
			<p>【网络媒体数据】&nbsp;&nbsp;2000条</p>
		</div>
	</s:else>

</div>
<div style="margin: 10px 0;clear: both;"></div>
<hr>
<h2 style="background-color: #ddd;text-align: center">事件列表</h2>
<s:iterator value="events">

	<div style="float: left;">
		<dl>
			<dd>
				<a
					href="${ctx }/pages/Earthquake/select.do?eventId=<s:property value='eventId'/>"><img
					src="${ctx }/html/初始页_files/u23_normal.png" /></a>
			</dd>
			<dt style="text-align: center">
				<s:property value="location" />
				<s:property value="magnitude" />
				级地震
			</dt>
		</dl>
	</div>
</s:iterator>
