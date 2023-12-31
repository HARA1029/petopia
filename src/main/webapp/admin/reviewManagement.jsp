<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 관리 페이지</title>
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
                <th>선택</th>
            </tr>
            <%     
            
             String sql = "SELECT r.rno, c.id, p.pname, r.content, r.nowdate " +
                          "FROM review r " +
                          "JOIN customer c ON r.uno = c.uno " +
                          "JOIN product p ON r.pno = p.pno";
         
              if (connect) {
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
                <td class="td_6">
                	<button type="button" class="answer-btn">답글</button>
            		<button type="button" class="delete-btn">삭제</button>
                </td>
            </tr>
            <tr class="modal-row" data-rno="<%= reviewNumber %>">
			    <td colspan="6">
			        <div class="modal-content">
			            <form name="updateForm" action="" method="post">
			                <input type="hidden" name="rno" value="<%= reviewNumber %>">
			                <label for="content_<%= reviewNumber %>">답글</label>
			                <br>
			                <textarea class="review-textarea" name="content" id="content_<%= reviewNumber %>" rows="4" cols="50" maxlength="100"></textarea>
			                <div class="char-count">
			                    <span class="current-count">0</span>/<span class="max-count">100</span> bytes
			                </div>
			                <br>
			                <button type="submit" class="update-btn" >등록</button>
			                <button type="button" class="close-btn">닫기</button>
			            </form>
			        </div>
			    </td>
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