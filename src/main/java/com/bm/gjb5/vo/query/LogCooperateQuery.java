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


public class LogCooperateQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** reportTime */
	private java.util.Date reportTimeBegin;
	private java.util.Date reportTimeEnd;
	/** logTitle */
	private java.lang.String logTitle;
	/** logMessage */
	private java.lang.String logMessage;
	/** status */
	private Integer status;
	/** eqId */
	private java.lang.String eqId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.util.Date getReportTimeBegin() {
		return this.reportTimeBegin;
	}
	
	public void setReportTimeBegin(java.util.Date value) {
		this.reportTimeBegin = value;
	}	
	
	public java.util.Date getReportTimeEnd() {
		return this.reportTimeEnd;
	}
	
	public void setReportTimeEnd(java.util.Date value) {
		this.reportTimeEnd = value;
	}
	
	public java.lang.String getLogTitle() {
		return this.logTitle;
	}
	
	public void setLogTitle(java.lang.String value) {
		this.logTitle = value;
	}
	
	public java.lang.String getLogMessage() {
		return this.logMessage;
	}
	
	public void setLogMessage(java.lang.String value) {
		this.logMessage = value;
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

