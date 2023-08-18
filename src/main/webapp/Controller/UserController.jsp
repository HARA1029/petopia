<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="Dto.*, Dao.*" %>
 
<%
	
	System.out.println("UserController 들어 옴");//
	request.setCharacterEncoding("UTF-8");
	
	String action = request.getParameter("submit");
	System.out.println("action : " + action);//
	
	UserDao udao;
	
	switch(action) {
	
		//장바구니 담기
		case "addCart" :
			
			//회원번호, 상품번호, 상품총수량 받기
			//int uno = Integer.parseInt(request.getParameter("uno"));
			int pno = Integer.parseInt(request.getParameter("pno"));
			int count = Integer.parseInt(request.getParameter("count"));
			
			//System.out.println("회원번호 : " + uno);
			System.out.println("상품번호 : " + pno);
			System.out.println("총 주문수량 : " + count);
			
			Cart cart = new Cart(0,1,pno,count);
			
			udao = new UserDao();
			int result = udao.addCart(cart);
			
			if(result == -1) {
				System.out.println("실패");
			}
			else {
				System.out.println("장바구니 성공");
				//장바구니로 이동하는데 컨트롤러로 이동해서 장바구니로 이동
			}
			
		break;
		
		//장바구니 목록
		case "cartList" :
			
			
		break;
		
		
		
			
		default :
			break;
	}

%>