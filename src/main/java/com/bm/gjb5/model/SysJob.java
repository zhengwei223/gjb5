package com.bm.gjb5.model;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

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


@Entity
@Table(name = "SYS_JOB")
public class SysJob extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "系统任务";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_IS_INTERNAL = "是否内部";
	public static final String ALIAS_BEGIN_TIME = "开始时间";
	public static final String ALIAS_END_TIME = "截止时间";
	public static final String ALIAS_EXECUTE_METHOD = "ws/ftp";
	public static final String ALIAS_FREQUENCY = "频率";
	public static final String ALIAS_PRIORITY = "优先级";
	public static final String ALIAS_BATCH = "批次";
	public static final String ALIAS_URL = "url";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_SCALE = "量级";
	public static final String ALIAS_ORIGIN_TYPE_ID = "来源类型";
	public static final String ALIAS_EVENT_ID = "事件";
	
	//date formats
	public static final String FORMAT_BEGIN_TIME = DATE_FORMAT;
	public static final String FORMAT_END_TIME = DATE_FORMAT;
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * isInternal       db_column: IS_INTERNAL 
     */ 	
	
	private java.lang.String isInternal;
    /**
     * beginTime       db_column: BEGIN_TIME 
     */ 	
	
	private java.util.Date beginTime;
    /**
     * endTime       db_column: END_TIME 
     */ 	
	
	private java.util.Date endTime;
    /**
     * ws、ftp等       db_column: EXECUTE_METHOD 
     */ 	
	
	private java.lang.String executeMethod;
    /**
     * frequency       db_column: FREQUENCY 
     */ 	
	
	private java.lang.Integer frequency;
    /**
     * priority       db_column: PRIORITY 
     */ 	
	private Integer priority;
    /**
     * batch       db_column: BATCH 
     */ 	
	private Integer batch;
    /**
     * url       db_column: URL 
     */ 	
	
	private java.lang.String url;
    /**
     * status       db_column: STATUS 
     */ 	
	private Integer status;
    /**
     * scale       db_column: SCALE 
     */ 	
	
	private java.lang.Integer scale;
    /**
     * originTypeId       db_column: ORIGIN_TYPE_ID 
     */ 	
	
	private java.lang.String originTypeId;
    /**
     * eventId       db_column: EVENT_ID 
     */ 	
	
	private java.lang.String eventId;
	//columns END


	public SysJob(){
	}

	public SysJob(
		java.lang.String id
	){
		this.id = id;
	}

	

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "uuid")
	@Column(name = "ID", unique = true, nullable = false, insertable = true, updatable = true, length = 32)
	public java.lang.String getId() {
		return this.id;
	}
	
	@Column(name = "IS_INTERNAL", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getIsInternal() {
		return this.isInternal;
	}
	
	public void setIsInternal(java.lang.String value) {
		this.isInternal = value;
	}
	
	@Transient
	public String getBeginTimeString() {
		return DateConvertUtils.format(getBeginTime(), FORMAT_BEGIN_TIME);
	}
	public void setBeginTimeString(String value) {
		setBeginTime(DateConvertUtils.parse(value, FORMAT_BEGIN_TIME,java.util.Date.class));
	}
	
	@Column(name = "BEGIN_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getBeginTime() {
		return this.beginTime;
	}
	
	public void setBeginTime(java.util.Date value) {
		this.beginTime = value;
	}
	
	@Transient
	public String getEndTimeString() {
		return DateConvertUtils.format(getEndTime(), FORMAT_END_TIME);
	}
	public void setEndTimeString(String value) {
		setEndTime(DateConvertUtils.parse(value, FORMAT_END_TIME,java.util.Date.class));
	}
	
	@Column(name = "END_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getEndTime() {
		return this.endTime;
	}
	
	public void setEndTime(java.util.Date value) {
		this.endTime = value;
	}
	
	@Column(name = "EXECUTE_METHOD", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getExecuteMethod() {
		return this.executeMethod;
	}
	
	public void setExecuteMethod(java.lang.String value) {
		this.executeMethod = value;
	}
	
	@Column(name = "FREQUENCY", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	public java.lang.Integer getFrequency() {
		return this.frequency;
	}
	
	public void setFrequency(java.lang.Integer value) {
		this.frequency = value;
	}
	
	@Column(name = "PRIORITY", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getPriority() {
		return this.priority;
	}
	
	public void setPriority(Integer value) {
		this.priority = value;
	}
	
	@Column(name = "BATCH", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getBatch() {
		return this.batch;
	}
	
	public void setBatch(Integer value) {
		this.batch = value;
	}
	
	@Column(name = "URL", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getUrl() {
		return this.url;
	}
	
	public void setUrl(java.lang.String value) {
		this.url = value;
	}
	
	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	@Column(name = "SCALE", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	public java.lang.Integer getScale() {
		return this.scale;
	}
	
	public void setScale(java.lang.Integer value) {
		this.scale = value;
	}
	
	@Column(name = "ORIGIN_TYPE_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getOriginTypeId() {
		return this.originTypeId;
	}
	
	public void setOriginTypeId(java.lang.String value) {
		this.originTypeId = value;
	}
	
	@Column(name = "EVENT_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getEventId() {
		return this.eventId;
	}
	
	public void setEventId(java.lang.String value) {
		this.eventId = value;
	}
	
	
	private Set dataOriginals = new HashSet(0);
	public void setDataOriginals(Set<DataOriginal> dataOriginal){
		this.dataOriginals = dataOriginal;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysJob")
	public Set<DataOriginal> getDataOriginals() {
		return dataOriginals;
	}
	
	private SysEarthquake sysEarthquake;
	public void setSysEarthquake(SysEarthquake sysEarthquake){
		this.sysEarthquake = sysEarthquake;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "EVENT_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysEarthquake getSysEarthquake() {
		return sysEarthquake;
	}
	
	private SysOriginType sysOriginType;
	public void setSysOriginType(SysOriginType sysOriginType){
		this.sysOriginType = sysOriginType;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "ORIGIN_TYPE_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysOriginType getSysOriginType() {
		return sysOriginType;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("IsInternal",getIsInternal())
			.append("BeginTime",getBeginTime())
			.append("EndTime",getEndTime())
			.append("ExecuteMethod",getExecuteMethod())
			.append("Frequency",getFrequency())
			.append("Priority",getPriority())
			.append("Batch",getBatch())
			.append("Url",getUrl())
			.append("Status",getStatus())
			.append("Scale",getScale())
			.append("OriginTypeId",getOriginTypeId())
			.append("EventId",getEventId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysJob == false) return false;
		if(this == obj) return true;
		SysJob other = (SysJob)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

