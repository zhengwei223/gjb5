package com.bm.gjb5.vo.query;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.io.Serializable;

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


public class LogExceptionQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** eventTime */
	private java.util.Date eventTimeBegin;
	private java.util.Date eventTimeEnd;
	/** outline */
	private java.lang.String outline;
	/** callStack */
	private java.lang.String callStack;
	/** submodule */
	private java.lang.String submodule;
	/** exceptionLevel */
	private Integer exceptionLevel;
	/** 1已报告 2未报告 0无需报告 */
	private Integer status;
	/** eqId */
	private java.lang.String eqId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.util.Date getEventTimeBegin() {
		return this.eventTimeBegin;
	}
	
	public void setEventTimeBegin(java.util.Date value) {
		this.eventTimeBegin = value;
	}	
	
	public java.util.Date getEventTimeEnd() {
		return this.eventTimeEnd;
	}
	
	public void setEventTimeEnd(java.util.Date value) {
		this.eventTimeEnd = value;
	}
	
	public java.lang.String getOutline() {
		return this.outline;
	}
	
	public void setOutline(java.lang.String value) {
		this.outline = value;
	}
	
	public java.lang.String getCallStack() {
		return this.callStack;
	}
	
	public void setCallStack(java.lang.String value) {
		this.callStack = value;
	}
	
	public java.lang.String getSubmodule() {
		return this.submodule;
	}
	
	public void setSubmodule(java.lang.String value) {
		this.submodule = value;
	}
	
	public Integer getExceptionLevel() {
		return this.exceptionLevel;
	}
	
	public void setExceptionLevel(Integer value) {
		this.exceptionLevel = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public java.lang.String getEqId() {
		return this.eqId;
	}
	
	public void setEqId(java.lang.String value) {
		this.eqId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

