package com.bm.gjb5.model;

import java.util.HashSet;
import java.util.Set;

import javacommon.base.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "DATA_DISASTER_DETAIL")
public class DataDisasterDetail extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录灾情分类下的明细信息，每条记录对应不同的子分类和不同的谓词，记录受损程度或具体数字，用于最后打标。";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_EXACT_VALUE = "该值可能没有，而是用一个量度来表现一个灾情的明细信息";
	public static final String ALIAS_DESCP = "descp";
	public static final String ALIAS_FILED1 = "filed1";
	public static final String ALIAS_FILED2 = "filed2";
	public static final String ALIAS_FILED3 = "filed3";
	public static final String ALIAS_LABELED = "是否已经标注";
	public static final String ALIAS_ITENTITY_ID = "itentityId";
	public static final String ALIAS_MEASUREMENT_ID = "measurementId";
	
	//date formats
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	private java.lang.String id;
    /**
     * 该值可能没有，而是用一个量度来表现一个灾情的明细信息       db_column: EXACT_VALUE 
     */ 	
	
	private Long exactValue;
    /**
     * descp       db_column: DESCP 
     */ 	
	private java.lang.String descp;
    /**
     * filed1       db_column: FILED1 
     */ 	
	private java.lang.String filed1;
    /**
     * filed2       db_column: FILED2 
     */ 	
	private java.lang.String filed2;
    /**
     * filed3       db_column: FILED3 
     */ 	
	private java.lang.String filed3;
    /**
     * 是否已经标注       db_column: LABELED 
     */ 	
	private java.lang.String labeled;
    /**
     * itentityId       db_column: ITENTITY_ID 
     */ 	
	private java.lang.String itentityId;
    /**
     * measurementId       db_column: MEASUREMENT_ID 
     */ 	
	private java.lang.String measurementId;
	//columns END


	public DataDisasterDetail(){
	}

	public DataDisasterDetail(
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
	
	@Column(name = "EXACT_VALUE", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public Long getExactValue() {
		return this.exactValue;
	}
	
	public void setExactValue(Long value) {
		this.exactValue = value;
	}
	
	@Column(name = "DESCP", unique = false, nullable = true, insertable = true, updatable = true, length = 1000)
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	
	@Column(name = "FILED1", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getFiled1() {
		return this.filed1;
	}
	
	public void setFiled1(java.lang.String value) {
		this.filed1 = value;
	}
	
	@Column(name = "FILED2", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getFiled2() {
		return this.filed2;
	}
	
	public void setFiled2(java.lang.String value) {
		this.filed2 = value;
	}
	
	@Column(name = "FILED3", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getFiled3() {
		return this.filed3;
	}
	
	public void setFiled3(java.lang.String value) {
		this.filed3 = value;
	}
	
	@Column(name = "LABELED", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getLabeled() {
		return this.labeled;
	}
	
	public void setLabeled(java.lang.String value) {
		this.labeled = value;
	}
	
	@Column(name = "ITENTITY_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getItentityId() {
		return this.itentityId;
	}
	
	public void setItentityId(java.lang.String value) {
		this.itentityId = value;
	}
	
	@Column(name = "MEASUREMENT_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getMeasurementId() {
		return this.measurementId;
	}
	
	public void setMeasurementId(java.lang.String value) {
		this.measurementId = value;
	}
	
	
	private Set dataLabelRecords = new HashSet(0);
	public void setDataLabelRecords(Set<DataLabelRecord> dataLabelRecord){
		this.dataLabelRecords = dataLabelRecord;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "dataDisasterDetail")
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
	
	private DataIdentify dataIdentify;
	public void setDataIdentify(DataIdentify dataIdentify){
		this.dataIdentify = dataIdentify;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "ITENTITY_ID",nullable = false, insertable = false, updatable = false) 
	})
	public DataIdentify getDataIdentify() {
		return dataIdentify;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("ExactValue",getExactValue())
			.append("Descp",getDescp())
			.append("Filed1",getFiled1())
			.append("Filed2",getFiled2())
			.append("Filed3",getFiled3())
			.append("Labeled",getLabeled())
			.append("ItentityId",getItentityId())
			.append("MeasurementId",getMeasurementId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DataDisasterDetail == false) return false;
		if(this == obj) return true;
		DataDisasterDetail other = (DataDisasterDetail)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

