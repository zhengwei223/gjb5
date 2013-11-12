/**
 * @author zheng
 */
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "parentId",
					rootPId: 0
				}
			}
		};
		
		function setCheck() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			type =  { "Y" : "ps", "N" : "ps" };//设置关联
			zTree.setting.check.chkboxType = type;
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			setCheck();
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			//监听提交按钮
			$("#submitButton").click(function(){
				//此处应添加表单验证
				var nodes = zTree.getChangeCheckedNodes(true);
				var form = $("form").serializeArray();
				//alert(form[0].value);
				var nodesArray = zTree.transformToArray(nodes);
				//alert(form[5].value);
//				alert(nodesArray.length);
				//JSON.stringify(nodesArray);
				//document.write(JSON.stringify(nodesArray));
				$.post("pages/RightsRole/save.do",
						{
							"id":form[0].value,
							"name":form[1].value,
							"descp":form[2].value,
							"status":form[3].value,
							"remark":form[4].value,
							"perm":form[5].value,
							"json":JSON.stringify(nodesArray)
						},
						function(data){
							window.location.href=ctx+"/pages/RightsRole/list.do";
						}
				);

			});
			
		});