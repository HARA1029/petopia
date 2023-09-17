<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.util.Random" %> <!-- 날짜,시간,랜덤숫자 생성(주문번호) -->
<%@ page import="Dto.*, Dao.*" %>
 
<%
 
  	request.setCharacterEncoding("UTF-8");
  	
  	String action = request.getParameter("Submit");
  	
  	UDao udao;
  	CustomerDTO customer;
  	RequestDispatcher dispatcher;
  	
  	
  	switch(action) {
  	
  		//장바구니 담기 *** ok
  		case "addCart" :
  	
 		 	System.out.println("장바구니 담기 들어옴");//*******
 		 	
 		 	String id = request.getParameter("id");
 		 	int pno = Integer.parseInt(request.getParameter("pno"));
 		 	int count = Integer.parseInt(request.getParameter("count"));
 		 	
 		 	udao = new UserDao();
 		 	
 		 	//장바구니에 이미 상품이 있는지 확인cartCheck
 		 	int restStock = udao.cartCheck(pno,id); //-1이면 장바구니에 상품이 없다.
 		 	
 		 	//장바구니에 해당 상품이 없음
 		 	if(restStock==-1) {
 		 		
 		 			udao = new UserDao();
 		 			
 		 			int result = udao.addCart(id, pno, count); //장바구니에 상품 담기
 		 			
 		 			System.out.println("result : " + result);
 		 			
 		 			if(result == -1) {
 		 				String alertScript = "<script> alert('Error'); window.location.reload(); </script>";
 		 				out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
 		 			}
 		 			else {
 		 				//String alertScript = "<script>alert('장바구니 담기 성공'); location.href='UserController.jsp?Submit=cartList';</script>";
 		 				String alertScript = "<script>alert('장바구니 담기 성공'); location.href='UserController.jsp?Submit=cartList&id=" + id + "';</script>";
 		 				out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
 		 			}
 		 			
 		 	}
 		 	
 		 	//장바구니에 이미 동일 상품이 담아있음 
 		 	else {
 		 		
 		 		System.out.println("재고 : "  + restStock);
 	 		 	System.out.println("주문하려는 수량 : " + count); 
 		 		
 		 		if(restStock<count) { //재고부족(주문가능 수량 < 담을수량)
 		 			String alertScript = "<script>alert('재고가 부족합니다.'); location.href='ManagerController.jsp?Submit=ProductDetail&pno="+pno+"';</script>";
 		 			out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
 		 		}
 		 		else { //재고만 수정하기
 		 			udao = new UserDao();
 		 			udao.cartModify(id, count, pno); //담을 수량, 상품번호(장바구니에서 상품번호에 품목 수량을 늘리기)
 		 			//String alertScript = "<script>alert('장바구니 담기 성공'); location.href='UserController.jsp?Submit=cartList';</script>";
 		 			String alertScript = "<script>alert('장바구니 담기 성공'); location.href='UserController.jsp?Submit=cartList&id=" + id + "';</script>";
 		 			out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
 		 			System.out.println("재고만 수정");//*******
 		 		}
 		 	}
 		 	
 		 	break;
  	
 		 	
  		//장바구니 목록 *** ok
  		case "cartList" :
  			
 		 	System.out.println("장바구니 목록");//*******
 		 	
 		 	id = request.getParameter("id");
 		 	System.out.println("id : " + id);
 		 	
 		 	udao = new UserDao();
 		 	ArrayList<CartDTO> cartlist = new ArrayList<>();
 		 	
 		 	cartlist = udao.cartList(id);
 		 	System.out.println("장바구니 다 담았다.");//*******
 		 	
 		 	request.setAttribute("cartlist", cartlist);
 		 	request.setAttribute("size", cartlist.size());
 		 	dispatcher = request.getRequestDispatcher("../Order/Cart_view.jsp");
 		 	dispatcher.forward(request, response);
 		 	
 		 	break;
  	
 		 	
  		//주문페이지 이동 *** ok
  		case "orderView" :
  	
 		 	System.out.println("주문페이지 이동");
 		 	
 		 	udao = new UserDao();
 		 	ArrayList<CartDTO> cartdto = new ArrayList<>();

 		 	id = request.getParameter("id"); //주문자 아이디
 		 	customer = udao.cInfo(id); //주문자 정보 담기
 		 	
 		 	int dir = Integer.parseInt(request.getParameter("dir")); //바로주문인지, 장바구니 통한 주문인지 구별
 		 	
 		 	if(dir == 0) { //바로 주문
 		 		System.out.println("상세 페이지 -> 바로 주문");
 		 	
 		 		pno = Integer.parseInt(request.getParameter("pno"));
 		 		count = Integer.parseInt(request.getParameter("count"));
 		 		
 		 		cartdto = udao.oplist(id, pno, count);
 		 		
 		 	}
 		 	else { //장바구니 -> 주문페이지
 		 		
 		 		System.out.println("장바구니 -> 주문페이지");
 		 		
 		 		ArrayList<Integer> OrderList = new ArrayList<>();
 	 		 	
 	 		 	String[] cNoArr = request.getParameterValues("cno"); //장바구니 번호 받기
 	 		 	
 	 		 	for(String cNo : cNoArr) {
 	 		 		OrderList.add(Integer.parseInt(cNo)); //정수형 변환해서 넣기
 	 		 	}
 	 		 	
 	 		 	cartdto = udao.opList(OrderList); //주문할 상품정보 List 담기
 		 				
 		 	}
 		 	
 		 	request.setAttribute("cartdto", cartdto); //구매할 상품 내역
 		 	request.setAttribute("customer", customer); //주문자정보
 		 	
 		 	dispatcher = request.getRequestDispatcher("../Order/Order_view.jsp"); //주문페이지 이동
 		 	dispatcher.forward(request, response);
 		 	
 		 	break;
  	
 		 	
  		//장바구니 삭제 *** ok
  		case "delete" :
  	
 		 	System.out.println("장바구니 삭제 들어옴");//*******
 		 	
 		 	udao = new UserDao();
 		 	
 		 	List<Integer> cnoList = new ArrayList<>();
 		
 		 	String[] Arr = request.getParameterValues("cno"); //장바구니 번호
 		 	id = request.getParameter("id");
 		 	
 		 	System.out.println("아이디 : " + id);
 		 	
 		 	for(String s : Arr) {
 		 		cnoList.add(Integer.parseInt(s));
 		 	}
 		 	
 		 	int result = udao.delete(cnoList); //장바구니 삭제
 		 	
 		 	if(result==-1) {
 		 		String alertScript = "<script>alert('삭제 실패'); location.href='UserController.jsp?Submit=cartList&id=" + id + "';</script>";
 		 		out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
 		 	}
 		 	else {
 		 		String alertScript = "<script>alert('삭제성공'); location.href='UserController.jsp?Submit=cartList&id=" + id + "';</script>";
 		 		out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
 		 	}
 		 				
 		 	break;
 		 	
 		 	
 	 	//주문하기 *** ok
 		case "order" :
 			
 			System.out.println("주문하기 들어옴");
      
 			// 주문 번호 생성 *********************
 			Date now = new Date();
 			Random random = new Random();
 	        
      // 11부터 99까지 랜덤 숫자 생성
      int randomNumber = random.nextInt(89) + 11;
 	        
      // 2자리 년도
      String year = new SimpleDateFormat("yy").format(now);
      // 2자리 월
      String month = new SimpleDateFormat("MM").format(now);
      // 2자리 일
      String day = new SimpleDateFormat("dd").format(now);      
      // 2자리 시
      String hour = new SimpleDateFormat("HH").format(now);      
      // 2자리 분
      String min = new SimpleDateFormat("mm").format(now);     
      // 2자리 초
      String sec = new SimpleDateFormat("ss").format(now);
	     			
      int uno = Integer.parseInt(request.getParameter("uno")); //회원번호 --> 주문테이블
      
      String oNumber = uno+year+month+day+hour+min+sec+randomNumber; // 주문번호 생성(뒤에서 정수형 변환해야됨)
      
      long ono = Long.parseLong(oNumber); //주문번호(회원번호+날짜/시간+랜덤숫자)
      
      // 주문 번호 생성 끝 *********************
      
      int total = Integer.parseInt(request.getParameter("total")); //총 주문금액 --> 주문테이블
      
      int state = 0;//주문상태(0:결제완료) --> 주문테이블
      
      String message = request.getParameter("message"); //배송메시지 --> 주문테이블
      
      ArrayList<Integer> cNo = new ArrayList<>(); 	//장바구니번호--> 삭제할거
      String[] cNoArr = request.getParameterValues("cno");
		  for(String no : cNoArr) {	//장바구니번호 전수형 변환
		 		 cNo.add(Integer.parseInt(no));
		  }
      
      String[] pNo = request.getParameterValues("pno"); //상품번호 --> 상세 테이블 및 재고조정
      String[] Count = request.getParameterValues("count"); //구매수량 --> 상세 테이블
      String[] pName = request.getParameterValues("pname");//상품이름 --> 주문타이틀때문에 필요한거
      
      String title = pName.length == 1 ? pName[0] : pName[0] + "외" + (pName.length-1);//주문 타이틀
 			
 			OrderDTO order = new OrderDTO(); //주문테이블
 			order.setOno(ono);
 			order.setUno(uno);
 			order.setTitle(title);
 			order.setTotal(total);
 			order.setState(state);
 			order.setMessage(message);
 			
 			
 			ArrayList<OrderDetailDTO> detailList = new ArrayList<>(); //주문상제정보 넣을 객체
 			
 			for(int i=0; i<pNo.length; i++) { //상세테이블 객체에 데이터값을 넣고 넣으면 그 객체를 리스트에 넣기
 				
 				OrderDetailDTO detailDto = new OrderDetailDTO();
 				
 				detailDto.setOno(ono); //주문번호
 				detailDto.setPno(Integer.parseInt(pNo[i])); //상품번호
 				detailDto.setCount(Integer.parseInt(Count[i])); //개수
 				
 				detailList.add(detailDto);
 				
 			}
 			
 			
 			//쿼리(작업) 수행
 			udao = new UserDao();
 			
 			//주문정보 & 회원등급 조정
 			int ck = udao.orderInsert(order); //회원의 주문 횟수를 받아온다.
 			
 			System.out.println("1) 주문테이블 전송 완료 --------------");
 			
 			//상세정보
 			udao.detailInsert(detailList);

 			System.out.println("2) 상세 테이블 전송 완료 --------------");
 			
 			
 			//재고조정
 			udao.stockModify(detailList); //pno, count만 사용해서 재고수정

 			System.out.println("3)--------------");
 			
 			//위에 수행하면서 db 안닫아줌
 			//장바구니 삭제(기존에 있던거 사용) --> 여기서 완료
 			if(cNo.get(0)!=0) {udao.delete(cNo);} //0이면 바로주문이라서 장바구니 삭제 필요x
 			
 			System.out.println("4)--------------");
 			
 			
 			//회원정보(회원번호로)
 			System.out.println("회원번호 : " + uno);
 			CustomerDTO custominfo = new CustomerDTO();
 			custominfo = udao.customerInfo(uno);
 			System.out.println("cus : " + custominfo.getZipcode());
 			
 			//주문완료페이지로 이동
 			if(ck == 0) { //주문 실패
 				response.sendRedirect("UserController.jsp?Submit=cartList&id="+custominfo.getId());
 			}
		 	else { //주문 성공()
		 		System.out.println("주문 성공"); //-> 회원정보,주문테이블
 				request.setAttribute("order", order); //주문내역
 	 		 	request.setAttribute("custominfo", custominfo); //주문자정보
 	 		 	
 	 		 	dispatcher = request.getRequestDispatcher("../Order/OrderSuccess_view.jsp"); //주문페이지 이동
 	 		 	dispatcher.forward(request, response);
		 	}
  			
 			break;
 			
 			
		//주문 내역 *** ok
		case "OrderInfo" :
			System.out.println("주문내역");
			
			String userid = request.getParameter("id");
			
			System.out.println("userid : " + userid);
			
			ArrayList<OrderDTO> orderList = new ArrayList<>();
			udao = new UserDao();
			orderList = udao.orderList(userid);
			
			request.setAttribute("orderList", orderList); //주문내역
 		 	
 		 	dispatcher = request.getRequestDispatcher("../Order/OrderInfo_view.jsp"); //주문페이지 이동
 		 	dispatcher.forward(request, response);
		break;
 			
 		//주문상세내역 *** ok
		case "OrderDetailInfo" :
			System.out.println("상세정보에 들어옴");
			ono = Long.parseLong(request.getParameter("ono")); //주문번호
			
			udao = new UserDao();
			
			ArrayList<OrderDetailDTO> odList = new ArrayList<>();
			
			odList = udao.ProductDetailInfo(ono);
			
			request.setAttribute("odList", odList); //구매할 상품 내역
 		 	
 		 	dispatcher = request.getRequestDispatcher("../Order/OrderDetail_view.jsp"); //주문페이지 이동
 		 	dispatcher.forward(request, response);
			
			break;
		
		//리뷰 작성
		case "reviewRegister" :
			
			System.out.println("리뷰작성 들어옴");
			
			String userID = request.getParameter("uId"); //회원아이디
			int productNo = Integer.parseInt(request.getParameter("pNo")); //상품번호
			String content = request.getParameter("reviewContent"); //리뷰내용
			int detailNo = Integer.parseInt(request.getParameter("dNo"));//주문상세번호
			
			System.out.println("회원아이디 : " + userID);
			System.out.println("상품번호 : " + productNo);
			System.out.println("리뷰내용 : " + content);
			System.out.println("주문상세번호 : " + detailNo);
			
			udao = new UserDao();
			int result1 = udao.reviewRegister(userID, productNo, content, detailNo);
			System.out.println("result1 : " + result1);
			response.sendRedirect("/petopia/main.jsp"); //메인으로 이동
		
			break;
  	
  		
 		default : 
 			break;
  			
  	}
%>