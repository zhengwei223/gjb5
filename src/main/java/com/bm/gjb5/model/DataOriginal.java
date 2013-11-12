package com.bm.gjb5.model;

import java.io.File;
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
import javax.persistence.Transient;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.GenericGenerator;

import com.bm.gjb5.service.SysEarthquakeManager;

import cn.org.rapid_framework.util.DateConvertUtils;
import cn.org.rapid_framework.util.FileSizeUtils;
import cn.org.rapid_framework.util.holder.ApplicationContextHolder;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

@Entity
@Table(name = "DATA_ORIGINAL")
public class DataOriginal extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "原始数据";
	public static final String ALIAS_ID = "ID";
	public static final String ALIAS_FORM = "格式";
	public static final String ALIAS_REMOTE_URL = "地址";
	public static final String ALIAS_NOTICE_TIME = "提供时间";
	public static final String ALIAS_COLL_TIME = "汇集时间";
	public static final String ALIAS_LOCALE_URL = "本地地址";
	public static final String ALIAS_LOCALE_FMT_URL = "本地地址2";
	public static final String ALIAS_FILENAME = "文件名";
	public static final String ALIAS_FMT_FNAME = "文件名2";
	public static final String ALIAS_FILE_SIZE = "文件大小";
	public static final String ALIAS_STATUS = "状态";
	public static final String ALIAS_BATCH = "批次";
	public static final String ALIAS_JOB_ID = "系统任务";
	public static final String ALIAS_ORIGINAL_TYPE_NAME = "数据来源";
	public static final String ALIAS_EQ = "地震序列";
	// date formats
	public static final String FORMAT_NOTICE_TIME = DATE_FORMAT;
	public static final String FORMAT_COLL_TIME = DATE_FORMAT;

	// columns START
	/**
	 * id db_column: ID
	 */
	private java.lang.String id;
	/**
	 * form db_column: FORM
	 */
	private java.lang.String form;
	/**
	 * remoteUrl db_column: REMOTE_URL
	 */
	private java.lang.String remoteUrl;
	/**
	 * noticeTime db_column: NOTICE_TIME
	 */

	private java.util.Date noticeTime;
	/**
	 * collTime db_column: COLL_TIME
	 */

	private java.util.Date collTime;
	/**
	 * localeUrl db_column: LOCALE_URL
	 */
	private java.lang.String localeUrl;
	/**
	 * 本地格式化后路径(如果格式不对,我们要转码) db_column: LOCALE_FMT_URL
	 */
	private java.lang.String localeFmtUrl;
	/**
	 * filename db_column: FILENAME
	 */

	private java.lang.String filename;
	/**
	 * fmtFname db_column: FMT_FNAME
	 */

	private java.lang.String fmtFname;
	/**
	 * fileSize db_column: FILE_SIZE
	 */

	private Long fileSize;
	/**
	 * 0：新建 1：已识别 2：识别失败 status db_column: STATUS
	 */
	private Integer status;
	/**
	 * batch db_column: BATCH
	 */
	private Integer batch;
	/**
	 * jobId db_column: JOB_ID
	 */

	private java.lang.String jobId;

	private String eventId;
	private String originalName;

	// columns END

	public DataOriginal() {
	}

	public DataOriginal(java.lang.String id) {
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

	@Column(name = "FORM", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public java.lang.String getForm() {
		return this.form;
	}

	public void setForm(java.lang.String value) {
		this.form = value;
	}

	@Column(name = "REMOTE_URL", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getRemoteUrl() {
		return this.remoteUrl;
	}

	public void setRemoteUrl(java.lang.String value) {
		this.remoteUrl = value;
	}

	@Transient
	public String getNoticeTimeString() {
		return DateConvertUtils.format(getNoticeTime(), FORMAT_NOTICE_TIME);
	}

	public void setNoticeTimeString(String value) {
		setNoticeTime(DateConvertUtils.parse(value, FORMAT_NOTICE_TIME,
				java.util.Date.class));
	}

	@Column(name = "NOTICE_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getNoticeTime() {
		return this.noticeTime;
	}

	public void setNoticeTime(java.util.Date value) {
		this.noticeTime = value;
	}

	@Transient
	public String getCollTimeString() {
		return DateConvertUtils.format(getCollTime(), FORMAT_COLL_TIME);
	}

	public void setCollTimeString(String value) {
		setCollTime(DateConvertUtils.parse(value, FORMAT_COLL_TIME,
				java.util.Date.class));
	}

	@Column(name = "COLL_TIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getCollTime() {
		return this.collTime;
	}

	public void setCollTime(java.util.Date value) {
		this.collTime = value;
	}

	@Column(name = "LOCALE_URL", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getLocaleUrl() {
		return this.localeUrl;
	}

	public void setLocaleUrl(java.lang.String value) {
		this.localeUrl = value;
	}

	@Column(name = "LOCALE_FMT_URL", unique = false, nullable = true, insertable = true, updatable = true, length = 100)
	public java.lang.String getLocaleFmtUrl() {
		return this.localeFmtUrl;
	}

	public void setLocaleFmtUrl(java.lang.String value) {
		this.localeFmtUrl = value;
	}

	@Column(name = "FILENAME", unique = false, nullable = true, insertable = true, updatable = true, length = 50)
	public java.lang.String getFilename() {
		return this.filename;
	}

	public void setFilename(java.lang.String value) {
		this.filename = value;
	}

	@Column(name = "FMT_FNAME", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.lang.String getFmtFname() {
		return this.fmtFname;
	}

	public void setFmtFname(java.lang.String value) {
		this.fmtFname = value;
	}

	@Column(name = "FILE_SIZE", unique = false, nullable = true, insertable = true, updatable = true, length = 20)
	public Long getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(Long value) {
		this.fileSize = value;
	}

	@Column(name = "STATUS", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer value) {
		this.status = value;
	}

	@Column(name = "BATCH", unique = false, nullable = true, insertable = true, updatable = true, length = 3)
	public Integer getBatch() {
		return this.batch;
	}

	public void setBatch(Integer value) {
		this.batch = value;
	}

	@Column(name = "JOB_ID", unique = false, nullable = true, insertable = true, updatable = true, length = 32)
	public java.lang.String getJobId() {
		return this.jobId;
	}

	public void setJobId(java.lang.String value) {
		this.jobId = value;
	}

	private Set dataIdentifys = new HashSet(0);

	public void setDataIdentifys(Set<DataIdentify> dataIdentify) {
		this.dataIdentifys = dataIdentify;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "dataOriginal")
	public Set<DataIdentify> getDataIdentifys() {
		return dataIdentifys;
	}

	private SysJob sysJob;

	public void setSysJob(SysJob sysJob) {
		this.sysJob = sysJob;
	}

	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({ @JoinColumn(name = "JOB_ID", nullable = false, insertable = false, updatable = false) })
	public SysJob getSysJob() {
		return sysJob;
	}

	public String getEventId() {
		if (eventId == null)
			return sysJob.getSysEarthquake().getEventId();
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getOriginalName() {
		if (originalName == null)
			return sysJob.getSysOriginType().getName();
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	private String eqinfo;

	public void setEqinfo(String eqinfo) {
		this.eqinfo = eqinfo;
	}

	@Transient
	public String getEqinfo() {
		SysEarthquakeManager syseqManager = (SysEarthquakeManager) ApplicationContextHolder
				.getBean("sysEarthquakeManager");
		SysEarthquake earthquake = syseqManager.getById(getEventId());
		return earthquake.getLocation() + "(" + earthquake.getEventTimeString()
				+ ")";
	}

	@Transient
	public String getFileSizeString() {
		return FileSizeUtils.getHumanReadableFileSize(fileSize);
	}

	@Transient
	public boolean getExists() {
		return new File(getLocaleUrl()).exists();
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("Id", getId()).append("Form", getForm())
				.append("RemoteUrl", getRemoteUrl())
				.append("NoticeTime", getNoticeTime())
				.append("CollTime", getCollTime())
				.append("LocaleUrl", getLocaleUrl())
				.append("LocaleFmtUrl", getLocaleFmtUrl())
				.append("Filename", getFilename())
				.append("FmtFname", getFmtFname())
				.append("FileSize", getFileSize())
				.append("Status", getStatus()).append("Batch", getBatch())
				.append("JobId", getJobId()).toString();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	public boolean equals(Object obj) {
		if (obj instanceof DataOriginal == false)
			return false;
		if (this == obj)
			return true;
		DataOriginal other = (DataOriginal) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}
}
