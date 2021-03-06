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


public class SysDisasterPredicateQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** name */
	private java.lang.String name;
	/** descp */
	private java.lang.String descp;
	/** classifyId */
	private java.lang.String classifyId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	
	public java.lang.String getClassifyId() {
		return this.classifyId;
	}
	
	public void setClassifyId(java.lang.String value) {
		this.classifyId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

