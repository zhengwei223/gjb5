package com.bm.gjb5.system;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.persister.entity.SingleTableEntityPersister;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

import cn.org.rapid_framework.util.holder.ApplicationContextHolder;
import javacommon.util.db.ConvenientTools;

/**
 * 通用码表存取工具<br>
 * OGNL使用示例 
 * %{@com.bm.gjb5.system.DictUtil@getDictMap("rights_user","status")}
 * %{@com.bm.gjb5.system.DictUtil@getDictValue("rights_user","status","1")}
 * @author zhengwei lastmodified 2013-8-11
 *
 */
public class DictUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(DictUtil.class);
	private static Map<String, Map> caches = new HashMap<String, Map>();
	private static Properties subModules = new Properties();
	private static List<String> tables = new ArrayList<String>();
	static{
		/*加载模块标识-模块名映射*/
		try {
			subModules.load(new ClassPathResource("submodules.properties", DictUtil.class).getInputStream());
			SessionFactory sessionFactory = (SessionFactory) ApplicationContextHolder.getBean("sessionFactory");
			Map<String, ClassMetadata> collMetaMap = sessionFactory.getAllClassMetadata();
			for (String name : collMetaMap.keySet()) {
				SingleTableEntityPersister step = (SingleTableEntityPersister) collMetaMap.get(name);
				tables.add(step.getTableName());
			}
			
		} catch (IOException e) {
			LOGGER.error("加载资源出错", e);
		}
	}

	public static Properties getSubModules() {
		return subModules;
	}
	public static String getSubModuleName(String moduleId) {
		return subModules.getProperty(moduleId);
	}
	/**角色id-name映射**/
	public static Map getRoleIdNameMap(){
		return ConvenientTools.getMap("select id,name from rights_role");
	}
	/**获得用户状态**/
	public static Map getUserStatus(){
		return getDictMap("rights_user", "status");
	}
	/**
	 * 根据表名和字段名，获取码表Map
	 * @param tableName 表名
	 * @param fieldName 字段名
	 * @return
	 */
	public static Map getDictMap(String tableName,String fieldName){
		String key = getKey(tableName, fieldName);
		Map map = caches.get(key);
		if(null==map){
			map = ConvenientTools.getMap("select FIELD_VALUE,TEXT from common_dict where upper(TABLE_NAME)=? and upper(FIELD_NAME)=?",tableName.toUpperCase(),fieldName.toUpperCase());
			caches.put(key, map);
		}
		return map;
	}
	/**
	 * 根据键码获得值
	 * @param tableName
	 * @param fieldName
	 * @param field_value
	 * @return
	 */
	public static String getDictValue(String tableName,String fieldName,String field_value){
		return (String) getDictMap(tableName, fieldName).get(field_value);
	}
	
	
	private static String getKey(String tableName,String fieldName){
		return tableName+"_"+fieldName;
	}
	public static void main(String[] args) {
		System.out.println(getUserStatus());
	}
	/**
	 * 刷新缓存
	 * @param tableName
	 * @param fieldName
	 */
	public static void refresh(String tableName, String fieldName) {
		String key = getKey(tableName, fieldName);
		Map map = caches.get(key);
		if(null==map){
			map = ConvenientTools.getMap("select FIELD_VALUE,TEXT from common_dict where TABLE_NAME=? and FIELD_NAME=?",tableName,fieldName);
			caches.put(key, map);
		}else {
			map.putAll(ConvenientTools.getMap("select FIELD_VALUE,TEXT from common_dict where TABLE_NAME=? and FIELD_NAME=?",tableName,fieldName));
		}
	}
	public static List<String> getTables() {
		return tables;
	}
}
