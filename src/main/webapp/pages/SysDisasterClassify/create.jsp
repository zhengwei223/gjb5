<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=SysDisasterClassify.TABLE_ALIAS%>新增</title>
</rapid:override>

<rapid:override name="content">
	<div style="margin: 10px 5px;text-align: left">
		<a class="easyui-linkbutton" data-options="plain:true" href="javascript:;" onclick="$('#save').submit();">提交</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="window.location='${ctx}/pages/SysDisasterClassify/list.do'" >返回列表</a>
		<a class="easyui-linkbutton" data-options="plain:true" onclick="history.back();" >后退</a>
	</div>
	<s:form action="/pages/SysDisasterClassify/save.do" method="post">
		
		<table class="formTable">
		<%@ include file="form_include.jsp" %>
		</table>
	</s:form>
	
	<script>
		
		new Validation(document.forms[0],{onSubmit:true,onFormValidate : function(result,form) {
			var finalResult = result;
			
			//在这里添加自定义验证
			
			return disableSubmit(finalResult,'submitButton');
		}});
	</script>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>