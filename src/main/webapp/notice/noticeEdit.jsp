<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>
<%@ include file="/layout/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="../css/noticeEdit.css">
</head>
<body>
       
    <div class="notice-edit">
        <h1>공지사항 수정</h1>
        
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
                    String content = rs.getString("ncontent");
        %>
        <form class="noticeform" action="/petopia/user/controller.jsp" method="post">
        	<input type="hidden" name="action" value="noticeEdit">
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" value="<%= title %>" required>
            <br>
            
            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="8" required><%= content %></textarea>
            <br>
            
            <div class="button">
                <input type="hidden" name="postNumber" value="<%= postNumber %>">
                <input type="reset" value=" 다시작성 ">
                <input type="submit" value=" 수정하기 ">
            </div>
        </form>
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
</body>
</html>
<%@ include file="../layout/bottom.jsp" %>
