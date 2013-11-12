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


public class RightsUserQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** username */
	private java.lang.String username;
	/** password */
	private java.lang.String password;
	/** name */
	private java.lang.String name;
	/** 状态,1启用，2在线，3离线，9注销 */
	private Integer status;
	/** deptId */
	private java.lang.String deptId;
	/** orgId */
	private java.lang.String orgId;
	/** empId */
	private java.lang.String empId;
	/** phonenumber */
	private java.lang.String phonenumber;
	/** roleId */
	private java.lang.String roleId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getUsername() {
		return this.username;
	}
	
	public void setUsername(java.lang.String value) {
		this.username = value;
	}
	
	public java.lang.String getPassword() {
		return this.password;
	}
	
	public void setPassword(java.lang.String value) {
		this.password = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	public Integer getStatus() {
		return this.status;
	}
	
	public void setStatus(Integer value) {
		this.status = value;
	}
	
	public java.lang.String getDeptId() {
		return this.deptId;
	}
	
	public void setDeptId(java.lang.String value) {
		this.deptId = value;
	}
	
	public java.lang.String getOrgId() {
		return this.orgId;
	}
	
	public void setOrgId(java.lang.String value) {
		this.orgId = value;
	}
	
	public java.lang.String getEmpId() {
		return this.empId;
	}
	
	public void setEmpId(java.lang.String value) {
		this.empId = value;
	}
	
	public java.lang.String getPhonenumber() {
		return this.phonenumber;
	}
	
	public void setPhonenumber(java.lang.String value) {
		this.phonenumber = value;
	}
	
	public java.lang.String getRoleId() {
		return this.roleId;
	}
	
	public void setRoleId(java.lang.String value) {
		this.roleId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

