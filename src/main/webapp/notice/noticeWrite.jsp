<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>
<%@ include file="/layout/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성</title>
    <link rel="stylesheet" href="../css/noticeWrite.css">
</head>
    <div class="notice-write">
        <h1>공지사항 작성</h1>
        
        <form class="noticeform" action="/petopia/user/controller.jsp" method="post">
        	<input type="hidden" name="action" value="noticeWrite">
        	
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>
            <br>
            
            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="8" required></textarea>
            <br>
            
            <div class="button">
                <input type="reset" value=" 다시작성 ">
                <input type="submit" value=" 작성하기 ">
            </div>
        </form>
    </div>
<%@ include file="../layout/bottom.jsp" %>