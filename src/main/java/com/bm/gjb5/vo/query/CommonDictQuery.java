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


public class CommonDictQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** tableName */
	private java.lang.String tableName;
	/** fieldName */
	private java.lang.String fieldName;
	/** 数值 */
	private Integer fieldValue;
	/** text */
	private java.lang.String text;
	/** 对该映射的描述 */
	private java.lang.String descp;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getTableName() {
		return this.tableName;
	}
	
	public void setTableName(java.lang.String value) {
		this.tableName = value;
	}
	
	public java.lang.String getFieldName() {
		return this.fieldName;
	}
	
	public void setFieldName(java.lang.String value) {
		this.fieldName = value;
	}
	
	public Integer getFieldValue() {
		return this.fieldValue;
	}
	
	public void setFieldValue(Integer value) {
		this.fieldValue = value;
	}
	
	public java.lang.String getText() {
		return this.text;
	}
	
	public void setText(java.lang.String value) {
		this.text = value;
	}
	
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

