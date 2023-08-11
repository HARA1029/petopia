<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> MAIN </title>
</head>
<%@ include file="/layout/top.jsp" %>

	MAIN
	
	<div class="test">
		<form name="test" action="controller.jsp" method="post">
			<div>
				<input type="hidden" name="action" value="test">
				<input type="submit" value=" session test ">
			</div>	
		</form>
	</div>

<%@ include file="/layout/bottom.jsp" %>
