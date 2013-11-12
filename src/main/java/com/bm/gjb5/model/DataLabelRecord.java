package com.bm.gjb5.model;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;

import cn.org.rapid_framework.util.DateConvertUtils;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "DATA_LABEL_RECORD")
public class DataLabelRecord extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "记录识别后灾情信息在地图上的标定信息";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_ICON_ID = "iconId";
	public static final String ALIAS_DIS_DETAIL_ID = "disDetailId";
	public static final String ALIAS_OP_DATE = "opDate";
	
	//date formats
	public static final String FORMAT_OP_DATE = DATE_FORMAT;
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	
	private java.lang.String id;
    /**
     * iconId       db_column: ICON_ID 
     */ 	
	
	private java.lang.String iconId;
    /**
     * disDetailId       db_column: DIS_DETAIL_ID 
     */ 	
	
	private java.lang.String disDetailId;
    /**
     * opDate       db_column: OP_DATE 
     */ 	
	
	private java.util.Date opDate;
	//columns END


	public DataLabelRecord(){
	}

	public DataLabelRecord(
		java.lang.String id
	){
		this.id = id;
	}

	

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	@Id @GeneratedValue(generator="custom-id")
	@GenericGenerator(name="custom-id", strategy = "uuid")
	@Column(name = "ID", unique = true, nullable = false, insertable = true, updatable = true, length = 32)
	public java.lang.String getId() {
		return this.id;
	}
	
	@Column(name = "ICON_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getIconId() {
		return this.iconId;
	}
	
	public void setIconId(java.lang.String value) {
		this.iconId = value;
	}
	
	@Column(name = "DIS_DETAIL_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getDisDetailId() {
		return this.disDetailId;
	}
	
	public void setDisDetailId(java.lang.String value) {
		this.disDetailId = value;
	}
	
	@Transient
	public String getOpDateString() {
		return DateConvertUtils.format(getOpDate(), FORMAT_OP_DATE);
	}
	public void setOpDateString(String value) {
		setOpDate(DateConvertUtils.parse(value, FORMAT_OP_DATE,java.util.Date.class));
	}
	
	@Column(name = "OP_DATE", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getOpDate() {
		return this.opDate;
	}
	
	public void setOpDate(java.util.Date value) {
		this.opDate = value;
	}
	
	
	private DataDisasterDetail dataDisasterDetail;
	public void setDataDisasterDetail(DataDisasterDetail dataDisasterDetail){
		this.dataDisasterDetail = dataDisasterDetail;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "DIS_DETAIL_ID",nullable = false, insertable = false, updatable = false) 
	})
	public DataDisasterDetail getDataDisasterDetail() {
		return dataDisasterDetail;
	}
	
	private SysDisasterIcon sysDisasterIcon;
	public void setSysDisasterIcon(SysDisasterIcon sysDisasterIcon){
		this.sysDisasterIcon = sysDisasterIcon;
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "ICON_ID",nullable = false, insertable = false, updatable = false) 
	})
	public SysDisasterIcon getSysDisasterIcon() {
		return sysDisasterIcon;
	}

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("IconId",getIconId())
			.append("DisDetailId",getDisDetailId())
			.append("OpDate",getOpDate())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DataLabelRecord == false) return false;
		if(this == obj) return true;
		DataLabelRecord other = (DataLabelRecord)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

