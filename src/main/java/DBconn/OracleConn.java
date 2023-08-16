package DBconn;

import java.sql.*;

public class OracleConn {
	
private Connection conn = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "petopia";
	String password = "cat";
	
	public OracleConn() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password); // url, user, password를 변수로 처리해도됨
			System.out.print("데이터베이스 연결이 성공했습니다.");        
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConn() {
		return conn;
	}

}