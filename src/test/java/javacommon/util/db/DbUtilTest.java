package javacommon.util.db;


import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.RowSet;

import org.junit.Test;

import javacommon.util.db.DbUtil;;

public class DbUtilTest {

	@Test
	public void test() throws SQLException {
		/*连接池功能是否正常*/
		Connection conn = DbUtil.getConnection();
		System.out.println(conn.hashCode());
		DbUtil.freeConnection(conn);
		conn = DbUtil.getConnection();
		System.out.println(conn.hashCode());
		DbUtil.freeConnection(conn);
		conn = DbUtil.getConnection();
		System.out.println(conn.hashCode());
		DbUtil.freeConnection(conn);
		/*insert into rights_user (ID, USERNAME, PASSWORD, NAME, STATUS, DEPT_ID, ORG_ID, EMP_ID, PHONENUMBER, ROLE_ID)
		values ('4028808c411a980901411a9912090002', '组组长', '2', '2', 1, '2', '2', '2', '2', '');
		String sql = "insert into rights_user (ID) values(?)";
		DbUtil.update(sql,"ttt");
		sql = "select * from rights_user where id=?";
		RowSet rs = DbUtil.exeQuery(sql, "402881e74042a06d014042a1550e0002");
		rs.next();
		System.out.println(rs.getString(2));*/
	}
	

}
