<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/taglibs.jsp"  %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp"%>
<title>灾情处理</title>

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
	
	  <h3 class="headerbar">现场灾情处理</h3>
	  <ul>
		<li><a href="${ctx }/html/新页面_2.html" target="rightFrame">图片处理</a></li>
		<li><a href="${ctx }/pages/DataIdentify/list.do" target="rightFrame">视频处理</a></li>
		<li><a href="${ctx }/pages/DataIdentify/list.do" target="rightFrame">文本处理</a></li>
	  </ul>
<h3 class="headerbar">网络媒体信息处理</h3>
	  <ul>
		<li><a href="${ctx }/pages/Pageinfo/list.do" target="rightFrame">信息处理</a></li>
	  </ul>
	  <h3 class="headerbar">国家热线灾情处理</h3>
	  <ul>
		<li><a href="${ctx }/pages/DataIdentify/list.do" target="rightFrame">语音处理</a></li>
	  </ul>
</div>

</body>
</html>