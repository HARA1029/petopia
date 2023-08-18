<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 조회 페이지</title>
    <link rel="stylesheet" href="../css/reviewManagement.css" />
</head>
<%@ include file="/layout/top.jsp" %>
    <h1>리뷰 관리 페이지</h1>
    
    <div>
        <table class="reviewTable" border="1">
            <tr>
                <th>리뷰번호</th>
                <th>사용자ID</th>
                <th>상품명</th>
                <th>리뷰내용</th>
                <th>작성날짜</th>
            </tr>
            <%     
            
             String sql = "SELECT r.rno, c.id, p.pname, r.content, r.nowdate " +
                          "FROM review r " +
                          "JOIN customer c ON r.uno = c.uno " +
                          "JOIN product p ON r.pno = p.pno";
         
              if (connect) {
                 System.out.println("db연결성공");
                 pstmt = conn.prepareStatement(sql);
                 rs = pstmt.executeQuery();

                 while (rs.next()) {
                     int reviewNumber = rs.getInt("rno");
                     String userId = rs.getString("id");
                     String productName = rs.getString("pname");
                     String reviewContent = rs.getString("content");
                     String reviewDate = rs.getString("nowdate");
         %>
            <tr>
                <td class="td_1"><%= reviewNumber %></td>
                <td class="td_2"><%= userId %></td>
                <td class="td_3"><%= productName %></td>
                <td class="td_4"><%= reviewContent %></td>
                <td class="td_5"><%= reviewDate %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">데이터베이스 연결에 실패했습니다.</td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
<%@ include file="../layout/bottom.jsp" %>