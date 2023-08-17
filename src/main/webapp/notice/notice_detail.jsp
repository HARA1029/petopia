<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>
<%@ include file="/layout/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세 내용</title>
    <link rel="stylesheet" href="../css/notice_detail.css">
</head>
    <div class="notice-detail">
        <%
            String postNumberParam = request.getParameter("postNumber");
            
            if (postNumberParam != null) {
                int postNumber = Integer.parseInt(postNumberParam);
                
                String sql = "SELECT * FROM notice WHERE no = ?";
                PreparedStatement sm = conn.prepareStatement(sql);
                sm.setInt(1, postNumber);
                ResultSet rs = sm.executeQuery();
                
                if (rs.next()) {
                    String title = rs.getString("ntitle");
                    String createDate = rs.getString("ndate");
                    int views = rs.getInt("ncount");
                    String content = rs.getString("ncontent");
        %>
        
        <h1><%= title %></h1>
        
        <div class="manager-menu">
	        <% 
	        if (sessionID != null && sessionID.equals("kosa")) {
	        %>
	           <div class="button-container">
				    <form action="noticeEdit.jsp" method="get">
				        <input type="hidden" name="postNumber" value="<%= postNumber %>">
				        <input type="submit" value="수정하기">
				    </form>
				    <form name="noticeDeleteForm" method="get">
					    <input type="hidden" name="action" value="noticeDelete">	
					    <input type="hidden" name="postNumber" value="<%= postNumber %>">
					    <input type="submit" value="삭제하기" onclick="deleteNotice(event)">
					</form>
				</div>
	        <% } %>                   
	    </div>
    
        <div class="info">
            <p class="create-date">작성일: <%= createDate %></p>
            <p class="views">조회수: <%= views %></p>
        </div>
        
        <div class="content">
            <%= content %>
        </div>
        
        <%
                } else {
        %>
        <p>해당 공지사항을 찾을 수 없습니다.</p>
        <%
                }
                
                rs.close();
                sm.close();
            } else {
        %>
        <p>잘못된 요청입니다.</p>
        <%
            }
        %>
    </div>
    <script src="../js/function.js"></script>
<%@ include file="../layout/bottom.jsp" %>
