<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=LogBusi.TABLE_ALIAS%>信息</title>
</rapid:override>

<rapid:override name="content">
	<s:form action="/pages/LogBusi/list.do" method="get" theme="simple">
		<input type="button" value="返回列表" onclick="window.location='${ctx}/pages/LogBusi/list.do'"/>
		<input type="button" value="后退" onclick="history.back();"/>
		
		<s:hidden name="id" id="id" value="%{model.id}"/>
	
		<table class="formTable">
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_OP_TYPE%></td>	
				<td><s:property value='@com.bm.gjb5.system.DictUtil@getDictValue("log_busi","op_type",model.opType)'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_OP_USER%></td>	
				<td><s:property value='@javacommon.util.db.ConvenientTools@getValueByCond("username","rights_user","id=?",model.opUser)'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_OP_TIME%></td>	
				<td><s:property value="%{model.opTimeString}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_SUBMODULE%></td>	
				<td><s:property value='@com.bm.gjb5.system.DictUtil@getSubModuleName(model.submodule)'/></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_IP%></td>	
				<td><s:property value="%{model.ip}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_EQ_ID%></td>	
				<td><s:property value="%{model.eqId}" /></td>
			</tr>
			<tr>	
				<td class="tdLabel"><%=LogBusi.ALIAS_CONTENT%></td>	
				<td><s:property value="%{model.content}" /></td>
			</tr>
		</table>
	</s:form>
</rapid:override>

<%@ include file="base.jsp" %>