<%@page import="com.bm.gjb5.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

	<s:hidden id="eventId" name="eventId" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
	
	<tr>	
		<td class="tdLabel">
			<%=SysEarthquake.ALIAS_EVENT_TIME%>:
		</td>	
		<td>
		<input value="${model.eventTimeString}" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_EVENT_TIME%>'})" id="eventTimeString" name="eventTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysEarthquake@ALIAS_LONGITUDE}" key="longitude" value="%{model.longitude}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysEarthquake@ALIAS_LATITUDE}" key="latitude" value="%{model.latitude}" cssClass="" required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysEarthquake@ALIAS_FOCAL_DEPTH}" key="focalDepth" value="%{model.focalDepth}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysEarthquake@ALIAS_MAGNITUDE}" key="magnitude" value="%{model.magnitude}" cssClass="validate-integer " required="false" />
	
	
	<s:textfield label="%{@com.bm.gjb5.model.SysEarthquake@ALIAS_LOCATION}" key="location" value="%{model.location}" cssClass="" required="false" />
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysEarthquake.ALIAS_START_TIME%>:
		</td>	
		<td>
		<input value="${model.startTimeString}" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_START_TIME%>'})" id="startTimeString" name="startTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	
	<tr>	
		<td class="tdLabel">
			<%=SysEarthquake.ALIAS_END_TIME%>:
		</td>	
		<td>
		<input value="${model.endTimeString}" onclick="WdatePicker({dateFmt:'<%=SysEarthquake.FORMAT_END_TIME%>'})" id="endTimeString" name="endTimeString"  maxlength="0" class="" />
		</td>
	</tr>
	
	<s:select list='statusList' label="状态" key="status"></s:select>
