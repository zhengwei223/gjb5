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
@Table(name = "LOG_COOPERATE")
public class LogCooperate extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录与中心协作日志信息";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_REPORT_TIME = "reportTime";
	public static final String ALIAS_LOG_TITLE = "logTitle";
	public static final String ALIAS_LOG_MESSAGE = "logMessage";
	public static final String ALIAS_STATUS = "status";
	public static final String ALIAS_EQ_ID = "eqId";
	
	//date formats
	public static final String FORMAT_REPORT_TIME = DATE_FORMAT;
	

	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * reportTime       db_column: REPORT_TIME 
     */ 	
	
	private java.util.Date reportTime;
    /**
     * logTitle       db_column: LOG_TITLE 
     */ 	
	
	private java.lang.String logTitle;
    /**
     * logMessage       db_column: LOG_MESSAGE 
     */ 	
	
	private java.lang.String logMessage;
    /**
     * status       db_column: STATUS 
     */ 	
	private Integer status;
    /**
     * eqId       db_column: EQ_ID 
     */ 	
	
	private java.lang.String eqId;
	//columns END


	public LogCooperate(){
	}

	public LogCooperate(
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
	public String getReportTimeString() {
		return DateConvertUtils.format(getReportTime(), FORMAT_REPORT_TIME);
	}
	public void setReportTimeString(String value) {
		setReportTime(DateConvertUtils.parse(value, FORMAT_REPORT_TIME,java.util.Date.class));
	}
	
	@Column(name = "REPORT_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getReportTime() {
		return this.reportTime;
	}
	
	public void setReportTime(java.util.Date value) {
		this.reportTime = value;
	}
	
	@Column(name = "LOG_TITLE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getLogTitle() {
		return this.logTitle;
	}
	
	public void setLogTitle(java.lang.String value) {
		this.logTitle = value;
	}
	
	@Column(name = "LOG_MESSAGE", unique = false, nullable = true, insertable = true, updatable = true, length = 1000)
	public java.lang.String getLogMessage() {
		return this.logMessage;
	}
	
	public void setLogMessage(java.lang.String value) {
		this.logMessage = value;
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
			.append("ReportTime",getReportTime())
			.append("LogTitle",getLogTitle())
			.append("LogMessage",getLogMessage())
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
		if(obj instanceof LogCooperate == false) return false;
		if(this == obj) return true;
		LogCooperate other = (LogCooperate)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

