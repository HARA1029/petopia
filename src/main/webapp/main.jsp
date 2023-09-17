<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Controller/dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> MAIN </title>
    <link rel="stylesheet" href="css/main.css">
</head>

<%@ include file="layout/top.jsp" %>

<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <img src="image/메인베너1.gif" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="image/메인베너2.gif" style="width:100%">
  </div>

  <div class="mySlides fade">
    <img src="image/메인베너3.gif" style="width:100%">
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
    <a class="more-button" href="Controller/ManagerController.jsp?Submit=pList&cateno=0&id=<%=sessionID%>">+ 더보기</a>
</div>
<div class="plist-container">
    <%
        String sql = "SELECT p.pname, p.price, p.img, p.cateno " +
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
                int productCateno = rs.getInt("cateno");
                
                String[] image = productImage.split(",");
                String imgSrc = image[0];

                String cateSrc = "";
                if (productCateno == 1) {
                	cateSrc = "목욕";
                } else if (productCateno == 2) {
                	cateSrc = "배변위생";
                } else if (productCateno == 3) {
                	cateSrc = "미용케어";
                } else if (productCateno == 4) {
                	cateSrc = "홈리빙";
                } else if (productCateno == 5) {
                	cateSrc = "산책놀이";
                } else if (productCateno == 6) {
                	cateSrc = "간식영양제";
                }

                // 이미지 경로 생성
                String imagePath = "image/" + cateSrc + "/" + imgSrc;
    %>
    <div class="plist">
        <img class="pImg" src="<%= imagePath %>" alt="<%= productName %>">
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
    <a class="more-button" href="Controller/ManagerController.jsp?Submit=pList&cateno=0&id=<%=sessionID%>">+ 더보기</a>
</div>
<div class="plist-container">
    <%
        sql = "SELECT pname, price, img, cateno " +
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
				int productCateno = rs.getInt("cateno");
                
                String[] image = productImage.split(",");
                String imgSrc = image[0];

                String cateSrc = "";
                if (productCateno == 1) {
                	cateSrc = "목욕";
                } else if (productCateno == 2) {
                	cateSrc = "배변위생";
                } else if (productCateno == 3) {
                	cateSrc = "미용케어";
                } else if (productCateno == 4) {
                	cateSrc = "홈리빙";
                } else if (productCateno == 5) {
                	cateSrc = "산책놀이";
                } else if (productCateno == 6) {
                	cateSrc = "간식영양제";
                }

                // 이미지 경로 생성
                String imagePath = "image/" + cateSrc + "/" + imgSrc;
    %>
    <div class="plist">
        <img class="pImg" src="<%= imagePath %>" alt="<%= productName %>">
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

<script src="js/main.js"></script>

<%@ include file="layout/bottom.jsp" %>
