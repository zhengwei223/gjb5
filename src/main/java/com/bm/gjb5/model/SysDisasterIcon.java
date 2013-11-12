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
@Table(name = "SYS_DISASTER_ICON")
public class SysDisasterIcon extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录某灾情分类下受损程度、具体数值对应的图标信息";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_DISASTER_LEVEL = "灾害等级,直接对应图标";
	public static final String ALIAS_ICON_NAME = "iconName";
	public static final String ALIAS_ICON_URL = "iconUrl";
	public static final String ALIAS_UPDATE_TIME = "updateTime";
	public static final String ALIAS_CREATE_TIME = "createTime";
	public static final String ALIAS_OPUSER = "opuser";
	public static final String ALIAS_UNIT = "单位,如人/千人/平方米/平方公里/间等计量单位";
	public static final String ALIAS_MEASUREMENT_ID = "measurementId";
	public static final String ALIAS_RIG_ID = "rigId";
	
	//date formats
	public static final String FORMAT_UPDATE_TIME = DATE_FORMAT;
	public static final String FORMAT_CREATE_TIME = DATE_FORMAT;
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * 灾害等级,直接对应图标       db_column: DISASTER_LEVEL 
     */ 	
	private Integer disasterLevel;
    /**
     * iconName       db_column: ICON_NAME 
     */ 	
	
	private java.lang.String iconName;
    /**
     * iconUrl       db_column: ICON_URL 
     */ 	
	
	private java.lang.String iconUrl;
    /**
     * updateTime       db_column: UPDATE_TIME 
     */ 	
	
	private java.util.Date updateTime;
    /**
     * createTime       db_column: CREATE_TIME 
     */ 	
	
	private java.util.Date createTime;
    /**
     * opuser       db_column: OPUSER 
     */ 	
	
	private java.lang.String opuser;
    /**
     * 单位,如人/千人/平方米/平方公里/间等计量单位       db_column: UNIT 
     */ 	
	
	private java.lang.String unit;
    /**
     * measurementId       db_column: MEASUREMENT_ID 
     */ 	
	
	private java.lang.String measurementId;
    /**
     * rigId       db_column: RIG_ID 
     */ 	
	
	private java.lang.String rigId;
	//columns END


	public SysDisasterIcon(){
	}

	public SysDisasterIcon(
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
	
	@Column(name = "DISASTER_LEVEL", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getDisasterLevel() {
		return this.disasterLevel;
	}
	
	public void setDisasterLevel(Integer value) {
		this.disasterLevel = value;
	}
	
	@Column(name = "ICON_NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getIconName() {
		return this.iconName;
	}
	
	public void setIconName(java.lang.String value) {
		this.iconName = value;
	}
	
	@Column(name = "ICON_URL", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getIconUrl() {
		return this.iconUrl;
	}
	
	public void setIconUrl(java.lang.String value) {
		this.iconUrl = value;
	}
	
	@Transient
	public String getUpdateTimeString() {
		return DateConvertUtils.format(getUpdateTime(), FORMAT_UPDATE_TIME);
	}
	public void setUpdateTimeString(String value) {
		setUpdateTime(DateConvertUtils.parse(value, FORMAT_UPDATE_TIME,java.util.Date.class));
	}
	
	@Column(name = "UPDATE_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getUpdateTime() {
		return this.updateTime;
	}
	
	public void setUpdateTime(java.util.Date value) {
		this.updateTime = value;
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
	
	@Column(name = "OPUSER", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getOpuser() {
		return this.opuser;
	}
	
	public void setOpuser(java.lang.String value) {
		this.opuser = value;
	}
	
	@Column(name = "UNIT", unique = false, nullable = true, insertable = true, updatable = true, length = 5)
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	@Column(name = "MEASUREMENT_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getMeasurementId() {
		return this.measurementId;
	}
	
	public void setMeasurementId(java.lang.String value) {
		this.measurementId = value;
	}
	
	@Column(name = "RIG_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getRigId() {
		return this.rigId;
	}
	
	public void setRigId(java.lang.String value) {
		this.rigId = value;
	}
	
	
	private Set dataLabelRecords = new HashSet(0);
	public void setDataLabelRecords(Set<DataLabelRecord> dataLabelRecord){
		this.dataLabelRecords = dataLabelRecord;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysDisasterIcon")
	public Set<DataLabelRecord> getDataLabelRecords() {
		return dataLabelRecords;
	}
	
	private SysDisasterMeasurement sysDisasterMeasurement;
	public void setSysDisasterMeasurement(SysDisasterMeasurement sysDisasterMeasurement){
		this.sysDisasterMeasurement = sysDisasterMeasurement;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "MEASUREMENT_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysDisasterMeasurement getSysDisasterMeasurement() {
		return sysDisasterMeasurement;
	}
	
	private RightsUser rightsUser;
	public void setRightsUser(RightsUser rightsUser){
		this.rightsUser = rightsUser;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "RIG_ID",nullable = false, insertable = false, updatable = false) 
	})
	public RightsUser getRightsUser() {
		return rightsUser;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("DisasterLevel",getDisasterLevel())
			.append("IconName",getIconName())
			.append("IconUrl",getIconUrl())
			.append("UpdateTime",getUpdateTime())
			.append("CreateTime",getCreateTime())
			.append("Opuser",getOpuser())
			.append("Unit",getUnit())
			.append("MeasurementId",getMeasurementId())
			.append("RigId",getRigId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysDisasterIcon == false) return false;
		if(this == obj) return true;
		SysDisasterIcon other = (SysDisasterIcon)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

