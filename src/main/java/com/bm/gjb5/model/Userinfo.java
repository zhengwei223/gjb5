package com.bm.gjb5.model;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name = "USERINFO")
public class Userinfo extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "中心用户";
	public static final String ALIAS_UUID = "ID";
	public static final String ALIAS_CODE = "编码";
	public static final String ALIAS_USERNAME = "用户名";
	public static final String ALIAS_PWD = "密码";
	public static final String ALIAS_FULLNAME = "姓名";
	public static final String ALIAS_PNUMBER = "手机号码";
	public static final String ALIAS_UNIT = "所属单位";
	public static final String ALIAS_EMAIL = "邮件";
	public static final String ALIAS_ORGUUID = "机构id";
	public static final String ALIAS_ORGCODE = "机构编码";
	public static final String ALIAS_STATUS = "状态";
	
	

	//columns START
    /**
     * ID       db_column: UUID 
     */ 	
	private java.lang.String uuid;
    /**
     * 编码       db_column: CODE 
     */ 	
	private java.lang.String code;
    /**
     * 用户名       db_column: USERNAME 
     */ 	
	private java.lang.String username;
    /**
     * 密码       db_column: PWD 
     */ 	
	private java.lang.String pwd;
    /**
     * 姓名       db_column: FULLNAME 
     */ 	
	private java.lang.String fullname;
    /**
     * 手机号码       db_column: PNUMBER 
     */ 	
	private java.lang.String pnumber;
    /**
     * 所属单位       db_column: UNIT 
     */ 	
	private java.lang.String unit;
    /**
     * 邮件       db_column: EMAIL 
     */ 	
	private java.lang.String email;
    /**
     * 机构id       db_column: ORGUUID 
     */ 	
	private java.lang.String orguuid;
    /**
     * 机构编码       db_column: ORGCODE 
     */ 	
	private java.lang.String orgcode;
	/**
     * 状态       db_column: STATUS 
     */ 	
	private java.lang.String status="1";
	//columns END

	private String opt;
	public Userinfo(){
	}

	public Userinfo(
		java.lang.String uuid
	){
		this.uuid = uuid;
	}

	

	public Userinfo(String opt, String uuid, String code, String username,
			String pwd, String fullname, String pnumber, String unit,
			String email, String orguuid, String orgcode) {
		super();
		this.opt = opt;
		this.uuid = uuid;
		this.code = code;
		this.username = username;
		this.pwd = pwd;
		this.fullname = fullname;
		this.pnumber = pnumber;
		this.unit = unit;
		this.email = email;
		this.orguuid = orguuid;
		this.orgcode = orgcode;
	}

	public void setUuid(java.lang.String value) {
		this.uuid = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "assigned")
	@Column(name = "UUID", unique = true, nullable = false, insertable = true, updatable = true, length = 32)
	public java.lang.String getUuid() {
		return this.uuid;
	}
	
	@Column(name = "CODE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getCode() {
		return this.code;
	}
	
	public void setCode(java.lang.String value) {
		this.code = value;
	}
	
	@Column(name = "USERNAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getUsername() {
		return this.username;
	}
	
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	@Column(name = "PWD", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getPwd() {
		return this.pwd;
	}
	
	public void setPwd(java.lang.String value) {
		this.pwd = value;
	}
	
	@Column(name = "FULLNAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getFullname() {
		return this.fullname;
	}
	
	public void setFullname(java.lang.String value) {
		this.fullname = value;
	}
	
	@Column(name = "PNUMBER", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	public java.lang.String getPnumber() {
		return this.pnumber;
	}
	
	public void setPnumber(java.lang.String value) {
		this.pnumber = value;
	}
	
	@Column(name = "UNIT", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	@Column(name = "EMAIL", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getEmail() {
		return this.email;
	}
	
	public void setEmail(java.lang.String value) {
		this.email = value;
	}
	
	@Column(name = "ORGUUID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getOrguuid() {
		return this.orguuid;
	}
	
	public void setOrguuid(java.lang.String value) {
		this.orguuid = value;
	}
	
	@Column(name = "ORGCODE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getOrgcode() {
		return this.orgcode;
	}
	
	public void setOrgcode(java.lang.String value) {
		this.orgcode = value;
	}
	
	@Transient
	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}
	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String value) {
		this.status = value;
	}
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Opt",getOpt())
			.append("Uuid",getUuid())
			.append("Code",getCode())
			.append("Username",getUsername())
			.append("Pwd",getPwd())
			.append("Fullname",getFullname())
			.append("Pnumber",getPnumber())
			.append("Unit",getUnit())
			.append("Email",getEmail())
			.append("Orguuid",getOrguuid())
			.append("Orgcode",getOrgcode())
			.append("Status",getStatus())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getUuid())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Userinfo == false) return false;
		if(this == obj) return true;
		Userinfo other = (Userinfo)obj;
		return new EqualsBuilder()
			.append(getUuid(),other.getUuid())
			.isEquals();
	}
}

