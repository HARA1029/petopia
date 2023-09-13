package DBconn;

import java.sql.*;

public class OracleConn {
   
   Connection conn = null;
//   PreparedStatement pstmt = null;
//   ResultSet rs = null;
   
   String url = "jdbc:oracle:thin:@localhost:1521:orcl";
   String user = "petopia";
   String password = "cat";
   
//   Boolean connect = false;
   
   public OracleConn() {
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection(url, user, password); // url, user, password를 변수로 처리해도됨
         //connect = true;    
      } catch(Exception e) {
         //connect = false;
         e.printStackTrace();
      }
   }

   public Connection getConn() {
      return conn;
   }

}