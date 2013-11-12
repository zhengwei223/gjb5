<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp"%>
<title>灾情汇集</title>

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
<style>
.cs-west {
	width: 200px;
	padding: 0px;
}

.cs-navi-tab {
	padding: 5px;
}
</style>

</head>

<body>
	<div class="urbangreymenu">
		<shiro:hasAnyRoles name="系统管理员,系统操作员">
			<h3 class="headerbar">灾情来源配置管理</h3>
			<ul>
				<li><a href="${ctx }/pages/SysJob/list.do" target="rightFrame">数据来源配置列表</a></li>
				<li><a href="${ctx }/pages/GrabageSiteconfig/list.do"
					target="rightFrame">网络媒体来源配置</a></li>
			</ul>
		</shiro:hasAnyRoles>
		<h3 class="headerbar">灾情数据</h3>
		<ul>
			<li><a href="${ctx }/pages/DataOriginal/list.do"
				target="rightFrame">灾情数据</a></li>
			<li><a href="${ctx }/pages/Pageinfo/list.do" target="rightFrame">网络媒体数据</a></li>
		</ul>

	</div>

</body>
</html>