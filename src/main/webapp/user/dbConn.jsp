<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBconn.OracleConn" %>

<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   OracleConn dbConnection = new OracleConn();
   conn = dbConnection.getConn();
   
   Boolean connect = false;

   try {
      connect = true;
   } catch(Exception e) {
      connect = false;
      e.printStackTrace();
   } 
%>
