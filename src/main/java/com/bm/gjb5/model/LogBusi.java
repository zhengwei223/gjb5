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

@Entity
@Table(name = "LOG_BUSI")
public class LogBusi extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "操作日志";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_OP_TYPE = "操作类型";
	public static final String ALIAS_OP_USER = "操作人";
	public static final String ALIAS_OP_TIME = "操作时间";
	public static final String ALIAS_SUBMODULE = "子模块";
	public static final String ALIAS_IP = "IP地址";
	public static final String ALIAS_EQ_ID = "地震序列";
	public static final String ALIAS_CONTENT = "sql或内容";
	
	//date formats
	public static final String FORMAT_OP_TIME = DATE_FORMAT;
	

	//columns START
    /**
     * id       db_column: ID 
     */ 	
	private java.lang.String id;
    /**
     * 操作类型       db_column: OP_TYPE 
     */ 	
	private Integer opType;
    /**
     * 操作人       db_column: OP_USER 
     */ 	
	private java.lang.String opUser;
    /**
     * 操作时间       db_column: OP_TIME 
     */ 	
	private java.util.Date opTime;
    /**
     * 子模块       db_column: SUBMODULE 
     */ 	
	private java.lang.String submodule;
    /**
     * IP地址       db_column: IP 
     */ 	
	private java.lang.String ip;
    /**
     * 地震序列       db_column: EQ_ID 
     */ 	
	private java.lang.String eqId;
    /**
     * sql或内容       db_column: CONTENT 
     */ 	
	private java.lang.String content;
	//columns END


	public LogBusi(){
	}

	public LogBusi(
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
	
	@Column(name = "OP_TYPE", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getOpType() {
		return this.opType;
	}
	
	public void setOpType(Integer value) {
		this.opType = value;
	}
	
	@Column(name = "OP_USER", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getOpUser() {
		return this.opUser;
	}
	
	public void setOpUser(java.lang.String value) {
		this.opUser = value;
	}
	
	@Transient
	public String getOpTimeString() {
		return DateConvertUtils.format(getOpTime(), FORMAT_OP_TIME);
	}
	public void setOpTimeString(String value) {
		setOpTime(DateConvertUtils.parse(value, FORMAT_OP_TIME,java.util.Date.class));
	}
	
	@Column(name = "OP_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getOpTime() {
		return this.opTime;
	}
	
	public void setOpTime(java.util.Date value) {
		this.opTime = value;
	}
	
	@Column(name = "SUBMODULE", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getSubmodule() {
		return this.submodule;
	}
	
	public void setSubmodule(java.lang.String value) {
		this.submodule = value;
	}
	
	@Column(name = "IP", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.String getIp() {
		return this.ip;
	}
	
	public void setIp(java.lang.String value) {
		this.ip = value;
	}
	
	@Column(name = "EQ_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getEqId() {
		return this.eqId;
	}
	
	public void setEqId(java.lang.String value) {
		this.eqId = value;
	}
	
	@Column(name = "CONTENT", unique = false, nullable = true, insertable = true, updatable = true, length = 4000)
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("OpType",getOpType())
			.append("OpUser",getOpUser())
			.append("OpTime",getOpTime())
			.append("Submodule",getSubmodule())
			.append("Ip",getIp())
			.append("EqId",getEqId())
			.append("Content",getContent())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof LogBusi == false) return false;
		if(this == obj) return true;
		LogBusi other = (LogBusi)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

