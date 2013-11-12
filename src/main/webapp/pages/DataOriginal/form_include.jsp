<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_FORM}" key="form" value="%{model.form}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_REMOTE_URL}" key="remoteUrl" value="%{model.remoteUrl}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=DataOriginal.ALIAS_NOTICE_TIME%>:
		</td>	
		<td>
		<input value="${model.noticeTimeString}" onclick="WdatePicker({dateFmt:'<%=DataOriginal.FORMAT_NOTICE_TIME%>'})" id="noticeTimeString" name="noticeTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<tr>	
		<td class="tdLabel">
			<%=DataOriginal.ALIAS_COLL_TIME%>:
		</td>	
		<td>
		<input value="${model.collTimeString}" onclick="WdatePicker({dateFmt:'<%=DataOriginal.FORMAT_COLL_TIME%>'})" id="collTimeString" name="collTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_LOCALE_URL}" key="localeUrl" value="%{model.localeUrl}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_LOCALE_FMT_URL}" key="localeFmtUrl" value="%{model.localeFmtUrl}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_FILENAME}" key="filename" value="%{model.filename}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_FMT_FNAME}" key="fmtFname" value="%{model.fmtFname}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_FILE_SIZE}" key="fileSize" value="%{model.fileSize}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_STATUS}" key="status" value="%{model.status}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_BATCH}" key="batch" value="%{model.batch}" cssClass="validate-integer max-value-2147483647" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.DataOriginal@ALIAS_JOB_ID}" key="jobId" value="%{model.jobId}" cssClass="" required="false" />
	
