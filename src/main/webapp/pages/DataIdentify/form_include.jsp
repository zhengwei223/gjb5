<%@page import="com.bm.gjb5.model.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<input type="hidden" name="id" value="${model.id }" />
<input type="hidden" name="originalId" value="${dataOriginal.id }" />
<tr>
	<td colspan="2"><s:push value="dataOriginal">

			<table>
				<tr>
					<td class="tdLabel">灾情名称:</td>
					<td><s:property value="eqinfo" /></td>
					<td class="tdLabel">灾情文件:</td>
					<td><s:property value="filename" />&nbsp; <s:if test="exists">
							<a href="pages/DataOriginal/play.do?id=<s:property value="id" />"
								class="easyui-linkbutton" target="_blank">查看/播放</a>
						</s:if> <s:else>
						文件不存在!
					</s:else></td>
				</tr>
				<tr>
					<td class="tdLabel">数据来源:</td>
					<td><s:property value="originalName" /></td>
					<td class="tdLabel">提供时间:</td>
					<td><s:property value="noticeTimeString" /></td>
				</tr>

				<tr>
					<td class="tdLabel">汇集时间:</td>
					<td><s:property value="collTimeString" /></td>
					<td class="tdLabel"><%=DataOriginal.ALIAS_FILE_SIZE%>:</td>
					<td><s:property value="fileSizeString" /></td>
				</tr>
			</table>
		</s:push></td>
</tr>
<!-- ONGL access static field: @package.class@field or @vs@field -->
<s:textarea label="识别信息" name="txtInfo1" cols="80" rows="5"></s:textarea>
<s:textarea label="语义分析" name="semantics" cols="80" rows="5"></s:textarea>

<tr>
	<td colspan="2" bgcolor="#FFFACD">&nbsp;</td>
</tr>
<tr>
	<td colspan="2">分析结果</td>
</tr>

<tr>
	<td colspan="2">

		<table>
			<tr>
				<td class="tdLabel">发生时间:</td>
				<td><input value="${eventTimeString}"
					onclick="WdatePicker({dateFmt:'<%=DataIdentify.FORMAT_EVENT_TIME%>'})"
					id="eventTimeString" name="eventTimeString" class=":required" />
				</td>
				<td class="tdLabel">地点:</td>
				<td><s:textfield theme="simple" key="location"
						value="%{location}" cssClass=":required" /></td>
			</tr>
			<tr>
				<td class="tdLabel"><%=DataIdentify.ALIAS_SEISESTHESIA%>:</td>
				<td><s:textfield key="seisesthesia" value="%{seisesthesia}"
						theme="simple" cssClass=":required" /></td>
				<td class="tdLabel"><%=DataIdentify.ALIAS_LONGITUDE%></td>
				<td><s:textfield key="longitude" value="%{longitude}"
						cssClass="" theme="simple" /></td>
			</tr>

			<tr>
				<td class="tdLabel"><%=DataIdentify.ALIAS_MAGNITUDE%></td>
				<td><s:textfield key="magnitude" value="%{magnitude}"
						cssClass="" theme="simple" /></td>
				<td class="tdLabel"><%=DataIdentify.ALIAS_LATITUDE%>:</td>
				<td><s:textfield key="latitude" value="%{latitude}" cssClass=""
						theme="simple" /></td>
			</tr>
		</table>
	</td>
</tr>






