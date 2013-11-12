package com.bm.gjb5.model;

import javacommon.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


@Entity
@Table(name = "COMMON_DICT")
public class CommonDict extends BaseEntity implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "码表";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_TABLE_NAME = "表名/一级分类";
	public static final String ALIAS_FIELD_NAME = "字段名/二级分类";
	public static final String ALIAS_FIELD_VALUE = "数值/标识";
	public static final String ALIAS_TEXT = "文本值";
	public static final String ALIAS_DESCP = "描述";
	
	//date formats
	

	//可以直接使用: 显示错误消息
	//columns START
    /**
     * id       db_column: ID 
     */ 	
	private java.lang.String id;
    /**
     * tableName       db_column: TABLE_NAME 
     */ 	
	private java.lang.String tableName;
    /**
     * fieldName       db_column: FIELD_NAME 
     */ 	
	private java.lang.String fieldName;
    /**
     * 数值       db_column: FIELD_VALUE 
     */ 	
	private Integer fieldValue;
    /**
     * text       db_column: TEXT 
     */ 	
	private java.lang.String text;
    /**
     * 对该映射的描述       db_column: DESCP 
     */ 	
	private java.lang.String descp;
	//columns END


	public CommonDict(){
	}

	public CommonDict(
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
	
	@Column(name = "TABLE_NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getTableName() {
		return this.tableName;
	}
	
	public void setTableName(java.lang.String value) {
		this.tableName = value;
	}
	
	@Column(name = "FIELD_NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getFieldName() {
		return this.fieldName;
	}
	
	public void setFieldName(java.lang.String value) {
		this.fieldName = value;
	}
	
	@Column(name = "FIELD_VALUE", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getFieldValue() {
		return this.fieldValue;
	}
	
	public void setFieldValue(Integer value) {
		this.fieldValue = value;
	}
	
	@Column(name = "TEXT", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getText() {
		return this.text;
	}
	
	public void setText(java.lang.String value) {
		this.text = value;
	}
	
	@Column(name = "DESCP", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getDescp() {
		return this.descp;
	}
	
	public void setDescp(java.lang.String value) {
		this.descp = value;
	}
	

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("TableName",getTableName())
			.append("FieldName",getFieldName())
			.append("FieldValue",getFieldValue())
			.append("Text",getText())
			.append("Descp",getDescp())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof CommonDict == false) return false;
		if(this == obj) return true;
		CommonDict other = (CommonDict)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
}

