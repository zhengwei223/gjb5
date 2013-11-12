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
@Table(name = "SYS_DISASTER_PREDICATE")
public class SysDisasterPredicate extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "灾情谓词,如死亡/受伤/压埋/失踪,有如倒塌/轻微受损，都是谓词。 一个分类下有多个谓词。";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "名称";//如死亡/受伤/压埋/失踪
	public static final String ALIAS_DESCP = "描述";
	public static final String ALIAS_CLASSIFY_ID = "所属分类";
	
	//date formats
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * name       db_column: NAME 
     */ 	
	
	private java.lang.String name;
    /**
     * descp       db_column: DESCP 
     */ 	
	
	private java.lang.String descp;
    /**
     * classifyId       db_column: CLASSIFY_ID 
     */ 	
	
	private java.lang.String classifyId;
	//columns END


	public SysDisasterPredicate(){
	}

	public SysDisasterPredicate(
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
	
	@Column(name = "NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "DESCP", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	
	@Column(name = "CLASSIFY_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getClassifyId() {
		return this.classifyId;
	}
	
	public void setClassifyId(java.lang.String value) {
		this.classifyId = value;
	}
	
	
	private Set sysDisasterMeasurements = new HashSet(0);
	public void setSysDisasterMeasurements(Set<SysDisasterMeasurement> sysDisasterMeasurement){
		this.sysDisasterMeasurements = sysDisasterMeasurement;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysDisasterPredicate")
	public Set<SysDisasterMeasurement> getSysDisasterMeasurements() {
		return sysDisasterMeasurements;
	}
	
	private SysDisasterClassify sysDisasterClassify;
	public void setSysDisasterClassify(SysDisasterClassify sysDisasterClassify){
		this.sysDisasterClassify = sysDisasterClassify;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "CLASSIFY_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysDisasterClassify getSysDisasterClassify() {
		return sysDisasterClassify;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("Descp",getDescp())
			.append("ClassifyId",getClassifyId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysDisasterPredicate == false) return false;
		if(this == obj) return true;
		SysDisasterPredicate other = (SysDisasterPredicate)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

