<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String basePath = request.getContextPath()+"/";
%>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/commons/meta.jsp" %>
<c:choose>
<c:when test="${errorMsg!=null }">
	${errorMsg}
</c:when>
<c:otherwise>

<script type="text/javascript" src="<%=basePath%>js/flexpaper.js"></script>
<script type="text/javascript" src="<%=basePath%>js/flexpaper_handlers.js"></script>
	<div id="documentViewer" 
		style="width: 770px; height: 500px"></div>

<script type="text/javascript">
	$('#documentViewer').FlexPaperViewer( {
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
