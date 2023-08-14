<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbConn.jsp" %>
<%@ include file="/layout/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
</head>
<body>
    <h1>공지사항</h1>
    
    <div class="manager-menu">
        <% 
        if (sessionID != null && sessionID.equals("kosa")) {
        %>
            <form action="writeNotice.jsp" method="get">
                <button type="submit">글쓰기</button>
            </form>
        <% } %>                   
    </div>
    
    <div>
        <table border="1">
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            <%
            if (connect) {  // Check if the database connection was successful
            	System.out.println("db연결성공");
            
            	String sql = "SELECT * FROM notice";
            	
        	    PreparedStatement sm = conn.prepareStatement(sql);        	    
        	    ResultSet rs = sm.executeQuery();
        	    boolean test = rs.next();
        	    System.out.println(test);
        	    
                while (test) {
                    int postNumber = rs.getInt("no");
                    String title = rs.getString("ntitle");
                    Date createDate = rs.getDate("ndate");
                    int views = rs.getInt("ncount");
            %>
            <tr>
                <td><%= postNumber %></td>
                <td><a href="notice_detail.jsp?postNumber=<%= postNumber %>"><%= title %></a></td>
                <td><%= createDate %></td>
                <td><%= views %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">데이터베이스 연결에 실패했습니다.</td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>
<%@ include file="../layout/bottom.jsp" %>
