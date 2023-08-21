<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../user/dbConn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> myList </title>
<link rel="stylesheet" />

</head>
<%@ include file="../layout/top.jsp" %>

<%
    int rno = Integer.parseInt(request.getParameter("rno"));
    
    // 리뷰 삭제 쿼리 작성
    String deleteSql = "DELETE FROM review WHERE rno = ?";
    pstmt = conn.prepareStatement(deleteSql);
    pstmt.setInt(1, rno);
    pstmt.executeUpdate();
    
    response.sendRedirect("myList.jsp"); // 삭제 완료 후 리스트 페이지로 이동
%>

<%@ include file="../layout/bottom.jsp"%>