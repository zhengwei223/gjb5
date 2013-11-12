<%@page import="javacommon.gather.bean.GrabageSiteconfig"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<s:hidden id="id" name="id" />

<!-- ONGL access static field: @package.class@field or @vs@field -->
<s:textfield label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_NAME}"
	key="name" value="%{model.name}" cssClass=":required" required="true" />

<s:radio list="#{1:'是',0:'否'}" 
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_USABLE}"
	key="usable" value="%{model.usable}"  />

<s:textfield label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_LINK}"
	key="link" value="%{model.link}" cssClass="" required="false" size="100"/>
	
<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_KEYWORD}"
	key="keyword" value="%{model.keyword}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_FORWARD}"
	key="forward" value="%{model.forward}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_SPLITPATH}"
	key="splitpath" value="%{model.splitpath}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_PAGECOUNT}"
	key="pagecount" value="%{model.pagecount}"
	cssClass=":required :integer " required="true" />
	
<s:textfield label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_XLINK}"
	key="xlink" value="%{model.xlink}" cssClass="" required="false" size="100"/>	
	
<s:textfield label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_TITLE}"
	key="title" value="%{model.title}" cssClass="" required="false" size="100"/>	
	
<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_CONTENT}"
	key="content" value="%{model.content}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_ADVERT_PATHS}"
	key="advertPaths" value="%{model.advertPaths}" cssClass="" size="100"
	required="false" />

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_AUTHOR}"
	key="author" value="%{model.author}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_SOURCE}"
	key="source" value="%{model.source}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_SUMMARY}"
	key="summary" value="%{model.summary}" cssClass="" required="false" size="100"/>

<s:textfield
	label="%{@javacommon.gather.bean.GrabageSiteconfig@ALIAS_TIMELINE}"
	key="timeline" value="%{model.timeline}" cssClass="" required="false" size="100"/>


