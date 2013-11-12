<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<%@ include file="/commons/taglibs.jsp"  %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/commons/meta.jsp"%>
<title>灾情展现</title>

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
	
	  <h3 class="headerbar">已处理灾情展现</h3>
	  <ul>
		<li><a href="${ctx }/html/影响场.html" target="rightFrame">灾情影响场展示</a></li>
		<li><a href="${ctx }/html/汇总统计.html" target="rightFrame">灾情按区域展示</a></li>
		<li><a href="${ctx }/html/汇总统计.html" target="rightFrame">灾情按区域展示</a></li>
	  </ul>

	  <h3 class="headerbar">缺失内容</h3>
	  <ul>
		<li><a href="${ctx }/html/列表_9.html" target="rightFrame">缺失内容数据列表</a></li>
	  </ul>

</div>

</body>
</html>