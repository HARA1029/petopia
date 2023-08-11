<%@ page import = "java.sql.*" %>
<%
	   Connection conn = null;
	
	   String driver ="oracle.jdbc.driver.OracleDriver";
	   String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	   
	   Boolean connect = false;
	   
	   try {
	      //DriverManagerr 객체 생성, 등록
	      Class.forName(driver);
	      
	      //오라클 계정 id, 비밀번호 입력
	      conn = DriverManager.getConnection(url, "petopia", "cat");
	      
	      connect = true;
	      
	   } catch(Exception e) {
	      connect = false;
	      e.printStackTrace();
	   }
	%>


	<% if(connect == true) { %>
	   <h3>success</h3>
	<% } else { %>
	   <h3>fail</h3>
	<% } 
%>