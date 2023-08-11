<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jsp" %>

<div class="congratulations">
    <h2>회원가입 축하!</h2>
    <p>회원가입이 성공적으로 완료되었습니다.</p>
</div>

	<div class="user-information">
    <h3>저장된 회원 정보</h3>
    <p>이름: <%= request.getAttribute("u_name") %></p>
    <p>아이디: <%= request.getAttribute("u_id") %></p>
    <p>이메일: <%= request.getAttribute("u_mail") %></p>
    <p>주소: <%= request.getAttribute("u_addr") %></p>
    <p>전화번호: <%= request.getAttribute("u_tel") %></p>
	</div>

<%@ include file="../layout/bottom.jsp" %>