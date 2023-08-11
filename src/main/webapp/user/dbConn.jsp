<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	   Connection conn = null;
	
	   String driver ="oracle.jdbc.driver.OracleDriver";
	   String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	   
	   Boolean connect = false;
	   
	   try {
	      //DriverManagerr ê°ì²´ ìì±, ë±ë¡
	      Class.forName(driver);
	      
	      //ì¤ë¼í´ ê³ì  id, ë¹ë°ë²í¸ ìë ¥
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