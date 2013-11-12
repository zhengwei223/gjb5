package com.bm.gjb5.system;

import java.io.File;
import java.io.IOException;

public class DataUtils {
	/**
	 * 数据基准路径，如e:/gjb5data
	 */
	private static String dataBasePath;
	/**
	 * 虚拟路径，如/gjb5data
	 */
	private static String virtualPath;
	/**
	 * 原始数据目录，如e:/gjb5data/original
	 */
	public static File ORIGINAL_DIR;
	/**
	 * 获取数据基准路径如e:/gjb5data
	 * @return
	 */
	public static String getDataBasePath() {
		return dataBasePath;
	}
	public static String getVirtualPath() {
		return virtualPath;
	}
	public void setVirtualPath(String virtualPath) {
		DataUtils.virtualPath = virtualPath;
	}
	public void setDataBasePath(String dataBasePath) {
		if (DataUtils.dataBasePath==null) {
			DataUtils.dataBasePath = dataBasePath;
			ORIGINAL_DIR = new File(dataBasePath, "original");
			if(!ORIGINAL_DIR.exists())
				ORIGINAL_DIR.mkdir();
		}
	}
	
	/**
	 * 地震事件的数据目录
	 * @param eventId 地震事件序列号
	 * @return
	 */
	public static File getEqOriginalDir(String eventId){
		File file =  new File(ORIGINAL_DIR,eventId);
		if (!file.exists()) {
		file.mkdir();	
		}
		return file;
	}
	/**
	 * 获取原始数据文件路径
	 * @param eventId 地震序列
	 * @param fileName 文件名
	 * @return
	 * @throws IOException
	 */
	public static File getOriginalFile(String eventId,String fileName) throws IOException{
		File file =  new File(getEqOriginalDir(eventId),fileName);
		if (!file.exists()) {
			file.createNewFile();
		}
		return file;
	}
	public static void main(String[] args) {
		
	}
}
