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


public class DataDisasterDetailQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** 该值可能没有，而是用一个量度来表现一个灾情的明细信息 */
	private Long exactValue;
	/** descp */
	private java.lang.String descp;
	/** filed1 */
	private java.lang.String filed1;
	/** filed2 */
	private java.lang.String filed2;
	/** filed3 */
	private java.lang.String filed3;
	/** 是否已经标注 */
	private java.lang.String labeled;
	/** itentityId */
	private java.lang.String itentityId;
	/** measurementId */
	private java.lang.String measurementId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public Long getExactValue() {
		return this.exactValue;
	}
	
	public void setExactValue(Long value) {
		this.exactValue = value;
	}
	
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	
	public java.lang.String getFiled1() {
		return this.filed1;
	}
	
	public void setFiled1(java.lang.String value) {
		this.filed1 = value;
	}
	
	public java.lang.String getFiled2() {
		return this.filed2;
	}
	
	public void setFiled2(java.lang.String value) {
		this.filed2 = value;
	}
	
	public java.lang.String getFiled3() {
		return this.filed3;
	}
	
	public void setFiled3(java.lang.String value) {
		this.filed3 = value;
	}
	
	public java.lang.String getLabeled() {
		return this.labeled;
	}
	
	public void setLabeled(java.lang.String value) {
		this.labeled = value;
	}
	
	public java.lang.String getItentityId() {
		return this.itentityId;
	}
	
	public void setItentityId(java.lang.String value) {
		this.itentityId = value;
	}
	
	public java.lang.String getMeasurementId() {
		return this.measurementId;
	}
	
	public void setMeasurementId(java.lang.String value) {
		this.measurementId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

