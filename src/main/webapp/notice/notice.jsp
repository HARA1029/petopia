<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="../css/notice.css">
</head>

<%@ include file="/layout/top.jsp" %>
    <h1>공지사항</h1>
    
    <div class="menu">
        <% 
        if (sessionID != null && sessionID.equals("kosa")) {
        %>
            <form class="write-button" action="noticeWrite.jsp" method="get">
                <input type="submit" value="글쓰기">
            </form>
        <% } %>                   
    </div>
    
    <div class="menu">
        <form class="search-container" action="notice.jsp" method="get">
		    <select id="search-category" name="searchCategory">
		        <option value="title">제목</option>
		        <option value="content">내용</option>
		    </select>
		    <input id="notice-search" type="search" name="noticeSearch" placeholder="검색어를 입력해주세요">
		    <input id="notice-search-btn" type="submit" value="search">
		</form>
    </div>
    
    <div>
        <table class="noticeTable" border="1">
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            <%
            	String searchCategory = request.getParameter("searchCategory");
			    String searchQuery = request.getParameter("noticeSearch");
			    
			    String sql = "SELECT * FROM notice";
			
			    if (searchQuery != null && !searchQuery.isEmpty()) {
			        if ("title".equals(searchCategory)) {
			            sql += " WHERE ntitle LIKE '%" + searchQuery + "%'";
			        } else if ("content".equals(searchCategory)) {
			            sql += " WHERE ncontent LIKE '%" + searchQuery + "%'";
			        }
			    }
			
			    sql += " ORDER BY ndate DESC";
			
			    if (connect) {
			        pstmt = conn.prepareStatement(sql);
			        rs = pstmt.executeQuery();
			
			        while (rs.next()) {
			            int postNumber = rs.getInt("no");
			            String title = rs.getString("ntitle");
			            String date = rs.getString("ndate");
			            int views = rs.getInt("ncount");
			%>
            <tr>
                <td class="td_1"><%= postNumber %></td>
                <td class="td_2"><a class="notice-title" href="../user/controller.jsp?action=viewNotice&postNumber=<%= postNumber %>"><%= title %></a></td>
                <td class="td_3"><%= date %></td>
                <td class="td_4"><%= views %></td>
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
<%@ include file="../layout/bottom.jsp" %>