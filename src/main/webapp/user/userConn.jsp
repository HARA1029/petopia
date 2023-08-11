<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
	out.println("userConn 시작");

	String u_name = request.getParameter("userNAME");
	String u_id = request.getParameter("userID");
	String u_pw = request.getParameter("userPW");
	String u_mail = request.getParameter("userMAIL");
	String u_addr = request.getParameter("userADDR");
	String u_tel = request.getParameter("userTEL");
	
	
	String sql = "INSERT INTO CUSTOMER(uno,uname, id, pw, mail, addr, tel) VALUES";
	sql += "(CUSTOMER_SEQ.NEXTVAL,'" + u_name + "','" + u_id + "','" + u_pw + "','" + u_mail +"','" + u_addr + "','" + u_tel +"')";

	
	Statement sm = conn.createStatement();
	
	int count = sm.executeUpdate(sql);
	
	if(count == 1){
		out.println("회원가입 성공!");
		//response.sendRedirect("signupSuccess.jsp");
	}else{
		out.println("회원가입 실패!");
		//response.sendRedirect("signup.jsp");
	}
	sm.close();
	conn.close();	
%>