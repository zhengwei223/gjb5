package javacommon.util.db;

import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.util.StringUtils;


public class ConvenientTools {

	/**
	 * 
	 * @return 随机数
	 */
	public static String getRand() {

		Random random = new Random();
		Integer randNumber = random.nextInt();
		randNumber = Math.abs(randNumber);
		String result = Integer.toString(randNumber).substring(0, 4);
		// System.out.println(result);
		return result;
	}

	/**
	 * 
	 * @param sql
	 *            只能查两个字段，第一个字段代表下拉列表中的值，第二个代表显示的内容
	 * @param focus
	 *            焦点 即当前值
	 * @return 带焦点的下拉列表
	 */
	public static String getOption(String sql, String focus) {
		String option = "";
		ResultSet rs = DbUtil.exeQuery(sql);
		try {
			while (rs != null && rs.next()) {
				String value = rs.getString(1);// 值
				String show = rs.getString(2);// 名称
				String selected = "";
				if (StringUtils.hasLength(focus)
						&& focus.trim().equals(value.trim()))
					selected = "selected";
				option += "<option value='" + value + "'" + selected + ">"
						+ show + "</option>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return option;

	}

	public static Map<String, String> getMap(String sql, Object... params) {
		String option = "";
		ResultSet rs = DbUtil.exeQuery(sql, params);
		Map<String, String> map = new HashMap<String, String>();
		try {
			while (rs != null && rs.next()) {
				String value = rs.getString(1);// 值
				String show = rs.getString(2);// 名称
				map.put(value, show);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;

	}
	public static Map<String, String> getMaps(String sql) {
		String option = "";
		ResultSet rs = DbUtil.exeQuery(sql);
		Map<String, String> map = new HashMap<String, String>();
		try {
			while (rs != null && rs.next()) {
				String value = rs.getString(1);// 值
				String show = rs.getString(2);// 名称
				map.put(value, show);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;

	}
public static List<String> getLists(String sql){
	String option = "";
	ResultSet rs = DbUtil.exeQuery(sql);
	List<String> list = new ArrayList<String>();
	try {
		while (rs != null && rs.next()) {
			String value = rs.getString(1);// 值
			list.add(value);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
}
	/**
	 * 
	 * @param str
	 *            原字符串
	 * @return md5算法加密之后的字符串
	 */
	public static String md5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());

			byte[] b = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < b.length; i++) {
				int v = (int) b[i];
				v = v < 0 ? 0x100 + v : v;
				String cc = Integer.toHexString(v);
				if (cc.length() == 1)
					sb.append('0');
				sb.append(cc);
			}

			return sb.toString();
		} catch (Exception e) {
		}
		return "";
	}

	public static int getSeq(String table, String key, String condition) {
		int seq = 0;
		String sql = "";
		if (!condition.equals(""))
			sql = "select max(" + key + ")  from " + table + " where 1=1 and "
					+ condition;
		else
			sql = "select max(" + key + ")  from " + table;
		System.out.println("sql--------------" + sql);
		ResultSet rs = DbUtil.exeQuery(sql);
		try {
			while (rs.next()) {
				System.out.println("max------------" + rs.getInt(1));
				seq = rs.getInt(1) + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
	}

	public static int getSeq(String table) {
		int seq = 1;
		String sql = "select max(id)  from " + table;
		ResultSet rs = DbUtil.exeQuery(sql);
		try {
			while (rs.next()) {
				seq += rs.getInt(1) + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seq;
	}

	/**
	 * 获取属性结构中的新id
	 * 
	 * @param pid
	 *            父级id
	 * @return
	 */
	public synchronized static int getTreeSeq(int pid) {
		int seq = -100;
		// String sql = "select top 1 id,pid from sys_tree where  pid='" + pid
		// + "' order by id desc";
		String sql = "select * from (select id,parent_id from rights_resource where  parent_id=? order by id desc) where rownum<2";
		ResultSet rs = DbUtil.exeQuery(sql, pid);
		try {
			if (rs.next()) {// 父节点已有子节点，最后子节点id+1得新节点id
				seq = rs.getInt("id") + 1;// 增1
			} else {// 父节点还没有子节点
				if (pid == 0) {// 父节点为根节点
					seq = 1;
				} else {
					seq = Integer.valueOf(pid + "001");
				}
			}

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return seq;
	}

	/***
	 * 通过条件取值
	 * 
	 * @param col
	 *            String 需要得到数据的列 例如：pwd
	 * @param table
	 *            String 表名 例如：user（表）
	 * @param condition
	 *            String 条件 例如：name='zhengwei'
	 * 
	 *            效果相当于：select pwd from user where name='zhengwei'
	 * **/
	public static String getValueByCond(String col, String table,
			String condition, Object... params) {
		String sql = "select " + col + " from " + table + " where " + condition;
		// System.out.println("sql in Db_getValue......."+sql);
		ResultSet rs = DbUtil.exeQuery(sql, params);
		String result = "";
		try {
			if (rs != null && rs.next()) {
				result = rs.getString(1);
			} else {
				result = "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String[] getValueByCond(String[] col, String table,
			String condition) {
		String cols = "";
		for (String s : col) {
			cols += s + ",";
		}
		cols = cols.substring(0, cols.lastIndexOf(","));
		String sql = "select " + cols + " from " + table + " where "
				+ condition;
		System.out.println("sql in Db_getValue......." + sql);
		ResultSet rs = DbUtil.exeQuery(sql);
		String[] result = new String[col.length];
		try {
			if (rs != null && rs.next()) {
				for (int i = 0; i < col.length; i++) {
					result[i] = rs.getString(i + 1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(getMap("select id,username from rights_user"));
	}
}