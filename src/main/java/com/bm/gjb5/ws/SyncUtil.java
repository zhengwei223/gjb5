package com.bm.gjb5.ws;

import javacommon.ws.cxf.DynamicClient;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;

/**
 * 与B7同步用户信息的工具
 * 
 * @author zhengwei lastmodified 2013年9月10日
 * 
 */
public class SyncUtil {
	private static final String URL = DictUtil.getDictValue("ws地址", "用户组织同步", "1");
	private static final String APPID =AppProperties.getProperty("APPID");
	/**
	 * 用户信息的增量同步
	 * 
	 * @return 同步信息
	 * @throws Exception
	 */
	public String incrSynUserInfo() throws Exception {
		int synType = 0;
		String method = "synUserInfo";
		String result = (String) DynamicClient.invoke(URL, method, APPID,
				new Integer(synType))[0];

		int type = 0;
		method = "synCommit";

		DynamicClient.invoke(URL, method, APPID, synType);
		return result;
	}

	/**
	 * 用户信息的全量同步
	 * 
	 * @return 同步信息
	 * @throws Exception 
	 */
	public static String fullSynUserInfo() throws Exception {
		int synType = 1;
		String method = "synUserInfo";
		String result = (String) DynamicClient.invoke(URL, method, APPID,
				synType)[0];
		return result;
	}

	/**
	 * 组织信息的增量同步
	 * 
	 * @return 同步信息
	 * @throws Exception 
	 */
	public String incrSynOrgInfo() throws Exception {
		int synType = 0;
		String method = "synOrgInfo";
		String result = (String) DynamicClient.invoke(URL, method, APPID,
				synType)[0];
		
		int type = 1;
		method = "synCommit";
		DynamicClient.invoke(URL, method, APPID,
				synType);
		return result;
	}

	/**
	 * 组织信息的全量同步
	 * 
	 * @return 同步信息
	 * @throws Exception 
	 */
	public String fullSynOrgInfo() throws Exception {
		int synType = 1;
		String method = "synOrgInfo";
		String result = (String) DynamicClient.invoke(URL, method, APPID,
				synType)[0];
		return result;
	}

	/**
	 * 人员组织关系信息的增量同步
	 * 
	 * @return 同步信息
	 * @throws Exception 
	 */
	public String incrSynRelationInfo() throws Exception {
		int synType = 0;
		String method = "synRelationInfo";
		String result = (String) DynamicClient.invoke(URL, method, APPID,
				synType)[0];
		int type = 2;
		method = "synCommit";
		DynamicClient.invoke(URL, method, APPID,
				synType);
		return result;
	}

	/**
	 * 人员组织关系信息的全量同步
	 * 
	 * @return 同步信息
	 * @throws Exception 
	 */
	public String fullSynRelationInfo() throws Exception {
		int synType = 1;
		String method = "synRelationInfo";
		String result = (String) DynamicClient.invoke(URL, method, APPID,
				synType)[0];
		return result;
	}

	
}
