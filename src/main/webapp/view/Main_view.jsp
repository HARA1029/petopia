<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 테스트 메인 페이지</h1>

<button onclick="goToPage('signup')">회원가입</button> &nbsp;&nbsp;
<button onclick="goToPage('userList')">회원정보</button> &nbsp;&nbsp;
<button onclick="goToPage('register')">상품등록</button> &nbsp;&nbsp;
<button onclick="goToPage('pList')">상품목록</button> &nbsp;&nbsp;


<script>
function goToPage(page) {
	  switch (page) {
	    case 'signup':
	      window.location.href = 'signup_view.jsp'; // 회원가입 페이지 URL
	      break;
	    case 'userList':
		      window.location.href = '../Controller/UserController.jsp?submit=userlist'; // 회원정보 페이지 URL submit라는 파라메터의 값 = list
		      break;
	    case 'register':
	      window.location.href = 'ProductRegister_view.jsp'; // 상품등록 페이지 URL
	      break;
	    case 'pList':
	      window.location.href = '../Controller/ManagerController.jsp?submit=pList&cateno=0'; // 상품정보 페이지 URL
	      break;
	    default:
	      break;
	  }
	}
</script>

</body>
</html>