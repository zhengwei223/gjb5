package com.bm.gjb5.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

import java.util.*;

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

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


public class DataOriginalQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** form */
	private java.lang.String form;
	/** remoteUrl */
	private java.lang.String remoteUrl;
	/** noticeTime */
	private java.util.Date noticeTimeBegin;
	private java.util.Date noticeTimeEnd;
	/** collTime */
	private java.util.Date collTimeBegin;
	private java.util.Date collTimeEnd;
	/** localeUrl */
	private java.lang.String localeUrl;
	/** 本地格式化后路径(如果格式不对,我们要转码) */
	private java.lang.String localeFmtUrl;
	/** filename */
	private java.lang.String filename;
	/** fmtFname */
	private java.lang.String fmtFname;
	/** fileSize */
	private Long fileSize;
	/** status */
	private Integer status;
	/** batch */
	private Integer batch;
	/** jobId */
	private java.lang.String jobId;
	private String eventId;
	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getForm() {
		return this.form;
	}
	
	public void setForm(java.lang.String value) {
		this.form = value;
	}
	
	public java.lang.String getRemoteUrl() {
		return this.remoteUrl;
	}
	
	public void setRemoteUrl(java.lang.String value) {
		this.remoteUrl = value;
	}
	
	public java.util.Date getNoticeTimeBegin() {
		return this.noticeTimeBegin;
	}
	
	public void setNoticeTimeBegin(java.util.Date value) {
		this.noticeTimeBegin = value;
	}	
	
	public java.util.Date getNoticeTimeEnd() {
		return this.noticeTimeEnd;
	}
	
	public void setNoticeTimeEnd(java.util.Date value) {
		this.noticeTimeEnd = value;
	}
	
	public java.util.Date getCollTimeBegin() {
		return this.collTimeBegin;
	}
	
	public void setCollTimeBegin(java.util.Date value) {
		this.collTimeBegin = value;
	}	
	
	public java.util.Date getCollTimeEnd() {
		return this.collTimeEnd;
	}
	
	public void setCollTimeEnd(java.util.Date value) {
		this.collTimeEnd = value;
	}
	
	public java.lang.String getLocaleUrl() {
		return this.localeUrl;
	}
	
	public void setLocaleUrl(java.lang.String value) {
		this.localeUrl = value;
	}
	
	public java.lang.String getLocaleFmtUrl() {
		return this.localeFmtUrl;
	}
	
	public void setLocaleFmtUrl(java.lang.String value) {
		this.localeFmtUrl = value;
	}
	
	public java.lang.String getFilename() {
		return this.filename;
	}
	
	public void setFilename(java.lang.String value) {
		this.filename = value;
	}
	
	public java.lang.String getFmtFname() {
		return this.fmtFname;
	}
	
	public void setFmtFname(java.lang.String value) {
		this.fmtFname = value;
	}
	
	public Long getFileSize() {
		return this.fileSize;
	}
	
	public void setFileSize(Long value) {
		this.fileSize = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public Integer getBatch() {
		return this.batch;
	}
	
	public void setBatch(Integer value) {
		this.batch = value;
	}
	
	public java.lang.String getJobId() {
		return this.jobId;
	}
	
	public void setJobId(java.lang.String value) {
		this.jobId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	
}

