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
@Table(name = "SYS_DISASTER_CLASSIFY")
public class SysDisasterClassify extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录灾情分类，如人员伤亡、房屋情况、此生灾害情况是一级分类；可添加二级分类";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "分类名称";//如人员情况,建筑情况,也可以是二级分类
	public static final String ALIAS_DESCP = "描述";
	public static final String ALIAS_PID = "父级分类";
	
	//date formats
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * --分类名称,如人员情况,建筑情况,也可以是二级分类       db_column: NAME 
     */ 	
	
	private java.lang.String name;
    /**
     * descp       db_column: DESCP 
     */ 	
	
	private java.lang.String descp;
    /**
     * pid       db_column: P_ID 
     */ 	
	
	private java.lang.String pid;
	//columns END


	public SysDisasterClassify(){
	}

	public SysDisasterClassify(
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
	
	@Column(name = "P_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getPid() {
		return this.pid;
	}
	
	public void setPid(java.lang.String value) {
		this.pid = value;
	}
	
	
	private Set sysDisasterPredicates = new HashSet(0);
	public void setSysDisasterPredicates(Set<SysDisasterPredicate> sysDisasterPredicate){
		this.sysDisasterPredicates = sysDisasterPredicate;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysDisasterClassify")
	public Set<SysDisasterPredicate> getSysDisasterPredicates() {
		return sysDisasterPredicates;
	}
	
	private Set sysDisasterClassifys = new HashSet(0);
	public void setSysDisasterClassifys(Set<SysDisasterClassify> sysDisasterClassify){
		this.sysDisasterClassifys = sysDisasterClassify;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysDisasterClassify")
	public Set<SysDisasterClassify> getSysDisasterClassifys() {
		return sysDisasterClassifys;
	}
	
	private SysDisasterClassify sysDisasterClassify;
	public void setSysDisasterClassify(SysDisasterClassify sysDisasterClassify){
		this.sysDisasterClassify = sysDisasterClassify;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "P_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysDisasterClassify getSysDisasterClassify() {
		return sysDisasterClassify;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("Descp",getDescp())
			.append("Pid",getPid())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysDisasterClassify == false) return false;
		if(this == obj) return true;
		SysDisasterClassify other = (SysDisasterClassify)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

