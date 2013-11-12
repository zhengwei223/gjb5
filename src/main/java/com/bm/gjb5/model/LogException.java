package com.bm.gjb5.model;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;

import cn.org.rapid_framework.util.DateConvertUtils;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "LOG_EXCEPTION")
public class LogException extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录系统异常信息";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_EVENT_TIME = "发生时间";
	public static final String ALIAS_OUTLINE = "概要";
	public static final String ALIAS_CALL_STACK = "调用栈";
	public static final String ALIAS_SUBMODULE = "子模块";
	public static final String ALIAS_EXCEPTION_LEVEL = "异常级别";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_EQ_ID = "地震序列";
	
	//date formats
	public static final String FORMAT_EVENT_TIME = DATE_FORMAT;
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * eventTime       db_column: EVENT_TIME 
     */ 	
	
	private java.util.Date eventTime;
    /**
     * outline       db_column: OUTLINE 
     */ 	
	
	private java.lang.String outline;
    /**
     * callStack       db_column: CALL_STACK 
     */ 	
	
	private java.lang.String callStack;
    /**
     * submodule       db_column: SUBMODULE 
     */ 	
	
	private java.lang.String submodule;
    /**
     * exceptionLevel       db_column: EXCEPTION_LEVEL 
     */ 	
	private Integer exceptionLevel;
    /**
     * 1已报告 2未报告 0无需报告       db_column: STATUS 
     */ 	
	private Integer status;
    /**
     * eqId       db_column: EQ_ID 
     */ 	
	
	private java.lang.String eqId;
	//columns END


	public LogException(){
	}

	public LogException(
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
	
	@Transient
	public String getEventTimeString() {
		return DateConvertUtils.format(getEventTime(), FORMAT_EVENT_TIME);
	}
	public void setEventTimeString(String value) {
		setEventTime(DateConvertUtils.parse(value, FORMAT_EVENT_TIME,java.util.Date.class));
	}
	
	@Column(name = "EVENT_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getEventTime() {
		return this.eventTime;
	}
	
	public void setEventTime(java.util.Date value) {
		this.eventTime = value;
	}
	
	@Column(name = "OUTLINE", unique = false, nullable = true, insertable = true, updatable = true, length = 1000)
	public java.lang.String getOutline() {
		return this.outline;
	}
	
	public void setOutline(java.lang.String value) {
		this.outline = value;
	}
	
	@Column(name = "CALL_STACK", unique = false, nullable = true, insertable = true, updatable = true, length = 1000)
	public java.lang.String getCallStack() {
		return this.callStack;
	}
	
	public void setCallStack(java.lang.String value) {
		this.callStack = value;
	}
	
	@Column(name = "SUBMODULE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getSubmodule() {
		return this.submodule;
	}
	
	public void setSubmodule(java.lang.String value) {
		this.submodule = value;
	}
	
	@Column(name = "EXCEPTION_LEVEL", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getExceptionLevel() {
		return this.exceptionLevel;
	}
	
	public void setExceptionLevel(Integer value) {
		this.exceptionLevel = value;
	}
	
	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	@Column(name = "EQ_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getEqId() {
		return this.eqId;
	}
	
	public void setEqId(java.lang.String value) {
		this.eqId = value;
	}
	
	
	private SysEarthquake sysEarthquake;
	public void setSysEarthquake(SysEarthquake sysEarthquake){
		this.sysEarthquake = sysEarthquake;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "EQ_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysEarthquake getSysEarthquake() {
		return sysEarthquake;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("EventTime",getEventTime())
			.append("Outline",getOutline())
			.append("CallStack",getCallStack())
			.append("Submodule",getSubmodule())
			.append("ExceptionLevel",getExceptionLevel())
			.append("Status",getStatus())
			.append("EqId",getEqId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof LogException == false) return false;
		if(this == obj) return true;
		LogException other = (LogException)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

