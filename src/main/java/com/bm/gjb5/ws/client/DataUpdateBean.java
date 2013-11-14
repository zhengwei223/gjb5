package com.bm.gjb5.ws.client;

public class DataUpdateBean {
	/**
	 * 
	 * @param pkId
	 *            对应分包数据库的记录id
	 * @param earthquakeId
	 *            地震灾害的唯一标示
	 * @param dataName
	 *            数据名称
	 * @param dataType
	 *            数据类型
	 * @param dataPath
	 *            路径
	 * @param important
	 *            重要程度 重要级别 1级非常重要 2级比较重要 3级普通 4级不重要
	 * @param disasterSite
	 *            如果是现场图片，指图图片拍摄的地点，如果是一些评估图等，灾情地点可能是整个灾区的范围
	 * @param keyword
	 *            关键字
	 * @param describe
	 *            内容的描述
	 * @param getTime
	 *            图片和文件生成的时间
	 * @param creator
	 *            数据生产包名
	 * @param dateColType
	 * @param expert
	 *            负责生产数据的业务用户
	 * @param organization
	 *            31个省、台网中心和8所之一
	 */
	private String pkId;
	private String earthquakeId;
	private String dataName;
	private String dataType;
	private String dataPath;
	private String important;
	private String disasterSite;
	private String keyword;
	private String describe;
	private String getTime;
	private String creator;
	private String dateColType;
	private String expert;
	private String organization;
	public DataUpdateBean() {
	}
	
	public DataUpdateBean(String pkId, String earthquakeId, String dataName, String dataType, String dataPath, String important, String disasterSite,
			String keyword, String describe, String getTime, String creator, String dateColType, String expert, String organization) {
		super();
		this.pkId = pkId;
		this.earthquakeId = earthquakeId;
		this.dataName = dataName;
		this.dataType = dataType;
		this.dataPath = dataPath;
		this.important = important;
		this.disasterSite = disasterSite;
		this.keyword = keyword;
		this.describe = describe;
		this.getTime = getTime;
		this.creator = creator;
		this.dateColType = dateColType;
		this.expert = expert;
		this.organization = organization;
	}

	public String getPkId() {
		return pkId;
	}
	public void setPkId(String pkId) {
		this.pkId = pkId;
	}
	public String getEarthquakeId() {
		return earthquakeId;
	}
	public void setEarthquakeId(String earthquakeId) {
		this.earthquakeId = earthquakeId;
	}
	public String getDataName() {
		return dataName;
	}
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getDataPath() {
		return dataPath;
	}
	public void setDataPath(String dataPath) {
		this.dataPath = dataPath;
	}
	public String getImportant() {
		return important;
	}
	public void setImportant(String important) {
		this.important = important;
	}
	public String getDisasterSite() {
		return disasterSite;
	}
	public void setDisasterSite(String disasterSite) {
		this.disasterSite = disasterSite;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getGetTime() {
		return getTime;
	}
	public void setGetTime(String getTime) {
		this.getTime = getTime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getDateColType() {
		return dateColType;
	}
	public void setDateColType(String dateColType) {
		this.dateColType = dateColType;
	}
	public String getExpert() {
		return expert;
	}
	public void setExpert(String expert) {
		this.expert = expert;
	}
	public String getOrganization() {
		return organization;
	}
	public void setOrganization(String organization) {
		this.organization = organization;
	}

}
