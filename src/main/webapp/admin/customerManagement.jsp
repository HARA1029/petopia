<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객 관리 페이지</title>
    <link rel="stylesheet" href="../css/customerManagement.css" />
    
</head>
<%@ include file="/layout/top.jsp" %>
    <h1>고객 관리 페이지</h1>
    
    <div>
        <table class="customerTable" border="1">
            <tr>
                <th>고객ID</th>
                <th>고객명</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>등급</th>
            </tr>
            <%     
            
             String sql = "SELECT * FROM customer";
         
              if (connect) {
                 System.out.println("db연결성공");
                 PreparedStatement sm = conn.prepareStatement(sql);
                 rs = sm.executeQuery();

                 while (rs.next()) {
                     String u_id = rs.getString("id");
                     String u_name = rs.getString("uname");
                     String u_tel = rs.getString("tel");
                     String u_addr = rs.getString("addr");
                     String u_grade = rs.getString("grade");
                     String level = "";
                     
                     if (u_grade != null && !u_grade.isEmpty()) {
                    		
     	                if(u_grade.equals("C")) {
     	                    level = "소형견";
     	                } else if(u_grade.equals("B")) {
     	                    level = "중형견";
     	                } else if(u_grade.equals("A")) {
     	                    level = "대형견";
     	                } else if(u_grade.equals("ADMIN")) {
     	                    level = "관리자";
     	                }	else {
     	                    level = "등급없음";         
     	                }
     	            }
         %>
            <tr>
                <td class="td_1"><%= u_id %></td>
                <td class="td_2"><%= u_name %></td>
                <td class="td_3"><%= u_tel %></td>
                <td class="td_4"><%= u_addr %></td>
                <td class="td_5"><%= level %></td>
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