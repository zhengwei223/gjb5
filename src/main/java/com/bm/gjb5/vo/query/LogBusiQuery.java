package com.bm.gjb5.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

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

public class LogBusiQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** 操作类型 */
	private Integer opType;
	/** 操作人 */
	private java.lang.String opUser;
	/** 操作时间 */
	private java.util.Date opTimeBegin;
	private java.util.Date opTimeEnd;
	/** 子模块 */
	private java.lang.String submodule;
	/** IP地址 */
	private java.lang.String ip;
	/** 地震序列 */
	private java.lang.String eqId;
	/** sql或内容 */
	private java.lang.String content;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public Integer getOpType() {
		return this.opType;
	}
	
	public void setOpType(Integer value) {
		this.opType = value;
	}
	
	public java.lang.String getOpUser() {
		return this.opUser;
	}
	
	public void setOpUser(java.lang.String value) {
		this.opUser = value;
	}
	
	public java.util.Date getOpTimeBegin() {
		return this.opTimeBegin;
	}
	
	public void setOpTimeBegin(java.util.Date value) {
		this.opTimeBegin = value;
	}	
	
	public java.util.Date getOpTimeEnd() {
		return this.opTimeEnd;
	}
	
	public void setOpTimeEnd(java.util.Date value) {
		this.opTimeEnd = value;
	}
	
	public java.lang.String getSubmodule() {
		return this.submodule;
	}
	
	public void setSubmodule(java.lang.String value) {
		this.submodule = value;
	}
	
	public java.lang.String getIp() {
		return this.ip;
	}
	
	public void setIp(java.lang.String value) {
		this.ip = value;
	}
	
	public java.lang.String getEqId() {
		return this.eqId;
	}
	
	public void setEqId(java.lang.String value) {
		this.eqId = value;
	}
	
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

