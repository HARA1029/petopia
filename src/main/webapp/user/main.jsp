<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../user/dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> MAIN </title>
    <link rel="stylesheet" href="../css/main.css">
</head>

<%@ include file="/layout/top.jsp" %>

<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <img src="../image/img1.jpg" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="../image/img2.jpg" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="../image/img3.jpg" style="width:100%">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>

<h1>BEST ITEM</h1>
<div class="button-container">
    <button class="more-button" onclick="goProductView()">+ 더보기</button>
</div>
<div class="plist-container">
    <%
        String sql = "SELECT p.pname, p.price, p.img " +
                     "FROM product p " +
                     "INNER JOIN ( " +
                     "    SELECT o.pno, SUM(o.count) AS total_count " +
                     "    FROM detail o " +
                     "    GROUP BY o.pno " +
                     "    ORDER BY total_count DESC " +
                     "    FETCH FIRST 5 ROWS ONLY " +
                     ") top_products ON p.pno = top_products.pno " +
                     "ORDER BY top_products.total_count DESC";

        if (connect) {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String productName = rs.getString("pname");
                double productPrice = rs.getDouble("price");
                String productImage = rs.getString("img");
    %>
    <div class="plist">
        <img class="pImg" src="../image/product/<%= productImage %>" alt="<%= productName %>">
        <p><%= productName %></p>
        <p>가격: <%= productPrice %>원</p>
    </div>
    <%
            }
        } else {
    %>
    <div class="plist">
        <p>데이터베이스 연결에 실패했습니다.</p>
    </div>
    <%
        }
    %>
</div>

<h1>NEW ITEM</h1>
<div class="button-container">
    <button class="more-button" onclick="goProductView()">+ 더보기</button>
</div>
<div class="plist-container">
    <%
        sql = "SELECT pname, price, img " +
              "FROM product  " +
              "ORDER BY pno DESC " + 
              "FETCH FIRST 5 ROWS ONLY"; 

        if (connect) {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String productName = rs.getString("pname");
                double productPrice = rs.getDouble("price");
                String productImage = rs.getString("img");
    %>
    <div class="plist">
        <img class="pImg" src="../image/product/<%= productImage %>" alt="<%= productName %>">
        <p><%= productName %></p>
        <p>가격: <%= productPrice %>원</p>
    </div>
    <%
            }
        } else {
    %>
    <div class="plist">
        <p>데이터베이스 연결에 실패했습니다.</p>
    </div>
    <%
        }
    %>
</div>

<script src="../js/main.js"></script>

<%@ include file="/layout/bottom.jsp" %>
