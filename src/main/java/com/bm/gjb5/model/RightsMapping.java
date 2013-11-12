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
@Table(name = "RIGHTS_MAPPING")
public class RightsMapping extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录角色与资源的映射";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_OP_DATE = "opDate";
	public static final String ALIAS_OP_USER = "opUser";
	public static final String ALIAS_RESOURCE_ID = "resourceId";
	public static final String ALIAS_ROLE_ID = "roleId";
	
	//date formats
	public static final String FORMAT_OP_DATE = DATE_FORMAT;
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * opDate       db_column: OP_DATE 
     */ 	
	
	private java.util.Date opDate;
    /**
     * opUser       db_column: OP_USER 
     */ 	
	
	private java.lang.String opUser;
    /**
     * resourceId       db_column: RESOURCE_ID 
     */ 	
	private int resourceId;
    /**
     * roleId       db_column: ROLE_ID 
     */ 	
	
	private java.lang.String roleId;
	//columns END


	public RightsMapping(){
	}

	public RightsMapping(
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
	public String getOpDateString() {
		return DateConvertUtils.format(getOpDate(), FORMAT_OP_DATE);
	}
	public void setOpDateString(String value) {
		setOpDate(DateConvertUtils.parse(value, FORMAT_OP_DATE,java.util.Date.class));
	}
	
	@Column(name = "OP_DATE", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getOpDate() {
		return this.opDate;
	}
	
	public void setOpDate(java.util.Date value) {
		this.opDate = value;
	}
	
	@Column(name = "OP_USER", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getOpUser() {
		return this.opUser;
	}
	
	public void setOpUser(java.lang.String value) {
		this.opUser = value;
	}
	
	@Column(name = "RESOURCE_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public int getResourceId() {
		return this.resourceId;
	}
	
	public void setResourceId(int value) {
		this.resourceId = value;
	}
	
	@Column(name = "ROLE_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getRoleId() {
		return this.roleId;
	}
	
	public void setRoleId(java.lang.String value) {
		this.roleId = value;
	}
	
	
	private RightsRole rightsRole;
	public void setRightsRole(RightsRole rightsRole){
		this.rightsRole = rightsRole;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "ROLE_ID",nullable = false, insertable = false, updatable = false) 
	})
	public RightsRole getRightsRole() {
		return rightsRole;
	}
	
	private RightsUser rightsUser;
	public void setRightsUser(RightsUser rightsUser){
		this.rightsUser = rightsUser;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "OP_USER",nullable = false, insertable = false, updatable = false) 
	})
	public RightsUser getRightsUser() {
		return rightsUser;
	}
	
	private RightsResource rightsResource;
	public void setRightsResource(RightsResource rightsResource){
		this.rightsResource = rightsResource;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "RESOURCE_ID",nullable = false, insertable = false, updatable = false) 
	})
	public RightsResource getRightsResource() {
		return rightsResource;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("OpDate",getOpDate())
			.append("OpUser",getOpUser())
			.append("ResourceId",getResourceId())
			.append("RoleId",getRoleId())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof RightsMapping == false) return false;
		if(this == obj) return true;
		RightsMapping other = (RightsMapping)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

