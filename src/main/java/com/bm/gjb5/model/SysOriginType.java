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
@Table(name = "SYS_ORIGIN_TYPE")
public class SysOriginType extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "数据来源,如网络媒体,现场指挥";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "名称";
	public static final String ALIAS_DESCP = "描述";
	
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
	//columns END


	public SysOriginType(){
	}

	public SysOriginType(
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
	
	@Column(name = "NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	@Column(name = "DESCP", unique = false, nullable = true, insertable = true, updatable = true, length = 200)
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	
	
	private Set sysJobs = new HashSet(0);
	public void setSysJobs(Set<SysJob> sysJob){
		this.sysJobs = sysJob;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "sysOriginType")
	public Set<SysJob> getSysJobs() {
		return sysJobs;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("Descp",getDescp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof SysOriginType == false) return false;
		if(this == obj) return true;
		SysOriginType other = (SysOriginType)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

