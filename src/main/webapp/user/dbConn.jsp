<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	   Connection conn = null;
	
	   String driver ="oracle.jdbc.driver.OracleDriver";
	   String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	   
	   Boolean connect = false;
	   
	   try {
	      //DriverManagerr 객체 생성, 등록
	      Class.forName(driver);
	      
	      conn = DriverManager.getConnection(url, "petopia", "cat");
	      
	      connect = true;
	      
	   } catch(Exception e) {
	      connect = false;
	      e.printStackTrace();
	   }

%>