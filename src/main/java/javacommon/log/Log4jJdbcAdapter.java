package javacommon.log;

import java.sql.Connection;
import java.sql.SQLException;

import javacommon.util.db.DbUtil;

import org.apache.log4j.jdbc.JDBCAppender;
import org.apache.log4j.spi.LoggingEvent;
/**
 * 重写Log4j的jdbc适配器
 * 主要重写获取和关闭连接的方法
 * @author zhengwei lastmodified 2013年9月5日
 *
 */
public class Log4jJdbcAdapter extends JDBCAppender {
	@Override
	protected Connection getConnection() throws SQLException {
		return DbUtil.getConnection();
	}
	@Override
	protected void closeConnection(Connection con) {
		DbUtil.freeConnection(con);
	}
	@Override
	public void close() {
		flushBuffer();
	    this.closed = true;
	}
	@Override
	protected String getLogStatement(LoggingEvent event) {
//		return super.getLogStatement(event);
		 StringBuffer sbuf=new StringBuffer();
	        sbuf.append(layout.format(event)); 
	        if (layout.ignoresThrowable()) {
	            sbuf.delete(sbuf.length()-2,sbuf.length() );
	            String[] s = event.getThrowableStrRep();
	            if (s != null) {
	                for (int j = 0; j < s.length; j++) {
	                    sbuf.append("\r\n ");
	                    sbuf.append(s[j]);
	                }
	            }
	            sbuf.append("')");
	        }
	        
	        return sbuf.toString() ;
	}
}
