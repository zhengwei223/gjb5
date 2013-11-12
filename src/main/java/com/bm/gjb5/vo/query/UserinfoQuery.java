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
public class UserinfoQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** ID */
	private java.lang.String uuid;
	/** 编码 */
	private java.lang.String code;
	/** 用户名 */
	private java.lang.String username;
	/** 密码 */
	private java.lang.String pwd;
	/** 姓名 */
	private java.lang.String fullname;
	/** 手机号码 */
	private java.lang.String pnumber;
	/** 所属单位 */
	private java.lang.String unit;
	/** 邮件 */
	private java.lang.String email;
	/** 机构id */
	private java.lang.String orguuid;
	/** 机构编码 */
	private java.lang.String orgcode;
	/** 状态 */
	private java.lang.String status;

	public java.lang.String getUuid() {
		return this.uuid;
	}
	
	public void setUuid(java.lang.String value) {
		this.uuid = value;
	}
	
	public java.lang.String getCode() {
		return this.code;
	}
	
	public void setCode(java.lang.String value) {
		this.code = value;
	}
	
	public java.lang.String getUsername() {
		return this.username;
	}
	
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	public java.lang.String getPwd() {
		return this.pwd;
	}
	
	public void setPwd(java.lang.String value) {
		this.pwd = value;
	}
	
	public java.lang.String getFullname() {
		return this.fullname;
	}
	
	public void setFullname(java.lang.String value) {
		this.fullname = value;
	}
	
	public java.lang.String getPnumber() {
		return this.pnumber;
	}
	
	public void setPnumber(java.lang.String value) {
		this.pnumber = value;
	}
	
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	public java.lang.String getEmail() {
		return this.email;
	}
	
	public void setEmail(java.lang.String value) {
		this.email = value;
	}
	
	public java.lang.String getOrguuid() {
		return this.orguuid;
	}
	
	public void setOrguuid(java.lang.String value) {
		this.orguuid = value;
	}
	
	public java.lang.String getOrgcode() {
		return this.orgcode;
	}
	
	public void setOrgcode(java.lang.String value) {
		this.orgcode = value;
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

