package com.bm.gjb5.vo.query;

import java.io.Serializable;

import javacommon.base.BaseQuery;
public class PageinfoQuery extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    


	/** 时间 */
	private java.util.Date timelineBegin;
	private java.util.Date timelineEnd;

	/** 采集时间 */
	private java.util.Date optimeBegin;
	private java.util.Date optimeEnd;

	private String keyWords;

	public java.util.Date getTimelineBegin() {
		return timelineBegin;
	}

	public void setTimelineBegin(java.util.Date timelineBegin) {
		this.timelineBegin = timelineBegin;
	}

	public java.util.Date getTimelineEnd() {
		return timelineEnd;
	}

	public void setTimelineEnd(java.util.Date timelineEnd) {
		this.timelineEnd = timelineEnd;
	}

	public java.util.Date getOptimeBegin() {
		return optimeBegin;
	}

	public void setOptimeBegin(java.util.Date optimeBegin) {
		this.optimeBegin = optimeBegin;
	}

	public java.util.Date getOptimeEnd() {
		return optimeEnd;
	}

	public void setOptimeEnd(java.util.Date optimeEnd) {
		this.optimeEnd = optimeEnd;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}

