package com.bm.gjb5.model;

import java.util.HashSet;
import java.util.Set;

import javacommon.base.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name = "RIGHTS_USER")
public class RightsUser extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "系统用户";
	public static final String ALIAS_ID = "标识";
	public static final String ALIAS_USERNAME = "用户名";
	public static final String ALIAS_PASSWORD = "密码";
	public static final String ALIAS_NAME = "真实姓名";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_DEPT_ID = "部门";
	public static final String ALIAS_ORG_ID = "组织";
	public static final String ALIAS_EMP_ID = "员工";
	public static final String ALIAS_PHONENUMBER = "电话号码";
	public static final String ALIAS_ROLE_ID = "角色";

	// date formats

	// 可以直接使用: 显示错误消息
	// columns START
	/**
	 * id db_column: ID
	 */

	private java.lang.String id;
	/**
	 * username db_column: USERNAME
	 */

	private java.lang.String username;
	/**
	 * password db_column: PASSWORD
	 */

	private java.lang.String password;
	/**
	 * name db_column: NAME
	 */

	private java.lang.String name;
	/**
	 * 状态,1启用，2在线，3离线，9注销 db_column: STATUS
	 */
	private Integer status;
	/**
	 * deptId db_column: DEPT_ID
	 */

	private java.lang.String deptId;
	/**
	 * orgId db_column: ORG_ID
	 */

	private java.lang.String orgId;
	/**
	 * empId db_column: EMP_ID
	 */

	private java.lang.String empId;
	/**
	 * phonenumber db_column: PHONENUMBER
	 */

	private java.lang.String phonenumber;
	/**
	 * roleId db_column: ROLE_ID
	 */

	private java.lang.String roleId;

	// columns END

	public RightsUser() {
	}

	public RightsUser(java.lang.String id) {
		this.id = id;
	}

	public RightsUser(Userinfo userinfo) {
		setId(userinfo.getUuid());
		setUsername(userinfo.getUsername());
		setPassword(userinfo.getPwd());
		setOrgId(userinfo.getOrguuid());
		setPhonenumber(userinfo.getPnumber());
		setStatus(1);
		setName(userinfo.getFullname());
		setDeptId(userinfo.getOrgcode());
		setEmpId(userinfo.getCode());
		
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

	@Column(name = "USERNAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getUsername() {
		return this.username;
	}

	public void setUsername(java.lang.String value) {
		this.username = value;
	}

	@Column(name = "PASSWORD", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getPassword() {
		return this.password;
	}

	public void setPassword(java.lang.String value) {
		this.password = value;
	}

	@Column(name = "NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String value) {
		this.name = value;
	}

	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer value) {
		this.status = value;
	}

	@Column(name = "DEPT_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getDeptId() {
		return this.deptId;
	}

	public void setDeptId(java.lang.String value) {
		this.deptId = value;
	}

	@Column(name = "ORG_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getOrgId() {
		return this.orgId;
	}

	public void setOrgId(java.lang.String value) {
		this.orgId = value;
	}

	@Column(name = "EMP_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getEmpId() {
		return this.empId;
	}

	public void setEmpId(java.lang.String value) {
		this.empId = value;
	}

	@Column(name = "PHONENUMBER", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(java.lang.String value) {
		this.phonenumber = value;
	}

	@Column(name = "ROLE_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(java.lang.String value) {
		this.roleId = value;
	}

	private Set rightsMappings = new HashSet(0);

	public void setRightsMappings(Set<RightsMapping> rightsMapping) {
		this.rightsMappings = rightsMapping;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "rightsUser")
	public Set<RightsMapping> getRightsMappings() {
		return rightsMappings;
	}

	private Set sysDisasterIcons = new HashSet(0);

	public void setSysDisasterIcons(Set<SysDisasterIcon> sysDisasterIcon) {
		this.sysDisasterIcons = sysDisasterIcon;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "rightsUser")
	public Set<SysDisasterIcon> getSysDisasterIcons() {
		return sysDisasterIcons;
	}

	private RightsRole rightsRole;

	public void setRightsRole(RightsRole rightsRole) {
		this.rightsRole = rightsRole;
	}

	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({ @JoinColumn(name = "ROLE_ID", nullable = false, insertable = false, updatable = false) })
	public RightsRole getRightsRole() {
		return rightsRole;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("Id", getId()).append("Username", getUsername())
				.append("Password", getPassword()).append("Name", getName())
				.append("Status", getStatus()).append("DeptId", getDeptId())
				.append("OrgId", getOrgId()).append("EmpId", getEmpId())
				.append("Phonenumber", getPhonenumber())
				.append("RoleId", getRoleId()).toString();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	public boolean equals(Object obj) {
		if (obj instanceof RightsUser == false)
			return false;
		if (this == obj)
			return true;
		RightsUser other = (RightsUser) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}
}
