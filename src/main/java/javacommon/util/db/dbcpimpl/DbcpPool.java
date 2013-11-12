package javacommon.util.db.dbcpimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javacommon.util.db.Config;
import javacommon.util.db.DbPool;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

import cn.org.rapid_framework.util.holder.ApplicationContextHolder;

/**
 * 保持独立的数据库连接池，不要和spring混杂，方便测试，以及保利另外一条操作数据库的通路
 * @author zhengwei lastmodified 2013年9月14日
 *
 */
public class DbcpPool implements DbPool {
	private Config config = Dbcp_Orcl_Config.newInstance();
	private static DbPool pool = new DbcpPool();
	private static DataSource ds;

	public static DbPool newInstance() {
		return pool;
	}

	public Connection createConnection() throws SQLException {
		if(ds==null)
			getDataSource();
		return ds.getConnection();
	}

	public DataSource getDataSource() {
		if(ds==null){
			BasicDataSource ds1 = new BasicDataSource();
			ds1.setDriverClassName(this.config.getDriverName());
			ds1.setUsername(this.config.getUser());
			ds1.setPassword(this.config.getPwd());
			ds1.setUrl(this.config.getUrl());
			ds1.setMaxActive(this.config.getMaxActive());
			ds1.setMaxIdle(this.config.getMaxIde());
			ds1.setMaxWait(this.config.getMaxWait());
			ds=ds1;
		}
		return ds;

	}
}
