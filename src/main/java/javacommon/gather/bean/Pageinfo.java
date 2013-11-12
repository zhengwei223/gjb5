package javacommon.gather.bean;

import java.util.Date;

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
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.hibernate.annotations.GenericGenerator;

import cn.org.rapid_framework.util.DateConvertUtils;

@Entity
@Table(name = "PAGEINFO")
public class Pageinfo extends BaseEntity implements java.io.Serializable {
	private static final long serialVersionUID = 5454155825314635342L;

	// alias
	public static final String TABLE_ALIAS = "采集内容";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_TITLE = "标题";
	public static final String ALIAS_LINK = "链接";
	public static final String ALIAS_TIMELINE = "发布时间";
	public static final String ALIAS_CONTENT = "内容";
	public static final String ALIAS_AUTHOR = "作者";
	public static final String ALIAS_SOURCE = "来源";
	public static final String ALIAS_SUMMARY = "概要";
	public static final String ALIAS_SITE_ID = "采集站点";
	public static final String ALIAS_OPTIME = "采集时间";

	//date formats
		public static final String FORMAT_TIMELINE = DATE_TIME_FORMAT;
		//date formats
		public static final String FORMAT_OPTIME = DATE_TIME_FORMAT;
		
	// columns START
	/**
	 * id db_column: ID
	 */
	private java.lang.String id;
	/**
	 * 标题 db_column: TITLE
	 */
	private java.lang.String title;
	/**
	 * 链接 db_column: LINK
	 */
	private java.lang.String link;
	/**
	 * 时间 db_column: TIMELINE
	 */
	private Date timeline;
	/**
	 * 内容 db_column: CONTENT
	 */
	private java.lang.String content;
	/**
	 * 作者 db_column: AUTHOR
	 */
	private java.lang.String author;
	/**
	 * 来源 db_column: SOURCE
	 */
	private java.lang.String source;
	/**
	 * 概要 db_column: SUMMARY
	 */
	private java.lang.String summary;
	/**
	 * 采集站点 db_column: SITE_ID
	 */
	private java.lang.String siteId;

	/**
     * 采集时间       db_column: OPTIME 
     */ 	
	private java.util.Date optime = new Date();
	// columns END

	public Pageinfo() {
	}

	public Pageinfo(java.lang.String id) {
		this.id = id;
	}

	public Pageinfo(String href, String title) {
		this.link = href;
		this.title = title;
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

	@Column(name = "TITLE", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getTitle() {
		return this.title;
	}

	public void setTitle(java.lang.String value) {
		this.title = value;
	}

	@Column(name = "LINK", unique = false, nullable = true, insertable = true, updatable = true, length = 255)
	public java.lang.String getLink() {
		return this.link;
	}

	public void setLink(java.lang.String value) {
		this.link = value;
	}

	@Column(name = "TIMELINE", unique = false, nullable = true, insertable = true, updatable = true)
	public Date getTimeline() {
		return this.timeline;
	}

	public void setTimeline(Date value) {
		this.timeline = value;
	}

	@Column(name = "CONTENT", unique = false, nullable = true, insertable = true, updatable = true)
	public java.lang.String getContent() {
		return this.content;
	}

	public void setContent(java.lang.String value) {
		this.content = value;
	}

	@Column(name = "AUTHOR", unique = false, nullable = true, insertable = true, updatable = true)
	public java.lang.String getAuthor() {
		return this.author;
	}

	public void setAuthor(java.lang.String value) {
		this.author = value;
	}

	@Column(name = "SOURCE", unique = false, nullable = true, insertable = true, updatable = true)
	public java.lang.String getSource() {
		return this.source;
	}

	public void setSource(java.lang.String value) {
		this.source = value;
	}

	@Column(name = "SUMMARY", unique = false, nullable = true, insertable = true, updatable = true)
	public java.lang.String getSummary() {
		return this.summary;
	}

	public void setSummary(java.lang.String value) {
		this.summary = value;
	}

	@Column(name = "SITE_ID", unique = false, nullable = true, insertable = true, updatable = true)
	public java.lang.String getSiteId() {
		return this.siteId;
	}

	public void setSiteId(java.lang.String value) {
		this.siteId = value;
	}

	@Transient
	public String getOptimeString() {
		return DateConvertUtils.format(getOptime(), DATE_TIME_FORMAT);
	}
	public void setOptimeString(String value) {
		setOptime(DateConvertUtils.parse(value, DATE_TIME_FORMAT,java.util.Date.class));
	}
	
	@Column(name = "OPTIME", unique = false, nullable = true, insertable = true, updatable = true, length = 7)
	public java.util.Date getOptime() {
		return this.optime;
	}
	
	public void setOptime(java.util.Date value) {
		this.optime = value;
	}

	private GrabageSiteconfig grabageSiteconfig;

	public void setGrabageSiteconfig(GrabageSiteconfig grabageSiteconfig) {
		this.grabageSiteconfig = grabageSiteconfig;
	}

	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	@JoinColumns({ @JoinColumn(name = "SITE_ID", nullable = false, insertable = false, updatable = false) })
	public GrabageSiteconfig getGrabageSiteconfig() {
		return grabageSiteconfig;
	}

	public String toString() {
		return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
				.append("Id", getId()).append("Title", getTitle())
				.append("Link", getLink()).append("Timeline", getTimeline())
				.append("Content", getContent()).append("Author", getAuthor())
				.append("Source", getSource()).append("Summary", getSummary())
				.append("SiteId", getSiteId()).toString();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	public boolean equals(Object obj) {
		if (obj instanceof Pageinfo == false)
			return false;
		if (this == obj)
			return true;
		Pageinfo other = (Pageinfo) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}
}
