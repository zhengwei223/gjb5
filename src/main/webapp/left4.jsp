<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp"%>
<title>系统管理</title>

<link href="${ctx }/styles/left.css" type="text/css" rel="stylesheet" />

<script>
	$(document).ready(function() {
		$('.urbangreymenu li a').click(function() {
			$('.urbangreymenu li a').removeClass('currentClickMenu');
			$(this).addClass('currentClickMenu');
		});

		$('.headerbar').click(function() {
			$(this).next().toggle();
		});
	});
</script>


</head>

<body>

	<div class="urbangreymenu">

		<h3 class="headerbar">系统管理</h3>
		<ul>
			<li><a href="${ctx }/pages/RightsUser/list.do"
				target="rightFrame">用户管理</a></li>
			<li><a href="${ctx }/pages/Userinfo/list.do"
				target="rightFrame">用户同步管理</a></li>
				
			<li><a href="${ctx }/pages/RightsRole/list.do"
				target="rightFrame">角色管理</a></li>
			<li><a href="${ctx }/pages/CommonDict/list.do"
				target="rightFrame">码表维护</a></li>
			<li><a href="${ctx }/pages/SysEarthquake/list.do"
				target="rightFrame">地震事件维护</a></li>
			<li><a href="${ctx }/pages/LogBusi/list.do" target="rightFrame">系统日志</a></li>
		</ul>
		<h3 class="headerbar">灾情基础数据</h3>
		<ul>
			<li><a href="${ctx }/pages/SysDisasterClassify/list.do"
				target="rightFrame">灾情分类维护</a></li>
			<li><a href="${ctx }/pages/SysDisasterPredicate/list.do"
				target="rightFrame">谓词维护</a></li>
			<li><a href="${ctx }/pages/SysDisasterMeasurement/list.do"
				target="rightFrame">度量维护</a></li>
		</ul>
		
		<h3 class="headerbar">调试</h3>
		<ul>
			<li><a href="${ctx }/pages/ControlFeedback/toFeedBack.do"
				target="rightFrame">协同控制反馈调试</a></li>
				<li><a href="${ctx }/test/sendAppRecord.jsp"
				target="rightFrame">发送应用消息</a></li>
				<li><a href="${ctx }/test/sendException.jsp"
				target="rightFrame">发送异常消息</a></li>
		</ul>
		
	</div>

</body>
</html>