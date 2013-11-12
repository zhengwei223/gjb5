package javacommon.gather.bean;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
 * 关于采集目标站点的配置
 */
@Entity
@Table(name = "Grabage_SiteConfig")
public class GrabageSiteconfig {
	// alias
	public static final String TABLE_ALIAS = "采集配置";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "名称";
	public static final String ALIAS_ADVERT_PATHS = "广告节点（XPath）";
	public static final String ALIAS_AUTHOR = "作者（XPath）";
	public static final String ALIAS_CONTENT = "内容（XPath）";
	public static final String ALIAS_FORWARD = "网址前缀";
	public static final String ALIAS_LINK = "超链接";
	public static final String ALIAS_PAGECOUNT = "采集页数（XPath）";
	public static final String ALIAS_SOURCE = "来源（XPath）";
	public static final String ALIAS_SPLITPATH = "分页链接（XPath）";
	public static final String ALIAS_SUMMARY = "概要（XPath）";
	public static final String ALIAS_TIMELINE = "发布时间（XPath）";
	public static final String ALIAS_TITLE = "标题（XPath）";
	public static final String ALIAS_USABLE = "是否启用";
	public static final String ALIAS_XLINK = "内容地址集（XPath）";
	public static final String ALIAS_KEYWORD = "关键字";

	private String id;
	private String name;
	/** 原链接 */
	private String link;
	/** 链接前缀 */
	private String forward;
	/** 是否可用 */
	private String usable;
	/** 页面上的超链接 XPath */
	private String xlink;

	/** 需移除的节点的XPath，逗号分隔 */
	private String advertPaths;
	/** 标题 */
	private String title;
	/** 作者 */
	private String author;
	/** 来源 */
	private String source;
	/** 发布时间 */
	private String timeline;
	/** 正文 */
	private String content;
	/** 分页 */
	private String splitpath;
	/** 简介 */
	private String summary;
	/** 采集页数 **/
	private int pagecount;
	/** 关键字 **/
	private String keyword;

	public GrabageSiteconfig() {
	}

	@Id
	@Column(length = 32)
	@GeneratedValue(generator = "custom-id")
	@GenericGenerator(name = "custom-id", strategy = "uuid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getXlink() {
		return xlink;
	}

	public void setXlink(String xlink) {
		this.xlink = xlink;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTimeline() {
		return timeline;
	}

	public void setTimeline(String timeline) {
		this.timeline = timeline;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSplitpath() {
		return splitpath;
	}

	public void setSplitpath(String splitpath) {
		this.splitpath = splitpath;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public String getUsable() {
		return usable;
	}

	public void setUsable(String usable) {
		this.usable = usable;
	}

	@Transient
	public List<String> getAdvert() {
		return Arrays.asList(advertPaths.split(","));
	}

	public boolean hasAdvert() {
		List<String> l =  getAdvert();
		if (l == null || l.isEmpty())
			return false;
		return true;
	}

	@Column(name = "advert_paths")
	public String getAdvertPaths() {
		return advertPaths;
	}

	public void setAdvertPaths(String advert_paths) {
		this.advertPaths = advert_paths;
	}

	public int getPagecount() {
		return pagecount;
	}

	public void setPagecount(int pageCount) {
		this.pagecount = pageCount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Transient
	public List<String> getKeywords() {
		
		try {
			return Arrays.asList(keyword.split(","));
		} catch (Exception e) {
			return null;
		}
	}

	private Set pageinfos = new HashSet(0);
	public void setPageinfos(Set<Pageinfo> pageinfo){
		this.pageinfos = pageinfo;
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "grabageSiteconfig")
	public Set<Pageinfo> getPageinfos() {
		return pageinfos;
	}
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("AdvertPaths",getAdvertPaths())
			.append("Author",getAuthor())
			.append("Content",getContent())
			.append("Forward",getForward())
			.append("Link",getLink())
			.append("Pagecount",getPagecount())
			.append("Source",getSource())
			.append("Splitpath",getSplitpath())
			.append("Summary",getSummary())
			.append("Timeline",getTimeline())
			.append("Title",getTitle())
			.append("Usable",getUsable())
			.append("Xlink",getXlink())
			.append("Keyword",getKeyword())
			.append("Name",getName())
			.toString();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(getId()).toHashCode();
	}

	public boolean equals(Object obj) {
		if (obj instanceof GrabageSiteconfig == false)
			return false;
		if (this == obj)
			return true;
		GrabageSiteconfig other = (GrabageSiteconfig) obj;
		return new EqualsBuilder().append(getId(), other.getId()).isEquals();
	}
}
