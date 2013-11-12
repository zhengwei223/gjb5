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


public class SysDisasterIconQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** 灾害等级,直接对应图标 */
	private Integer disasterLevel;
	/** iconName */
	private java.lang.String iconName;
	/** iconUrl */
	private java.lang.String iconUrl;
	/** updateTime */
	private java.util.Date updateTimeBegin;
	private java.util.Date updateTimeEnd;
	/** createTime */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** opuser */
	private java.lang.String opuser;
	/** 单位,如人/千人/平方米/平方公里/间等计量单位 */
	private java.lang.String unit;
	/** measurementId */
	private java.lang.String measurementId;
	/** rigId */
	private java.lang.String rigId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public Integer getDisasterLevel() {
		return this.disasterLevel;
	}
	
	public void setDisasterLevel(Integer value) {
		this.disasterLevel = value;
	}
	
	public java.lang.String getIconName() {
		return this.iconName;
	}
	
	public void setIconName(java.lang.String value) {
		this.iconName = value;
	}
	
	public java.lang.String getIconUrl() {
		return this.iconUrl;
	}
	
	public void setIconUrl(java.lang.String value) {
		this.iconUrl = value;
	}
	
	public java.util.Date getUpdateTimeBegin() {
		return this.updateTimeBegin;
	}
	
	public void setUpdateTimeBegin(java.util.Date value) {
		this.updateTimeBegin = value;
	}	
	
	public java.util.Date getUpdateTimeEnd() {
		return this.updateTimeEnd;
	}
	
	public void setUpdateTimeEnd(java.util.Date value) {
		this.updateTimeEnd = value;
	}
	
	public java.util.Date getCreateTimeBegin() {
		return this.createTimeBegin;
	}
	
	public void setCreateTimeBegin(java.util.Date value) {
		this.createTimeBegin = value;
	}	
	
	public java.util.Date getCreateTimeEnd() {
		return this.createTimeEnd;
	}
	
	public void setCreateTimeEnd(java.util.Date value) {
		this.createTimeEnd = value;
	}
	
	public java.lang.String getOpuser() {
		return this.opuser;
	}
	
	public void setOpuser(java.lang.String value) {
		this.opuser = value;
	}
	
	public java.lang.String getUnit() {
		return this.unit;
	}
	
	public void setUnit(java.lang.String value) {
		this.unit = value;
	}
	
	public java.lang.String getMeasurementId() {
		return this.measurementId;
	}
	
	public void setMeasurementId(java.lang.String value) {
		this.measurementId = value;
	}
	
	public java.lang.String getRigId() {
		return this.rigId;
	}
	
	public void setRigId(java.lang.String value) {
		this.rigId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

