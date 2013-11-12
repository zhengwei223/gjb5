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


public class DataIdentifyQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** id */
	private java.lang.String id;
	/** createTime */
	private java.util.Date createTimeBegin;
	private java.util.Date createTimeEnd;
	/** eventTime */
	private java.util.Date eventTimeBegin;
	private java.util.Date eventTimeEnd;
	/** location */
	private java.lang.String location;
	/** longitude */
	private java.lang.String longitude;
	/** latitude */
	private java.lang.String latitude;
	/** txtInfo1 */
	private java.lang.String txtInfo1;
	/** txtInfo2 */
	private java.lang.String txtInfo2;
	/** semantics */
	private java.lang.String semantics;
	/** magnitude */
	private Long magnitude;
	/** seisesthesia */
	private Integer seisesthesia;
	/** reportMan */
	private java.lang.String reportMan;
	/** reportTime */
	private java.util.Date reportTimeBegin;
	private java.util.Date reportTimeEnd;
	/** manual */
	private java.lang.String manual;
	/** originalId */
	private java.lang.String originalId;

	public java.lang.String getId() {
		return this.id;
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
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
	
	public java.lang.String getLocation() {
		return this.location;
	}
	
	public void setLocation(java.lang.String value) {
		this.location = value;
	}
	
	public java.lang.String getLongitude() {
		return this.longitude;
	}
	
	public void setLongitude(java.lang.String value) {
		this.longitude = value;
	}
	
	public java.lang.String getLatitude() {
		return this.latitude;
	}
	
	public void setLatitude(java.lang.String value) {
		this.latitude = value;
	}
	
	public java.lang.String getTxtInfo1() {
		return this.txtInfo1;
	}
	
	public void setTxtInfo1(java.lang.String value) {
		this.txtInfo1 = value;
	}
	
	public java.lang.String getTxtInfo2() {
		return this.txtInfo2;
	}
	
	public void setTxtInfo2(java.lang.String value) {
		this.txtInfo2 = value;
	}
	
	public java.lang.String getSemantics() {
		return this.semantics;
	}
	
	public void setSemantics(java.lang.String value) {
		this.semantics = value;
	}
	
	public Long getMagnitude() {
		return this.magnitude;
	}
	
	public void setMagnitude(Long value) {
		this.magnitude = value;
	}
	
	public Integer getSeisesthesia() {
		return this.seisesthesia;
	}
	
	public void setSeisesthesia(Integer value) {
		this.seisesthesia = value;
	}
	
	public java.lang.String getReportMan() {
		return this.reportMan;
	}
	
	public void setReportMan(java.lang.String value) {
		this.reportMan = value;
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
	
	public java.lang.String getManual() {
		return this.manual;
	}
	
	public void setManual(java.lang.String value) {
		this.manual = value;
	}
	
	public java.lang.String getOriginalId() {
		return this.originalId;
	}
	
	public void setOriginalId(java.lang.String value) {
		this.originalId = value;
	}
	

	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.MULTI_LINE_STYLE);
	}
	
}

