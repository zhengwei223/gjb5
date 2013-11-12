package com.bm.gjb5.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javacommon.base.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

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
@Table(name = "RIGHTS_ROLE")
public class RightsRole extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "系统角色";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "名称";
	public static final String ALIAS_DESCP = "描述";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_REMARK = "备注";
	public static final String ALIAS_PERM = "权限字符串";
	// date formats

	// columns START
	/**
	 * id db_column: ID
	 */
	private java.lang.String id;
	/**
	 * name db_column: NAME
	 */
	private java.lang.String name;
	/**
	 * descp db_column: DESCP
	 */
	private java.lang.String descp;
	/**
	 * 1启用，0关闭 db_column: STATUS
	 */
	private java.lang.String status;
	/**
	 * remark db_column: REMARK
	 */
	private java.lang.String remark;

	private String perm;
	// columns END

	public RightsRole() {
	}

	public RightsRole(java.lang.String id) {
		this.id = id;
	}

	public void setId(java.lang.String value) {
		this.id = value;
	}

	@Id
	@GeneratedValue(generator = "custom-id")
	@GenericGenerator(name = "custom-id", strategy = "uuid")
	@Column(name = "ID", unique = true, nullable = false, insertable = true, updatable = true, length = 32)
	public java.lang.String getId() {
		return this.id;
	}

	@Column(name = "NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String value) {
		this.name = value;
	}

	@Column(name = "DESCP", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getDescp() {
		return this.descp;
	}

	public void setDescp(java.lang.String value) {
		this.descp = value;
	}

	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 1)
	public java.lang.String getStatus() {
		return this.status;
	}

	public void setStatus(java.lang.String value) {
		this.status = value;
	}

	@Column(name = "REMARK", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getRemark() {
		return this.remark;
	}

	public void setRemark(java.lang.String value) {
		this.remark = value;
	}
	
	@Column(name = "PERM", length = 255)
	public String getPerm() {
		return perm;
	}

	public void setPerm(String perm) {
		this.perm = perm;
	}

	private Set rightsUsers = new HashSet(0);

	public void setRightsUsers(Set<RightsUser> rightsUser) {
		this.rightsUsers = rightsUser;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "rightsRole")
	public Set<RightsUser> getRightsUsers() {
		return rightsUsers;
	}

	private Set rightsMappings = new HashSet(0);

	public void setRightsMappings(Set<RightsMapping> rightsMapping) {
		this.rightsMappings = rightsMapping;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "rightsRole")
	public Set<RightsMapping> getRightsMappings() {
		return rightsMappings;
	}

	/*获取当前角色拥有的系统资源*/	
	@Transient
	public List<RightsResource> getResourses() {
		List<RightsResource> resources = new ArrayList<RightsResource>();
		Set<RightsMapping> mappings = this.getRightsMappings();
		for (RightsMapping m : mappings) {
			resources.add(m.getRightsResource());
		}
		return resources;
	}
	
	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	public boolean equals(Object obj) {
		if (obj instanceof RightsRole == false)
			return false;
		if (this == obj)
			return true;
		RightsRole other = (RightsRole) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("Id", getId()).append("Name", getName())
				.append("Descp", getDescp()).append("Status", getStatus())
				.append("Remark", getRemark())
				.append("perm",getPerm()).toString();
	}

}
