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


public class RightsMappingQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** opDate */
	private java.util.Date opDateBegin;
	private java.util.Date opDateEnd;
	/** opUser */
	private java.lang.String opUser;
	/** resourceId */
	private java.lang.String resourceId;
	/** roleId */
	private java.lang.String roleId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.util.Date getOpDateBegin() {
		return this.opDateBegin;
	}
	
	public void setOpDateBegin(java.util.Date value) {
		this.opDateBegin = value;
	}	
	
	public java.util.Date getOpDateEnd() {
		return this.opDateEnd;
	}
	
	public void setOpDateEnd(java.util.Date value) {
		this.opDateEnd = value;
	}
	
	public java.lang.String getOpUser() {
		return this.opUser;
	}
	
	public void setOpUser(java.lang.String value) {
		this.opUser = value;
	}
	
	public java.lang.String getResourceId() {
		return this.resourceId;
	}
	
	public void setResourceId(java.lang.String value) {
		this.resourceId = value;
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

