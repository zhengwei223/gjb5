package com.bm.gjb5.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

import java.util.*;
import java.lang.reflect.*;
import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.service.*;
import com.bm.gjb5.vo.query.*;
import org.slf4j.*;
public class GrabageSiteconfigQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** advertPaths */
	private java.lang.String advertPaths;
	/** author */
	private java.lang.String author;
	/** content */
	private java.lang.String content;
	/** forward */
	private java.lang.String forward;
	/** link */
	private java.lang.String link;
	/** pagecount */
	private java.lang.Long pagecount;
	/** source */
	private java.lang.String source;
	/** splitpath */
	private java.lang.String splitpath;
	/** summary */
	private java.lang.String summary;
	/** timeline */
	private java.lang.String timeline;
	/** title */
	private java.lang.String title;
	/** usable */
	private java.lang.String usable;
	/** xlink */
	private java.lang.String xlink;
	/** keyword */
	private java.lang.String keyword;
	/** name */
	private java.lang.String name;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getAdvertPaths() {
		return this.advertPaths;
	}
	
	public void setAdvertPaths(java.lang.String value) {
		this.advertPaths = value;
	}
	
	public java.lang.String getAuthor() {
		return this.author;
	}
	
	public void setAuthor(java.lang.String value) {
		this.author = value;
	}
	
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	
	public java.lang.String getForward() {
		return this.forward;
	}
	
	public void setForward(java.lang.String value) {
		this.forward = value;
	}
	
	public java.lang.String getLink() {
		return this.link;
	}
	
	public void setLink(java.lang.String value) {
		this.link = value;
	}
	
	public java.lang.Long getPagecount() {
		return this.pagecount;
	}
	
	public void setPagecount(java.lang.Long value) {
		this.pagecount = value;
	}
	
	public java.lang.String getSource() {
		return this.source;
	}
	
	public void setSource(java.lang.String value) {
		this.source = value;
	}
	
	public java.lang.String getSplitpath() {
		return this.splitpath;
	}
	
	public void setSplitpath(java.lang.String value) {
		this.splitpath = value;
	}
	
	public java.lang.String getSummary() {
		return this.summary;
	}
	
	public void setSummary(java.lang.String value) {
		this.summary = value;
	}
	
	public java.lang.String getTimeline() {
		return this.timeline;
	}
	
	public void setTimeline(java.lang.String value) {
		this.timeline = value;
	}
	
	public java.lang.String getTitle() {
		return this.title;
	}
	
	public void setTitle(java.lang.String value) {
		this.title = value;
	}
	
	public java.lang.String getUsable() {
		return this.usable;
	}
	
	public void setUsable(java.lang.String value) {
		this.usable = value;
	}
	
	public java.lang.String getXlink() {
		return this.xlink;
	}
	
	public void setXlink(java.lang.String value) {
		this.xlink = value;
	}
	
	public java.lang.String getKeyword() {
		return this.keyword;
	}
	
	public void setKeyword(java.lang.String value) {
		this.keyword = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

