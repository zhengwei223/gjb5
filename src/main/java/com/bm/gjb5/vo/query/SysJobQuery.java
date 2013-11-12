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


public class SysJobQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** isInternal */
	private java.lang.String isInternal;
	/** beginTime */
	private java.util.Date beginTimeBegin;
	private java.util.Date beginTimeEnd;
	/** endTime */
	private java.util.Date endTimeBegin;
	private java.util.Date endTimeEnd;
	/** ws、ftp等 */
	private java.lang.String executeMethod;
	/** frequency */
	private java.lang.Integer frequency;
	/** priority */
	private Integer priority;
	/** batch */
	private Integer batch;
	/** url */
	private java.lang.String url;
	/** status */
	private Integer status;
	/** scale */
	private java.lang.Integer scale;
	/** originTypeId */
	private java.lang.String originTypeId;
	/** eventId */
	private java.lang.String eventId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getIsInternal() {
		return this.isInternal;
	}
	
	public void setIsInternal(java.lang.String value) {
		this.isInternal = value;
	}
	
	public java.util.Date getBeginTimeBegin() {
		return this.beginTimeBegin;
	}
	
	public void setBeginTimeBegin(java.util.Date value) {
		this.beginTimeBegin = value;
	}	
	
	public java.util.Date getBeginTimeEnd() {
		return this.beginTimeEnd;
	}
	
	public void setBeginTimeEnd(java.util.Date value) {
		this.beginTimeEnd = value;
	}
	
	public java.util.Date getEndTimeBegin() {
		return this.endTimeBegin;
	}
	
	public void setEndTimeBegin(java.util.Date value) {
		this.endTimeBegin = value;
	}	
	
	public java.util.Date getEndTimeEnd() {
		return this.endTimeEnd;
	}
	
	public void setEndTimeEnd(java.util.Date value) {
		this.endTimeEnd = value;
	}
	
	public java.lang.String getExecuteMethod() {
		return this.executeMethod;
	}
	
	public void setExecuteMethod(java.lang.String value) {
		this.executeMethod = value;
	}
	
	public java.lang.Integer getFrequency() {
		return this.frequency;
	}
	
	public void setFrequency(java.lang.Integer value) {
		this.frequency = value;
	}
	
	public Integer getPriority() {
		return this.priority;
	}
	
	public void setPriority(Integer value) {
		this.priority = value;
	}
	
	public Integer getBatch() {
		return this.batch;
	}
	
	public void setBatch(Integer value) {
		this.batch = value;
	}
	
	public java.lang.String getUrl() {
		return this.url;
	}
	
	public void setUrl(java.lang.String value) {
		this.url = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public java.lang.Integer getScale() {
		return this.scale;
	}
	
	public void setScale(java.lang.Integer value) {
		this.scale = value;
	}
	
	public java.lang.String getOriginTypeId() {
		return this.originTypeId;
	}
	
	public void setOriginTypeId(java.lang.String value) {
		this.originTypeId = value;
	}
	
	public java.lang.String getEventId() {
		return this.eventId;
	}
	
	public void setEventId(java.lang.String value) {
		this.eventId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

