package com.bm.gjb5.model;

import java.util.HashSet;
import java.util.Set;

import javacommon.base.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Entity
@Table(name = "RIGHTS_RESOURCE")
public class RightsResource extends BaseEntity implements java.io.Serializable,Comparable<RightsResource> {
	public static final String ALIAS_DESCP = "descp";

	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "name";
	public static final String ALIAS_PARENT_ID = "父级菜单ID";
	public static final String ALIAS_RSC_LEVEL = "rscLevel";
	public static final String ALIAS_SERIAL_NO = "排序";
	public static final String ALIAS_URL = "url";
	
	private static final long serialVersionUID = 5454155825314635342L;
	// alias
	public static final String TABLE_ALIAS = "记录系统内资源信息";

	/**
	 * descp db_column: DESCP
	 */
	private java.lang.String descp;

	private boolean drag = true;

	/**
	 * id db_column: ID
	 */
	private int id;

	/**
	 * rscLevel db_column: RSC_LEVEL
	 */

	private Long level;

	/**
	 * name db_column: NAME
	 */
	private java.lang.String name;

	private boolean noRemove;

	private boolean noRename;

	private boolean open = true;

	/**
	 * 父级菜单ID db_column: PARENT_ID
	 */
	private int parentId;

	private Set<RightsMapping> rightsMappings = new HashSet<RightsMapping>(0);

	private RightsResource rightsResource;

	private Set<RightsResource> children = new HashSet<RightsResource>(0);

	/**
	 * 排序 db_column: SERIAL_NO
	 */
	private Integer serialNo=0;

	/**
	 * url db_column: URL
	 */
	private java.lang.String url;

	private boolean checked;
	private boolean chkDisabled;

	public RightsResource() {
	}

	public RightsResource(int id) {
		this.id = id;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "rightsResource")
	public Set<RightsResource> getChildren() {
		return children;
	}

	@Column(name = "DESCP", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getDescp() {
		return this.descp;
	}

	@Id
	/*此id不自动生成*/
	// @GeneratedValue(generator = "custom-id")
	// @GenericGenerator(name = "custom-id", strategy = "uuid")
	@Column(name = "ID", unique = true, nullable = false, insertable = true, updatable = true, length = 32)
	public int getId() {
		return this.id;
	}

	@Column(name = "RSC_LEVEL", unique = false, nullable = true, insertable = true, updatable = true, length = 22)
	public Long getLevel() {
		return this.level;
	}

	@Column(name = "NAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getName() {
		return this.name;
	}

	@Column(name = "PARENT_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public int getParentId() {
		return this.parentId;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "rightsResource")
	public Set<RightsMapping> getRightsMappings() {
		return rightsMappings;
	}

	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({ @JoinColumn(name = "PARENT_ID", nullable = false, insertable = false, updatable = false) })
	public RightsResource getRightsResource() {
		return rightsResource;
	}

	@Column(name = "SERIAL_NO", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getSerialNo() {
		return this.serialNo;
	}

	@Column(name = "URL", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getUrl() {
		return this.url;
	}

	@Transient
	public boolean isDrag() {
		if (id == 0)
			return false;
		return drag;
	}

	@Transient
	public boolean isNoRemove() {
		if (getRightsMappings() != null && getRightsMappings().size() > 0)
			return true;
		if (id == 0)
			return true;
		return noRemove;
	}

	@Transient
	public boolean isNoRename() {
		if (id == 0)
			return true;
		return noRename;
	}

	@Transient
	public boolean isOpen() {
		return open;
	}

	public void setChildren(Set<RightsResource> children) {
		this.children = children;
	}

	public void setDescp(java.lang.String value) {
		this.descp = value;
	}

	public void setDrag(boolean drag) {
		this.drag = drag;
	}

	public void setId(int value) {
		this.id = value;
	}

	public void setLevel(Long value) {
		this.level = value;
	}

	public void setName(java.lang.String value) {
		this.name = value;
	}

	public void setNoRemove(boolean noRemove) {
		this.noRemove = noRemove;
	}

	public void setNoRename(boolean noRename) {
		this.noRename = noRename;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public void setParentId(int value) {
		this.parentId = value;
	}

	public void setRightsMappings(Set<RightsMapping> rightsMapping) {
		this.rightsMappings = rightsMapping;
	}

	public void setRightsResource(RightsResource rightsResource) {
		this.rightsResource = rightsResource;
	}

	public void setSerialNo(Integer value) {
		this.serialNo = value;
	}

	public void setUrl(java.lang.String value) {
		this.url = value;
	}

	@Transient
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	@Transient
	public boolean isChkDisabled() {
		return chkDisabled;
	}

	public void setChkDisabled(boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RightsResource other = (RightsResource) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	//按顺序号排序
	@Override
	public int compareTo(RightsResource o) {
		return this.serialNo-o.serialNo;
	}
	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("Id", getId()).append("Name", getName())
				.append("SerialNo", getSerialNo()).append("Url", getUrl())
				.append("Descp", getDescp()).append("RscLevel", getLevel())
				.append("ParentId", getParentId()).toString();
	}
}
