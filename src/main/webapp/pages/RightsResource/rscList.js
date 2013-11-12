/**
 * @author zheng
 */
	var setting = {
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			selectedMulti : false
		},
		edit : {
			drag: {
				autoExpandTrigger: true,
				prev: dropPrev,
				inner: dropInner,
				next: dropNext
			},
			enable : true,
			editNameSelectAll : true,
			showRemoveBtn : showRemoveBtn,
			showRenameBtn : showRenameBtn
		},
		data : {
			key: {
				url: "url"
			},
			simpleData : {
				enable : true,
				idKey: "id",
				pIdKey: "parentId",
				rootPId: 0
			}
		},
		callback : {
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop,
			beforeDragOpen: beforeDragOpen,
			onDrag: onDrag,
			onDrop: onDrop,
			onExpand: onExpand,
			beforeEditName : beforeEditName,
			beforeRemove : beforeRemove,
			beforeRename : beforeRename,
			onRemove : onRemove,
			onRename : onRename
		}
	};

 		
	function dropPrev(treeId, nodes, targetNode) {
		var pNode = targetNode.getParentNode();
		if (pNode && pNode.dropInner === false) {
			return false;
		} else {
			for (var i=0,l=curDragNodes.length; i<l; i++) {
				var curPNode = curDragNodes[i].getParentNode();
				if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
					return false;
				}
			}
		}
		return true;
	}
	function dropInner(treeId, nodes, targetNode) {
		if (targetNode && targetNode.dropInner === false) {
			return false;
		} else {
			for (var i=0,l=curDragNodes.length; i<l; i++) {
				if (!targetNode && curDragNodes[i].dropRoot === false) {
					return false;
				} else if (curDragNodes[i].parentTId && curDragNodes[i].getParentNode() !== targetNode && curDragNodes[i].getParentNode().childOuter === false) {
					return false;
				}
			}
		}
		return true;
	}
	function dropNext(treeId, nodes, targetNode) {
		var pNode = targetNode.getParentNode();
		if (pNode && pNode.dropInner === false) {
			return false;
		} else {
			for (var i=0,l=curDragNodes.length; i<l; i++) {
				var curPNode = curDragNodes[i].getParentNode();
				if (curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false) {
					return false;
				}
			}
		}
		return true;
	}

	var log, className = "dark", curDragNodes, autoExpandNode;
	function beforeDrag(treeId, treeNodes) {
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" beforeDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				curDragNodes = null;
				return false;
			} else if (treeNodes[i].parentTId && treeNodes[i].getParentNode().childDrag === false) {
				curDragNodes = null;
				return false;
			}
		}
		curDragNodes = treeNodes;
		return true;
	}
	function beforeDragOpen(treeId, treeNode) {
		autoExpandNode = treeNode;
		return true;
	}
	function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy) {
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" beforeDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
		showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"));
		return true;
	}
	function onDrag(event, treeId, treeNodes) {
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" onDrag ]&nbsp;&nbsp;&nbsp;&nbsp; drag: " + treeNodes.length + " nodes." );
	}
	function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy) {
		className = (className === "dark" ? "":"dark");
		showLog("[ "+getTime()+" onDrop ]&nbsp;&nbsp;&nbsp;&nbsp; moveType:" + moveType);
		showLog("target: " + (targetNode ? targetNode.name : "root") + "  -- is "+ (isCopy==null? "cancel" : isCopy ? "copy" : "move"))
	}
	function onExpand(event, treeId, treeNode) {
		if (treeNode === autoExpandNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" onExpand ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name);
		}
	}
	

	function beforeEditName(treeId, treeNode) {
		className = (className === "dark" ? "" : "dark");
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.selectNode(treeNode);
		showOverlay(treeNode);
		return false;
	}
	var overlay_node;
	function showOverlay(treeNode){
		overlay_node = treeNode;
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		//$('#overlayDiv').skygqbox();//弹出编辑框
		$('#overlayDiv').dialog({buttons: [{
					text:'确认',
					iconCls:'icon-ok',
					handler:function(){
						overlay_node.name = $("#node_name").val();
						overlay_node.url = $("#node_url").val();
						overlay_node.descp = $("#node_descp").text();
						zTree.updateNode(overlay_node);
						$('#overlayDiv').dialog('close');
					}
				},{
					text:'取消',
					handler:function(){
						//alert('cancel');
						$('#overlayDiv').dialog('close');
					}
				}]});
		$('#overlayDiv').dialog('open');
		$("#node_name").val(treeNode.name);
		$("#node_name").focus();
		$("#node_name").select();
		$("#node_url").val(treeNode.url);
		$("#node_descp").text(treeNode.descp);
	}
	function beforeRemove(treeId, treeNode) {
		className = (className === "dark" ? "" : "dark");
		showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
				+ treeNode.name);
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.selectNode(treeNode);
		return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
	}

	function onRemove(e, treeId, treeNode) {
		showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
				+ treeNode.name);
	}

	function beforeRename(treeId, treeNode, newName, isCancel) {
		className = (className === "dark" ? "" : "dark");
		showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime()
				+ " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name
				+ (isCancel ? "</span>" : ""));
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			setTimeout(function() {
				zTree.editName(treeNode);
			}, 10);
			return false;
		}
		return true;
	}

	function onRename(e, treeId, treeNode, isCancel) {
		showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime()
				+ " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name
				+ (isCancel ? "</span>" : ""));
	}

	function showRemoveBtn(treeId, treeNode) {
		return !treeNode.noRemove;
	}

	function showRenameBtn(treeId, treeNode) {
		return !treeNode.noRename;
	}

	function showLog(str) {
		/* if (!log)
			log = $("#log");
		log.append("<li class='" + className + "'>" + str + "</li>");
		if (log.children("li").length > 8) {
			log.get(0).removeChild(log.children("li")[0]);
		} */
	}

	function getTime() {
		var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
				.getSeconds(), ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	var newCount = -1;
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
			return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_" + treeNode.tId);
		if (btn)
			btn.bind("click", function() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.addNodes(treeNode, {
					id : newCount,//新增节点给定一个特殊id，负数，在服务端计算出正确的id
					parentId : treeNode.id,
					name : "new node" + (newCount--)
				});
				return false;
			});
	};
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.tId).unbind().remove();
	};
	/* function selectAll() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
	} */

	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		
		
		//弹出层上的按钮处理
		/*$("#overlay_cancle").click(function(){
			$('#overlayDiv').dialog('close');
		});*/
		/*$("#overlay_sub").click(function(){
			overlay_node.name = $("#node_name").val();
			overlay_node.url = $("#node_url").val();
			overlay_node.descp = $("#node_descp").text();
			zTree.updateNode(overlay_node);
			$('#overlayDiv').dialog('close');
		});*/
		//保存按钮处理
		$("#all_submit").click(function(){
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = zTree.transformToArray(zTree.getNodes());
			//document.write(JSON.stringify(nodes));
			//alert();
			$.post(basePath+"pages/RightsResource/save.do",
				{
					'json': JSON.stringify(nodes)
				},
				function(data){
					if(data.info&&data.info==1)	
						alert("保存成功");
					else
						alert("保存失败");
				},
				"json");
		});
	});
	
	
