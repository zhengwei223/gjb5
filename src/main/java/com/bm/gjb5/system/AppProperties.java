package com.bm.gjb5.system;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class AppProperties {
	private AppProperties(){}
	private static Properties appProperties;
	public void setAppProperties(Properties appProperties) {
		this.appProperties = appProperties;
	}
	/**
	 * 判断对指定的表的操作是否记录日志
	 * @param table_name
	 * @return
	 */
	public static boolean isKeyTable(String table_name){
		if(table_name==null){
			return false;
		}
		if(table_name.startsWith("log_")||table_name.startsWith("LOG_")){
			return false;
		}
		for (int i = 0; i < getExcludeTables().length; i++) {
			if(table_name.equalsIgnoreCase(getExcludeTables()[i])){
				return false;
			}
			
		}
		return true;
	}
	

	private static String[] excludeTables;
	private static String[] getExcludeTables() {
		if(excludeTables==null)
			excludeTables=appProperties.getProperty("excludeTableNames").split(",");
		return excludeTables;
	}
	private static List<String> imgFormatList;
	/**
	 * 系统支持的图片类型
	 * @return
	 */
	public static List<String> getImgFormatList() {
		if (imgFormatList==null) {
			imgFormatList =Arrays.asList(appProperties.getProperty("imgFormats").split(","));
		}
		return imgFormatList;
	}
	private static List<String> audioFormatList;
	/**
	 * 系统支持的音频类型
	 * @return
	 */
	public static List<String> getAudioFormatList() {
		if (audioFormatList==null) {
			audioFormatList =Arrays.asList(appProperties.getProperty("audioFormats").split(","));
		}
		return audioFormatList;
	}
	private static List<String> docFormatList;
	/**
	 * 
	 * @return 系统支持的文档类型
	 */
	public static List<String> getDocFormatList() {
		if (docFormatList==null) {
			docFormatList =Arrays.asList(appProperties.getProperty("docFormats").split(","));
		}
		return docFormatList;
	}
	private static List<String> vedioFormatList;
	/**
	 * 
	 * @return 系统支持的视频类型
	 */
	public static List<String> getVedioFormatList() {
		if (vedioFormatList==null) {
			vedioFormatList =Arrays.asList(appProperties.getProperty("vedioFormats").split(","));
		}
		return vedioFormatList;
	}
	/**
	 * 
	 * @return 支持的所有可上传类型
	 */
	public static List<String> getAllFormats(){
		List<String> allList = new ArrayList<String>();
		allList.addAll(getImgFormatList());
		allList.addAll(getVedioFormatList());
		allList.addAll(getDocFormatList());
		allList.addAll(getAudioFormatList());
		return allList;
	}
	public static String getAppName(){
		try {
			return appProperties.getProperty("appName");
		} catch (Exception e) {
			return "GJB5";
		}
	}
	private static Map<Integer, String> orders = new HashMap<Integer, String>();
	static{
		orders.put(1, "快速评估");
		orders.put(2, "辅助决策");
		orders.put(3, "语音短信平台");
		orders.put(4, "灾情收集");
		orders.put(5, "专家协同");
		orders.put(6, "专业协同");
		orders.put(7, "动态评估");
	}
	public static Map<Integer, String> getOrders() {
		return orders;
	}
	public static String getProperty(String key) {
		return appProperties.getProperty(key);
	}
}
