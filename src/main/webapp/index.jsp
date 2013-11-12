<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<c:url value="/scripts/jquery-1.10.2.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/scripts/jquery-migrate-1.2.1.min.js"/>"
	type="text/javascript"></script>

<script type="text/javascript"
	src="<c:url value="/js/jquery-easyui-1.3.4/jquery.easyui.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/js/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/js/jquery-easyui-1.3.4/themes/default/easyui.css" />"
	id="swicth-style">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/js/jquery-easyui-1.3.4/themes/icon.css"/>">

<script type="text/javascript" src="<c:url value="/index.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/index.css"/>">
</head>
<body class="easyui-layout" >
	<div region="north" border="true" class="cs-north">
		<div class="cs-north-bg">
			<!-- logo区域 -->
			<div class="cs-north-logo">
				您好，${roleName }<a href="javascript:;" class="easyui-linkbutton"
					data-options="plain:true">修改密码</a> <a href="${ctx }/logout.do"
					class="easyui-linkbutton" data-options="plain:true">退出</a>
				<p>
					<s:if test="#session.event!=null">
						<s:property value="#session.event.location" />
						<s:property value="#session.event.magnitude" />级地震事件正在运行
				</s:if>
					<s:else>
					无地震事件运行
				</s:else>
			</div>
			<!-- 调整主题样式 -->
			<ul class="ui-skin-nav">
				<li class="li-skinitem" title="低调灰"><span class="gray"
					rel="gray"></span></li>
				<li class="li-skinitem" title="默认"><span class="default"
					rel="default"></span></li>
				<li class="li-skinitem" title="宝石蓝"><span class="bootstrap"
					rel="bootstrap"></span></li>
				<li class="li-skinitem" title="贵族黑"><span class="black"
					rel="black"></span></li>
				<li class="li-skinitem" title="淡雅"><span class="metro"
					rel="metro"></span></li>
			</ul>
		</div>
	</div>
	<div region="west" border="true" split="true" title="导航"
		class="cs-west">
		<div class="easyui-accordion" fit="true" border="false">
			<div title="灾情信息汇集">
				<a href="javascript:void(0);"
					src="${ctx }/pages/DataOriginal/list.do?type=audio"
					class="cs-navi-tab">热线语音数据</a>
				</p>
				<a href="javascript:void(0);"
					src="${ctx }/pages/DataOriginal/list.do?type=audio"
					class="cs-navi-tab">现场指挥数据</a>
				</p>
				
				<a href="javascript:void(0);" src="${ctx }/pages/Pageinfo/list.do"
					class="cs-navi-tab">网络媒体数据</a>
				</p>
			</div>
			<div title="灾情信息处理">
				<a href="javascript:void(0);" src="${ctx }/pages/DataIdentify/list.do"
					class="cs-navi-tab">热线语音数据处理</a>
				</p>
				
				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#mm_0'">现场指挥数据处理</a>
				<div id="mm_0" style="width: 150px;">
					<div>
						<a href="javascript:void(0);" src="${ctx }/html/新页面_2.html"
							class="cs-navi-tab">图像数据</a>
					</div>
					<div>
						<a href="javascript:void(0);" src="${ctx }/html/列表_8.html"
							class="cs-navi-tab">视频数据</a>
					</div>
					<div>
						<a href="javascript:void(0);" src="${ctx }/html/网络媒体.html"
							class="cs-navi-tab">文本数据</a>
					</div>
				</div>
				</p>
				
				<a href="javascript:void(0);" src="${ctx }/pages/Pageinfo/list.do"
					class="cs-navi-tab">网络媒体数据处理</a>
				</p>
			</div>
			
			<div title="灾情信息呈现">
				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#mm_1'">灾情影响场</a>
				</p>
				<div id="mm_1" style="width:150px;">
					<div><a href="javascript:void(0);" src="${ctx }/html/自动修正影响场.html"
					class="cs-navi-tab">自动修正</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/html/手动修正影响场.html"
					class="cs-navi-tab">手工修正</a></div>
				</div>
				
				<a href="javascript:void(0);" src="${ctx }/html/汇总统计.html"
					class="cs-navi-tab">灾情按区域</a>
				</p>
				<a href="javascript:void(0);" src="${ctx }/html/汇总统计.html"
					class="cs-navi-tab">灾情按类型</a>
				</p>
			</div>
			
			<div title="系统管理">
				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#mm_2'">基础配置</a>
				</p>
				<div id="mm_2" style="width:150px;">
					<div><a href="javascript:void(0);" src="${ctx }/pages/RightsUser/list.do"
					class="cs-navi-tab">用户管理</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/Userinfo/list.do"
					class="cs-navi-tab">用户信息同步</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/RightsRole/list.do"
					class="cs-navi-tab">角色管理</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/CommonDict/list.do"
					class="cs-navi-tab">码表维护</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/SysEarthquake/list.do"
					class="cs-navi-tab">地震列表</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/LogBusi/list.do"
					class="cs-navi-tab">数据日志</a></div>
				</div>

				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#mm_3'">灾情分类基础</a>
				</p>
				<div id="mm_3" style="width:150px;">
					<div><a href="javascript:void(0);" src="${ctx }/pages/SysDisasterClassify/list.do"
					class="cs-navi-tab">灾情分类维护</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/SysDisasterPredicate/list.do"
					class="cs-navi-tab">灾情谓词维护</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/pages/SysDisasterMeasurement/list.do"
					class="cs-navi-tab">灾情度量维护</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/html/列表_3.html"
					class="cs-navi-tab">图标维护</a></div>
					
				</div>
				
				<a href="javascript:void(0);" class="easyui-menubutton"
					data-options="menu:'#mm_4'">调试</a>
				</p>
				<div id="mm_4" style="width:150px;">
					<div><a href="javascript:void(0);" src="${ctx }/pages/ControlFeedback/toFeedBack.do"
					class="cs-navi-tab">协同控制反馈调试</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/test/sendAppRecord.jsp"
					class="cs-navi-tab">发送应用消息</a></div>
					<div><a href="javascript:void(0);" src="${ctx }/test/sendException.jsp"
					class="cs-navi-tab">发送异常消息</a></div>
					
					
				</div>
			</div>
			<div title="数据管理">
				<a href="javascript:void(0);" src="${ctx }/pages/SysJob/list.do"
					class="cs-navi-tab">数据来源配置</a>
				</p>
				<a href="javascript:void(0);" src="${ctx }/pages/GrabageSiteconfig/list.do"
					class="cs-navi-tab">网络媒体数据采集配置</a>
				</p>

			</div>

			<s:if test="#session.event==null">
				请选择地震事件
				<script type="text/javascript">
					$('.easyui-accordion>div').each(function() {
						$(this).panel({
							closed : true
						});
					});
				</script>
			</s:if>
		</div>
	</div>
	<div id="mainPanle" region="center" border="true" border="false">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="Home">
				<div class="cs-home-remark">
					<s:action name="Earthquake/toSelect" namespace="/pages"
						executeResult="true" flush="true">
					</s:action>
				</div>
			</div>
		</div>
	</div>

	<div region="south" border="false" id="south">
		<center>中国地震台网中心</center>
	</div>

	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>


</body>
</html>
