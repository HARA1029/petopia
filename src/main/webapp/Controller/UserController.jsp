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
			
			System.out.println("장바구니 담기 들어옴");
			int uno = Integer.parseInt(request.getParameter("uno"));
			int pno = Integer.parseInt(request.getParameter("pno"));
			int count = Integer.parseInt(request.getParameter("count"));
			
			udao = new UserDao();
			
			//장바구니에 이미 상품이 있는지 확인cartCheck
			int restStock = udao.cartCheck(pno); //-1이면 장바구니에 없고 2이상이면 앞으로 장바구니에 담을수 있는 수량
			
			
			//장바구니에 해당 상품이 없음
			if(restStock==-1) {
					udao = new UserDao();
					int result = udao.addCart(uno, pno, count); //장바구니에 상품 담기
					if(result == -1) {
						String alertScript = "<script>alert('Error'); location.href='../view/ProductList_view.jsp';</script>";
						out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
					}
					else {
						String alertScript = "<script>alert('장바구니 담기 성공'); location.href='UserController.jsp?submit=cartList';</script>";
						out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
						}
			}
			
			//장바구니에 이미 동일 상품이 담아있음
			else {
				if(restStock<count) { //재고부족(주문가능 수량 < 담을수량)
					String alertScript = "<script>alert('재고가 부족합니다.'); location.href='ManagerController.jsp?submit=pDetailList&pno="+pno+"';</script>";
					out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
				}
				else { //재고만 수정하기
					udao = new UserDao();
					udao.cartModify(count, pno); //담을 수량, 상품번호(장바구니에서 상품번호에 품목 수량을 늘리기)
					String alertScript = "<script>alert('장바구니 담기 성공'); location.href='UserController.jsp?submit=cartList';</script>";
					out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
					System.out.println("재고만 수정");
				}
			}
			
			break;
			
		//장바구니 목록
		case "cartList" :
			System.out.println("장바구니 목록");
			
			udao = new UserDao();
			ArrayList<Cart> cartlist = new ArrayList<>();
			cartlist = udao.cartList();
			System.out.println("장바구니 다 담았다.");
			
			request.setAttribute("cartlist", cartlist);
			RequestDispatcher dispatcher = request.getRequestDispatcher("../view/cart.jsp");
			dispatcher.forward(request, response);
			
			break;
			
		
		default : 
			break;
	}

%>