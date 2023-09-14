<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "../Controller/dbConn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> myList </title>
<link rel="stylesheet" href="../css/myList.css" />
<script src="../js/myList.js"></script>
</head>
<%@ include file="../layout/top.jsp" %>
<%@ include file="../layout/nav.jsp" %>
<br><br>

		<!-- 내가 쓴 글  -->
		<h1> 내가 쓴 글 </h1>

	<table class = "myListTable">
            <tr>
                <th>글번호</th>
                <th>상품명</th>
                <th>리뷰내용</th>
                <th>작성날짜</th>
                <th>좋아요</th>
                <th>선택</th>
            </tr>
    
<%
    request.setCharacterEncoding("UTF-8");

    String u_id = (String) session.getAttribute("userID");
    String r_sql = "SELECT r.rno, p.pname, r.content, r.nowdate FROM review r JOIN product p ON r.pno = p.pno " +
            "WHERE r.uno = (SELECT uno FROM customer WHERE id = ?)";
    pstmt = conn.prepareStatement(r_sql);
    pstmt.setString(1, u_id);
    rs = pstmt.executeQuery();

    while (rs.next()) {
        int number = rs.getInt("rno");
        String p_name = rs.getString("pname");
        String content = rs.getString("content");
        String date = rs.getString("nowdate");
        // 좋아요 수를 가져오거나 계산하는 코드가 필요할 수 있습니다.
        int likeCount = 0; // 예시로 0으로 설정
        
%>
    <tr>
        <td class="td_1"><%= number %></td>
        <td class="td_2"><%= p_name %></td>
        <td class="td_3"><%= content %></td>
        <td class="td_4"><%= date %></td>
        <td class="td_5"><%= likeCount %></td>
        <td class="td_6">
            <button type="button" class="edit-btn" data-rno="<%= number %>">수정</button>
            <button type="button" class="delete-btn" data-rno="<%= number %>">삭제</button>
        </td>
    </tr>
    <!-- 각 리뷰에 대한 모달 폼 -->
 <tr class="modal-row" data-rno="<%= number %>">
    <td colspan="6">
        <div class="modal-content">
            <form name="updateForm" action="" method="post">
                <input type="hidden" name="rno" value="<%= number %>">
                <label for="content_<%= number %>">리뷰 내용</label>
                <br>
                <textarea class="review-textarea" name="content" id="content_<%= number %>" 
                rows="4" cols="50" maxlength="100"><%= content %></textarea>
                <div class="char-count">
                    <span class="current-count">0</span>/<span class="max-count">100</span> bytes
                </div>
                <br>
                <button type="submit" class="update-btn" >수정</button>
                <button type="button" class="close-btn">닫기</button>
            </form>
        </div>
    </td>
</tr>

<% // update_review.jsp의 내용을 여기에 붙여넣습니다.
String rnoStr = request.getParameter("rno");
String updateContent = request.getParameter("content");


if (rnoStr != null && !rnoStr.isEmpty() && updateContent != null) {
    int rno = Integer.parseInt(rnoStr);

    try {
        // 리뷰 수정 쿼리를 작성하고 실행
        String update_sql = "UPDATE review SET content = ?, nowdate = sysdate WHERE rno = ?";
        pstmt = conn.prepareStatement(update_sql);
        pstmt.setString(1, updateContent);
        pstmt.setInt(2, rno);
      
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("myList.jsp"); // 수정 후 목록 페이지로 이동
}
%>

<%
    } // end of while loop

    rs.close();
    pstmt.close();
    conn.close();
%>

</table>

<br><br>
<%@ include file="../layout/bottom.jsp"%>
