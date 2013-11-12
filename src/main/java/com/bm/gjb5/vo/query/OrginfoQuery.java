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
import org.slf4j.*;
public class OrginfoQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String orguuid;
	/** 父级组织 */
	private java.lang.String parentuuid;
	/** 名称 */
	private java.lang.String orgname;
	/** 编码 */
	private java.lang.String orgcode;
	/** 描述 */
	private java.lang.String content;
	/** 责任人 */
	private java.lang.String dutyOfficer;
	/** 联系电话 */
	private java.lang.String pnumber;
	/** 状态 */
	private java.lang.String status;

	public java.lang.String getOrguuid() {
		return this.orguuid;
	}
	
	public void setOrguuid(java.lang.String value) {
		this.orguuid = value;
	}
	
	public java.lang.String getParentuuid() {
		return this.parentuuid;
	}
	
	public void setParentuuid(java.lang.String value) {
		this.parentuuid = value;
	}
	
	public java.lang.String getOrgname() {
		return this.orgname;
	}
	
	public void setOrgname(java.lang.String value) {
		this.orgname = value;
	}
	
	public java.lang.String getOrgcode() {
		return this.orgcode;
	}
	
	public void setOrgcode(java.lang.String value) {
		this.orgcode = value;
	}
	
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	
	public java.lang.String getDutyOfficer() {
		return this.dutyOfficer;
	}
	
	public void setDutyOfficer(java.lang.String value) {
		this.dutyOfficer = value;
	}
	
	public java.lang.String getPnumber() {
		return this.pnumber;
	}
	
	public void setPnumber(java.lang.String value) {
		this.pnumber = value;
	}
	
	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String value) {
		this.status = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

