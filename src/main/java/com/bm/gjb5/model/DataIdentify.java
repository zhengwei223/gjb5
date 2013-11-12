package com.bm.gjb5.model;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.util.*;

import javacommon.base.*;

import cn.org.rapid_framework.util.*;


/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "DATA_IDENTIFY")
/**
 * 记录识别后的灾情信息概要及文本内容，对应多条具体的灾情明细
 * @author zhengwei lastmodified 2013年10月9日
 *
 */
public class DataIdentify extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录识别后的灾情信息概要及文本内容，对应多条具体的灾情明细";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_CREATE_TIME = "创建时间";
	public static final String ALIAS_EVENT_TIME = "时间";
	public static final String ALIAS_LOCATION = "地点";
	public static final String ALIAS_LONGITUDE = "经度";
	public static final String ALIAS_LATITUDE = "纬度";
	public static final String ALIAS_TXT_INFO1 = "文本信息";
	public static final String ALIAS_TXT_INFO2 = "文本信息";
	public static final String ALIAS_SEMANTICS = "语义";
	public static final String ALIAS_MAGNITUDE = "震级";
	public static final String ALIAS_SEISESTHESIA = "震感";
	public static final String ALIAS_REPORT_MAN = "报告人";
	public static final String ALIAS_REPORT_TIME = "报告时间";
	public static final String ALIAS_MANUAL = "是否辅助识别";
	public static final String ALIAS_ORIGINAL_ID = "原始数据";
	
	//date formats
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	public static final String FORMAT_EVENT_TIME = DATE_FORMAT;
	public static final String FORMAT_REPORT_TIME = DATE_FORMAT;
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	private java.lang.String id;
    /**
     * createTime       db_column: CREATE_TIME 
     */ 	
	
	private java.util.Date createTime;
    /**
     * eventTime       db_column: EVENT_TIME 
     */ 	
	
	private java.util.Date eventTime;
    /**
     * location       db_column: LOCATION 
     */ 	
	private java.lang.String location;
    /**
     * longitude       db_column: LONGITUDE 
     */ 	
	private java.lang.String longitude;
    /**
     * latitude       db_column: LATITUDE 
     */ 	
	private java.lang.String latitude;
    /**
     * txtInfo1       db_column: TXT_INFO1 
     */ 	
	private java.lang.String txtInfo1;
    /**
     * txtInfo2       db_column: TXT_INFO2 
     */ 	
	private java.lang.String txtInfo2;
    /**
     * 语义       db_column: SEMANTICS 
     */ 	
	private java.lang.String semantics;
    /**
     * 震感       db_column: MAGNITUDE 
     */ 	
	
	private Long magnitude;
    /**
     * seisesthesia       db_column: SEISESTHESIA 
     */ 	
	private Integer seisesthesia;
    /**
     * reportMan       db_column: REPORT_MAN 
     */ 	
	private java.lang.String reportMan;
    /**
     * reportTime       db_column: REPORT_TIME 
     */ 	
	
	private java.util.Date reportTime;
    /**
     * manual       db_column: MANUAL 
     */ 	
	private java.lang.String manual;
    /**
     * originalId       db_column: ORIGINAL_ID 
     */ 	
	private java.lang.String originalId;
	//columns END


	public DataIdentify(){
	}

	public DataIdentify(
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
	public String getCreateTimeString() {
		return DateConvertUtils.format(getCreateTime(), FORMAT_CREATE_TIME);
	}
	public void setCreateTimeString(String value) {
		setCreateTime(DateConvertUtils.parse(value, FORMAT_CREATE_TIME,java.util.Date.class));
	}
	
	@Column(name = "CREATE_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
	public void setCreateTime(java.util.Date value) {
		this.createTime = value;
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
	
	@Column(name = "LOCATION", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getLocation() {
		return this.location;
	}
	
	public void setLocation(java.lang.String value) {
		this.location = value;
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
	
	@Column(name = "TXT_INFO1", unique = false, nullable = true, insertable = true, updatable = true, length = 4000)
	public java.lang.String getTxtInfo1() {
		return this.txtInfo1;
	}
	
	public void setTxtInfo1(java.lang.String value) {
		this.txtInfo1 = value;
	}
	
	@Column(name = "TXT_INFO2", unique = false, nullable = true, insertable = true, updatable = true, length = 2000)
	public java.lang.String getTxtInfo2() {
		return this.txtInfo2;
	}
	
	public void setTxtInfo2(java.lang.String value) {
		this.txtInfo2 = value;
	}
	
	@Column(name = "SEMANTICS", unique = false, nullable = true, insertable = true, updatable = true, length = 2000)
	public java.lang.String getSemantics() {
		return this.semantics;
	}
	
	public void setSemantics(java.lang.String value) {
		this.semantics = value;
	}
	
	@Column(name = "MAGNITUDE", unique = false, nullable = true, insertable = true, updatable = true, length = 8)
	public Long getMagnitude() {
		return this.magnitude;
	}
	
	public void setMagnitude(Long value) {
		this.magnitude = value;
	}
	
	@Column(name = "SEISESTHESIA", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getSeisesthesia() {
		return this.seisesthesia;
	}
	
	public void setSeisesthesia(Integer value) {
		this.seisesthesia = value;
	}
	
	@Column(name = "REPORT_MAN", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.String getReportMan() {
		return this.reportMan;
	}
	
	public void setReportMan(java.lang.String value) {
		this.reportMan = value;
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
	
	@Column(name = "MANUAL", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getManual() {
		return this.manual;
	}
	
	public void setManual(java.lang.String value) {
		this.manual = value;
	}
	
	@Column(name = "ORIGINAL_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getOriginalId() {
		return this.originalId;
	}
	
	public void setOriginalId(java.lang.String value) {
		this.originalId = value;
	}
	
	
	private Set dataDisasterDetails = new HashSet(0);
	public void setDataDisasterDetails(Set<DataDisasterDetail> dataDisasterDetail){
		this.dataDisasterDetails = dataDisasterDetail;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "dataIdentify")
	public Set<DataDisasterDetail> getDataDisasterDetails() {
		return dataDisasterDetails;
	}
	
	private DataOriginal dataOriginal;
	public void setDataOriginal(DataOriginal dataOriginal){
		this.dataOriginal = dataOriginal;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "ORIGINAL_ID",nullable = false, insertable = false, updatable = false) 
	})
	public DataOriginal getDataOriginal() {
		return dataOriginal;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("CreateTime",getCreateTime())
			.append("EventTime",getEventTime())
			.append("Location",getLocation())
			.append("Longitude",getLongitude())
			.append("Latitude",getLatitude())
			.append("TxtInfo1",getTxtInfo1())
			.append("TxtInfo2",getTxtInfo2())
			.append("Semantics",getSemantics())
			.append("Magnitude",getMagnitude())
			.append("Seisesthesia",getSeisesthesia())
			.append("ReportMan",getReportMan())
			.append("ReportTime",getReportTime())
			.append("Manual",getManual())
			.append("OriginalId",getOriginalId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DataIdentify == false) return false;
		if(this == obj) return true;
		DataIdentify other = (DataIdentify)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

