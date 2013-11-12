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
@Table(name = "SYS_DISASTER_MEASUREMENT")
public class SysDisasterMeasurement extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "计量,一个谓词下多多个度量级别,如100人以内,100-1000人,又如房屋(一级分类)--学校(二级分类)--倒塌(谓词)--1000-2000平方(计量)；可以是一个范围，也可以是具体的数值。";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_PREDICATE_ID = "predicateId";
	public static final String ALIAS_MEASURE = "可以是一个范围，也可以是精确值";
	public static final String ALIAS_UNIT = "unit";
	
	//date formats
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * predicateId       db_column: PREDICATE_ID 
     */ 	
	
	private java.lang.String predicateId;
    /**
     * 可以是一个范围，也可以是精确值       db_column: MEASURE 
     */ 	
	
	private java.lang.String measure;
    /**
     * unit       db_column: UNIT 
     */ 	
	
	private java.lang.String unit;
	//columns END


	public SysDisasterMeasurement(){
	}

	public SysDisasterMeasurement(
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
	
	@Column(name = "PREDICATE_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getPredicateId() {
		return this.predicateId;
	}
	
	public void setPredicateId(java.lang.String value) {
		this.predicateId = value;
	}
	
	@Column(name = "MEASURE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getMeasure() {
		return this.measure;
	}
	
	public void setMeasure(java.lang.String value) {
		this.measure = value;
	}
	
	@Column(name = "UNIT", unique = false, nullable = true, insertable = true, updatable = true, length = 5)
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	
	private Set dataDisasterDetails = new HashSet(0);
	public void setDataDisasterDetails(Set<DataDisasterDetail> dataDisasterDetail){
		this.dataDisasterDetails = dataDisasterDetail;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysDisasterMeasurement")
	public Set<DataDisasterDetail> getDataDisasterDetails() {
		return dataDisasterDetails;
	}
	
	private Set sysDisasterIcons = new HashSet(0);
	public void setSysDisasterIcons(Set<SysDisasterIcon> sysDisasterIcon){
		this.sysDisasterIcons = sysDisasterIcon;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysDisasterMeasurement")
	public Set<SysDisasterIcon> getSysDisasterIcons() {
		return sysDisasterIcons;
	}
	
	private SysDisasterPredicate sysDisasterPredicate;
	public void setSysDisasterPredicate(SysDisasterPredicate sysDisasterPredicate){
		this.sysDisasterPredicate = sysDisasterPredicate;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "PREDICATE_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysDisasterPredicate getSysDisasterPredicate() {
		return sysDisasterPredicate;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("PredicateId",getPredicateId())
			.append("Measure",getMeasure())
			.append("Unit",getUnit())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysDisasterMeasurement == false) return false;
		if(this == obj) return true;
		SysDisasterMeasurement other = (SysDisasterMeasurement)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

