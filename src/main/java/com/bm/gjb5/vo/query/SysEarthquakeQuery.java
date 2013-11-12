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


public class SysEarthquakeQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** eventId */
	private java.lang.String eventId;
	/** eventTime */
	private java.util.Date eventTimeBegin;
	private java.util.Date eventTimeEnd;
	/** longitude */
	private java.lang.String longitude;
	/** latitude */
	private java.lang.String latitude;
	/** focalDepth */
	private Long focalDepth;
	/** magnitude */
	private Long magnitude;
	/** location */
	private java.lang.String location;
	/** startTime */
	private java.util.Date startTimeBegin;
	private java.util.Date startTimeEnd;
	/** endTime */
	private java.util.Date endTimeBegin;
	private java.util.Date endTimeEnd;
	/** 0：启动 1：运行 2：停止 */
	private Integer status;

	public java.lang.String getEventId() {
		return this.eventId;
	}
	
	public void setEventId(java.lang.String value) {
		this.eventId = value;
	}
	
	public java.util.Date getEventTimeBegin() {
		return this.eventTimeBegin;
	}
	
	public void setEventTimeBegin(java.util.Date value) {
		this.eventTimeBegin = value;
	}	
	
	public java.util.Date getEventTimeEnd() {
		return this.eventTimeEnd;
	}
	
	public void setEventTimeEnd(java.util.Date value) {
		this.eventTimeEnd = value;
	}
	
	public java.lang.String getLongitude() {
		return this.longitude;
	}
	
	public void setLongitude(java.lang.String value) {
		this.longitude = value;
	}
	
	public java.lang.String getLatitude() {
		return this.latitude;
	}
	
	public void setLatitude(java.lang.String value) {
		this.latitude = value;
	}
	
	public Long getFocalDepth() {
		return this.focalDepth;
	}
	
	public void setFocalDepth(Long value) {
		this.focalDepth = value;
	}
	
	public Long getMagnitude() {
		return this.magnitude;
	}
	
	public void setMagnitude(Long value) {
		this.magnitude = value;
	}
	
	public java.lang.String getLocation() {
		return this.location;
	}
	
	public void setLocation(java.lang.String value) {
		this.location = value;
	}
	
	public java.util.Date getStartTimeBegin() {
		return this.startTimeBegin;
	}
	
	public void setStartTimeBegin(java.util.Date value) {
		this.startTimeBegin = value;
	}	
	
	public java.util.Date getStartTimeEnd() {
		return this.startTimeEnd;
	}
	
	public void setStartTimeEnd(java.util.Date value) {
		this.startTimeEnd = value;
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
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

