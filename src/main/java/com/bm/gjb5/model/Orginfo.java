package com.bm.gjb5.model;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.util.*;
import java.lang.reflect.*;
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
import org.slf4j.*;
@Entity
@Table(name = "ORGINFO")
public class Orginfo extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "组织机构";
	public static final String ALIAS_ORGUUID = "id";
	public static final String ALIAS_PARENTUUID = "父级组织";
	public static final String ALIAS_ORGNAME = "名称";
	public static final String ALIAS_ORGCODE = "编码";
	public static final String ALIAS_CONTENT = "描述";
	public static final String ALIAS_DUTY_OFFICER = "责任人";
	public static final String ALIAS_PNUMBER = "联系电话";
	public static final String ALIAS_STATUS = "状态";
	

	//columns START
    /**
     * id       db_column: ORGUUID 
     */ 	
	private java.lang.String orguuid;
    /**
     * 父级组织       db_column: PARENTUUID 
     */ 	
	private java.lang.String parentuuid;
    /**
     * 名称       db_column: ORGNAME 
     */ 	
	private java.lang.String orgname;
    /**
     * 编码       db_column: ORGCODE 
     */ 	
	private java.lang.String orgcode;
    /**
     * 描述       db_column: CONTENT 
     */ 	
	private java.lang.String content;
    /**
     * 责任人       db_column: DUTY_OFFICER 
     */ 	
	private java.lang.String dutyOfficer;
    /**
     * 联系电话       db_column: PNUMBER 
     */ 	
	private java.lang.String pnumber;
	/**
     * 状态       db_column: STATUS 
     */ 	
	private java.lang.String status = "1";
	//columns END


	public Orginfo(){
	}

	public Orginfo(
		java.lang.String orguuid
	){
		this.orguuid = orguuid;
	}

	

	public void setOrguuid(java.lang.String value) {
		this.orguuid = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "uuid")
	@Column(name = "ORGUUID", unique = true, nullable = false, insertable = true, updatable = true, length = 32)
	public java.lang.String getOrguuid() {
		return this.orguuid;
	}
	
	@Column(name = "PARENTUUID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getParentuuid() {
		return this.parentuuid;
	}
	
	public void setParentuuid(java.lang.String value) {
		this.parentuuid = value;
	}
	
	@Column(name = "ORGNAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getOrgname() {
		return this.orgname;
	}
	
	public void setOrgname(java.lang.String value) {
		this.orgname = value;
	}
	
	@Column(name = "ORGCODE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getOrgcode() {
		return this.orgcode;
	}
	
	public void setOrgcode(java.lang.String value) {
		this.orgcode = value;
	}
	
	@Column(name = "CONTENT", unique = false, nullable = true, insertable = true, updatable = true, length = 500)
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	
	@Column(name = "DUTY_OFFICER", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getDutyOfficer() {
		return this.dutyOfficer;
	}
	
	public void setDutyOfficer(java.lang.String value) {
		this.dutyOfficer = value;
	}
	
	@Column(name = "PNUMBER", unique = false, nullable = true, insertable = true, updatable = true, length = 11)
	public java.lang.String getPnumber() {
		return this.pnumber;
	}
	
	public void setPnumber(java.lang.String value) {
		this.pnumber = value;
	}
	
	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String value) {
		this.status = value;
	}
	private Set orginfos = new HashSet(0);
	public void setOrginfos(Set<Orginfo> orginfo){
		this.orginfos = orginfo;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "orginfo")
	public Set<Orginfo> getOrginfos() {
		return orginfos;
	}
	
	private Orginfo orginfo;
	public void setOrginfo(Orginfo orginfo){
		this.orginfo = orginfo;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "PARENTUUID",nullable = false, insertable = false, updatable = false) 
	})
	public Orginfo getOrginfo() {
		return orginfo;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Orguuid",getOrguuid())
			.append("Parentuuid",getParentuuid())
			.append("Orgname",getOrgname())
			.append("Orgcode",getOrgcode())
			.append("Content",getContent())
			.append("DutyOfficer",getDutyOfficer())
			.append("Pnumber",getPnumber())
			.append("Status",getStatus())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getOrguuid())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Orginfo == false) return false;
		if(this == obj) return true;
		Orginfo other = (Orginfo)obj;
		return new EqualsBuilder()
			.append(getOrguuid(),other.getOrguuid())
			.isEquals();
	}
}

