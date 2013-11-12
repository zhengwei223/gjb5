<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>menu</title>
	<%@include file="/commons/meta.jsp" %>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {

			view : {
				dblClickExpand : false,
				showLine : true,
				selectedMulti : false
			},
			data : {
				key : {
					url : "url"
				},
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "parentId",
					rootPId : 0
				}
			},
			callback : {
				beforeClick : function(treeId, treeNode) {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					if (treeNode.isParent) {//点击展开节点
						zTree.expandNode(treeNode);
						return false;
					}
				}
			}
		};
		function expandNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"), type = e.data.type, nodes = zTree
					.getSelectedNodes();
			if (type.indexOf("All") < 0 && nodes.length == 0) {
				alert("请先选择一个父节点");
			}

			if (type == "expandAll") {
				zTree.expandAll(true);
			} else if (type == "collapseAll") {
				zTree.expandAll(false);
			} else {
				var callbackFlag = $("#callbackTrigger").attr("checked");
				for ( var i = 0, l = nodes.length; i < l; i++) {
					zTree.setting.view.fontCss = {};
					if (type == "expand") {
						zTree.expandNode(nodes[i], true, null, null,
								callbackFlag);
					} else if (type == "collapse") {
						zTree.expandNode(nodes[i], false, null, null,
								callbackFlag);
					} else if (type == "toggle") {
						zTree.expandNode(nodes[i], null, null, null,
								callbackFlag);
					} else if (type == "expandSon") {
						zTree.expandNode(nodes[i], true, true, null,
								callbackFlag);
					} else if (type == "collapseSon") {
						zTree.expandNode(nodes[i], false, true, null,
								callbackFlag);
					}
				}
			}
		}
		/* var zNodes =[
			{ id:1, pId:0, name:"展开、折叠 自定义图标不同", open:true, iconSkin:"pIcon01"},
			{ id:11, pId:1, name:"叶子节点1", iconSkin:"icon01"},
			{ id:12, pId:1, name:"叶子节点2", iconSkin:"icon02"},
			{ id:13, pId:1, name:"叶子节点3", iconSkin:"icon03"},
			{ id:2, pId:0, name:"展开、折叠 自定义图标相同", open:true, iconSkin:"pIcon02"},
			{ id:21, pId:2, name:"叶子节点1", iconSkin:"icon04"},
			{ id:22, pId:2, name:"叶子节点2", iconSkin:"icon05"},
			{ id:23, pId:2, name:"叶子节点3", iconSkin:"icon06"},
			{ id:3, pId:0, name:"不使用自定义图标", open:true },
			{ id:31, pId:3, name:"叶子节点1"},
			{ id:32, pId:3, name:"叶子节点2"},
			{ id:33, pId:3, name:"叶子节点3"}
		]; */
		var zNodes = <s:property value="#session.rscTreeNodes" escape="false"/>;
		$(document).ready(function() {
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.expandAll(true);
			$("#expandAllBtn").bind("click", {
				type : "expandAll"
			}, expandNode);
			$("#collapseAllBtn").bind("click", {
				type : "collapseAll"
			}, expandNode);
		});
	//-->
	</SCRIPT>
	<style type="text/css">
		.ztree li span.button.pIcon01_ico_open{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/1_open.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.pIcon01_ico_close{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/1_close.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close{margin-right:2px; background: url(/css/zTreeStyle/img/diy/2.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon01_ico_docu{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/3.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon02_ico_docu{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/4.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon03_ico_docu{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/5.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon04_ico_docu{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/6.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon05_ico_docu{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/7.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
		.ztree li span.button.icon06_ico_docu{margin-right:2px; background: url(${ctx}/css/zTreeStyle/img/diy/8.png) no-repeat scroll 0 0 transparent; vertical-align:top; *vertical-align:middle}
	</style>
</head>

<body>

<div>
	<div class="zTreeDemoBackground left">
		<span style="margin-left: 10px;">
			<a id="expandAllBtn" href="#" title="展开" onclick="return false;">展开</a>
			<a id="collapseAllBtn" href="#" title="折叠" onclick="return false;">折叠</a>
		</span>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>

</body>
</html>
