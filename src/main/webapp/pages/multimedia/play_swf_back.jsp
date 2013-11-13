<%@ page language="java" 
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE base PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" type="text/css" href="${ctx }/css/flexpaper.css" />
    <script type="text/javascript" src="${ctx }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx }/js/flexpaper.js"></script>
    <script type="text/javascript" src="${ctx }/js/flexpaper_handlers.js"></script>
</head>
<body>

	<c:choose>
		<c:when test="${errorMsg!=null }">
	${errorMsg}
</c:when>
		<c:otherwise>

			<div id="documentViewer" class="flexpaper_viewer" style="width: 770px; height: 500px"></div>

			<script type="text/javascript">
			alert();
				$('#documentViewer').FlexPaperViewer({
					config : {
						SWFFile : '${swfPath}',
						Scale : 1.0,
						ZoomTransition : 'easeOut',
						ZoomTime : 0.5,
						ZoomInterval : 0.2,
						FitPageOnLoad : true,
						FitWidthOnLoad : false,
						FullScreenAsMaxWindow : false,
						ProgressiveLoading : false,
						MinZoomSize : 0.2,
						MaxZoomSize : 5,
						SearchMatchAll : false,
						InitViewMode : 'Portrait',
						RenderingOrder : 'flash',
						StartAtPage : '',

						ViewModeToolsVisible : true,
						ZoomToolsVisible : true,
						NavToolsVisible : true,
						CursorToolsVisible : true,
						SearchToolsVisible : true,
						WMode : 'window',
						localeChain : 'zh_CN'
					}
				});
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>