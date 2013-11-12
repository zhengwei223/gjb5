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
@Table(name = "SYS_EARTHQUAKE")
public class SysEarthquake extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "地震事件";
	public static final String ALIAS_EVENT_ID = "地震序列";
	public static final String ALIAS_EVENT_TIME = "发震时间";
	public static final String ALIAS_LONGITUDE = "经度";
	public static final String ALIAS_LATITUDE = "纬度";
	public static final String ALIAS_FOCAL_DEPTH = "震源深度";
	public static final String ALIAS_MAGNITUDE = "震级";
	public static final String ALIAS_LOCATION = "地名";
	public static final String ALIAS_START_TIME = "启动时间";
	public static final String ALIAS_END_TIME = "结束时间";
	public static final String ALIAS_STATUS = "状态";//0：启动 1：运行 2：停止

	// date formats
	public static final String FORMAT_EVENT_TIME = "yyyy-MM-dd HH:mm:ss";
	public static final String FORMAT_START_TIME = DATE_FORMAT;
	public static final String FORMAT_END_TIME = DATE_FORMAT;

	// 可以直接使用: 显示错误消息
	// columns START
	/**
	 * eventId db_column: EVENT_ID
	 */

	private java.lang.String eventId;
	/**
	 * eventTime db_column: EVENT_TIME
	 */

	private java.util.Date eventTime;
	/**
	 * longitude db_column: LONGITUDE
	 */

	private java.lang.String longitude;
	/**
	 * latitude db_column: LATITUDE
	 */

	private java.lang.String latitude;
	/**
	 * focalDepth db_column: FOCAL_DEPTH
	 */

	private String focalDepth;
	/**
	 * magnitude db_column: MAGNITUDE
	 */

	private String magnitude;
	/**
	 * location db_column: LOCATION
	 */

	private java.lang.String location;
	/**
	 * startTime db_column: START_TIME
	 */

	private java.util.Date startTime;
	/**
	 * endTime db_column: END_TIME
	 */

	private java.util.Date endTime;
	/**
	 * 0：启动 1：运行 2：停止 db_column: STATUS
	 */
	private Integer status;

	// columns END

	public SysEarthquake() {
	}

	public SysEarthquake(java.lang.String eventId) {
		this.eventId = eventId;
	}

	public SysEarthquake(String eventId, Date eventTime, String longitude,
			String latitude, String focalDepth, String magnitude, String location,
			Date startTime, Integer status) {
		super();
		this.eventId = eventId;
		this.eventTime = eventTime;
		this.longitude = longitude;
		this.latitude = latitude;
		this.focalDepth = focalDepth;
		this.magnitude = magnitude;
		this.location = location;
		this.startTime = startTime;
		this.status = status;
	}

	public void setEventId(java.lang.String value) {
		this.eventId = value;
	}

	@Id
	@GeneratedValue(generator = "custom-id")
	@GenericGenerator(name = "custom-id", strategy = "assigned")
	@Column(name = "EVENT_ID", unique = true, nullable = false, insertable = true, updatable = true, length = 100)
	public java.lang.String getEventId() {
		return this.eventId;
	}

	@Transient
	public String getEventTimeString() {
		return DateConvertUtils.format(getEventTime(), FORMAT_EVENT_TIME);
	}

	public void setEventTimeString(String value) {
		setEventTime(DateConvertUtils.parse(value, FORMAT_EVENT_TIME,
				java.util.Date.class));
	}

	@Column(name = "EVENT_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getEventTime() {
		return this.eventTime;
	}

	public void setEventTime(java.util.Date value) {
		this.eventTime = value;
	}

	@Column(name = "LONGITUDE", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.String getLongitude() {
		return this.longitude;
	}

	public void setLongitude(java.lang.String value) {
		this.longitude = value;
	}

	@Column(name = "LATITUDE", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.String getLatitude() {
		return this.latitude;
	}

	public void setLatitude(java.lang.String value) {
		this.latitude = value;
	}

	@Column(name = "FOCAL_DEPTH", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public String getFocalDepth() {
		return this.focalDepth;
	}

	public void setFocalDepth(String value) {
		this.focalDepth = value;
	}

	@Column(name = "MAGNITUDE", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	public String getMagnitude() {
		return this.magnitude;
	}

	public void setMagnitude(String value) {
		this.magnitude = value;
	}

	@Column(name = "LOCATION", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getLocation() {
		return this.location;
	}

	public void setLocation(java.lang.String value) {
		this.location = value;
	}

	@Transient
	public String getStartTimeString() {
		return DateConvertUtils.format(getStartTime(), FORMAT_START_TIME);
	}

	public void setStartTimeString(String value) {
		setStartTime(DateConvertUtils.parse(value, FORMAT_START_TIME,
				java.util.Date.class));
	}

	@Column(name = "START_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(java.util.Date value) {
		this.startTime = value;
	}

	@Transient
	public String getEndTimeString() {
		return DateConvertUtils.format(getEndTime(), FORMAT_END_TIME);
	}

	public void setEndTimeString(String value) {
		setEndTime(DateConvertUtils.parse(value, FORMAT_END_TIME,
				java.util.Date.class));
	}

	@Column(name = "END_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(java.util.Date value) {
		this.endTime = value;
	}

	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer value) {
		this.status = value;
	}

	private Set logExceptions = new HashSet(0);

	public void setLogExceptions(Set<LogException> logException) {
		this.logExceptions = logException;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysEarthquake")
	public Set<LogException> getLogExceptions() {
		return logExceptions;
	}

	private Set logCooperates = new HashSet(0);

	public void setLogCooperates(Set<LogCooperate> logCooperate) {
		this.logCooperates = logCooperate;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysEarthquake")
	public Set<LogCooperate> getLogCooperates() {
		return logCooperates;
	}

	private Set sysJobs = new HashSet(0);

	public void setSysJobs(Set<SysJob> sysJob) {
		this.sysJobs = sysJob;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysEarthquake")
	public Set<SysJob> getSysJobs() {
		return sysJobs;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("EventId", getEventId())
				.append("EventTime", getEventTime())
				.append("Longitude", getLongitude())
				.append("Latitude", getLatitude())
				.append("FocalDepth", getFocalDepth())
				.append("Magnitude", getMagnitude())
				.append("Location", getLocation())
				.append("StartTime", getStartTime())
				.append("EndTime", getEndTime()).append("Status", getStatus())
				.toString();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(getEventId()).toHashCode();
	}

	public boolean equals(Object obj) {
		if (obj instanceof SysEarthquake == false)
			return false;
		if (this == obj)
			return true;
		SysEarthquake other = (SysEarthquake) obj;
		return new EqualsBuilder().append(getEventId(), other.getEventId())
				.isEquals();
	}
}
