<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="Dto.*, Dao.*"%>

<%
	//System.out.println("들어 옴");//
	request.setCharacterEncoding("UTF-8");
	
	String action = request.getParameter("Submit");
	System.out.println("action : " + action);//
	
	MDao mdao;
	
	switch (action) {
	
	//상품등록
	case "register":
	
		int cateno = Integer.parseInt(request.getParameter("cno"));
		
		String categoryName = "";
	
		if (cateno == 1) { categoryName = "목욕";} 
		else if (cateno == 2) {categoryName = "배변위생";} 
		else if (cateno == 3) {categoryName = "미용케어";} 
		else if (cateno == 4) {categoryName = "홈리빙";}
		else if (cateno == 5) {categoryName = "산책놀이";} 
		else if (cateno == 6) {categoryName = "간식영양제";} 
		else {categoryName = "의류악세서리";}
	
		//파일 경로 및 크기,인코딩 설정
		String directory = "C:/Eclipse-Jsp-workspace/petopia/src/main/webapp/image/" + categoryName;
		int size = 10 * 1024 * 1024;
		String encoding = "UTF-8";
	
		//파일 업로드(저장)
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		//MultipartRequest 
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, size, encoding, policy); //이 부분이 파일을 업로드 
	
		//업로드한 파일 얻기
		//File uploadedFile = multipartRequest.getFile("img"); //form에서 input type="file" name값을 입력, 업로드한 파일이름을 가져오기 위해 파일을 가져옴			
	
		//DB 전송
		String pname = multipartRequest.getParameter("pname");//상품명
		int price = Integer.parseInt(multipartRequest.getParameter("price")); //가격
		int stock = Integer.parseInt(multipartRequest.getParameter("stock")); //재고
		String img = multipartRequest.getParameter("Img"); //이미지
		int sell = 1; //처음에는 판매중(1:판매중, 0: 판매중지) 판매여부
	
		ProductDTO pd = new ProductDTO(0, pname, price, stock, img, cateno, sell);
	
		mdao = new ManagerDao();
	
		int result = mdao.register(pd); //상품등록
	
		if (result == -1) { //상품등록 실패
			response.sendRedirect("ManagerController.jsp?Submit=pList&cateno=0&id=kosa");
		} else {
	  	response.sendRedirect("ManagerController.jsp?Submit=pList&cateno=0&id=kosa");
		}
	
		break;
	
	//상품 중복체크	
	case "pCheck":
		System.out.println("상품중복체크 들어옴");
		String pName = request.getParameter("pname");
		System.out.println("name : " + pName);
	
		int check = new ManagerDao().pCheck(pName); //상품중복체크함수(쿼리) 실행
		System.out.print("check : " + check);
	
		if (check == 0) { //같은상품존재
			System.out.println("같은상품이 존재한다.");
			response.getWriter().write("0");
		} else { //중복x
			System.out.println("같은상품이 존재X.");
			response.getWriter().write("1");
		}
		break;
	
	//상품목록
	case "pList":
		
		int category = Integer.parseInt(request.getParameter("cateno"));
		String id = request.getParameter("id");
		
		System.out.println("상품목록 실행 로그인 아이디 --> " + id); //지울거*******************************
		
		id = id.equals(null) ? "member" : id;
		
		//여기서 아이디 값도 받아서 관리자는 all, 고객은 sell=0만
		mdao = new ManagerDao();
	
		ArrayList<ProductDTO> plist = mdao.pList(category,id); //카테고리별 목록 출력()
	
		request.setAttribute("plist", plist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("../view/ProductList_view.jsp");
		dispatcher.forward(request, response);
	
		break;
	
	//상품상세목록
	case "ProductDetail":
	
		int pno = Integer.parseInt(request.getParameter("pno"));
	
		mdao = new ManagerDao();
		ProductDTO pInfo = mdao.pInfo(pno);
	
		String[] pImg = pInfo.getImg().split(",");
	
		request.setAttribute("product", pInfo); //상품정보
		request.setAttribute("pImg", pImg); //상품 이미지
	
		dispatcher = request.getRequestDispatcher("../view/ProductDetail_view.jsp");
		dispatcher.forward(request, response);
	
		break;
	
	//상품검색
	case "search":
	
		String sname = request.getParameter("pname");
		System.out.println("sname : " + sname);
	
		mdao = new ManagerDao();
		ArrayList<ProductDTO> slist = mdao.sList(sname); //카테고리별 목록 출력()
	
		request.setAttribute("plist", slist);
		/* RequestDispatcher */ dispatcher = request.getRequestDispatcher("../view/ProductList_view.jsp");
		dispatcher.forward(request, response);
	
		break;
	
	//상품수정페이지
	case "pModify_veiw":
		System.out.println("상품수정페이지 들어옴");
	
		int mpno = Integer.parseInt(request.getParameter("pno"));
	
		mdao = new ManagerDao();
		ProductDTO mpInfo = mdao.pInfo(mpno); //
	
		String[] mpImg = mpInfo.getImg().split(",");
	
		request.setAttribute("product", mpInfo); //상품정보
		request.setAttribute("mpImg", mpImg); //상품 이미지
	
		dispatcher = request.getRequestDispatcher("../view/ProductModify.jsp");
		dispatcher.forward(request, response);
	
		break;
	
	//상품수정
	case "pModify":
	
		System.out.println("상품 수정하기");
	
		//파일 경로 및 크기,인코딩 설정
		String[] oldImg = request.getParameter("oldImg").split(",");
		int mcateno = Integer.parseInt(request.getParameter("cateno"));
	
		if (mcateno == 1) {
			categoryName = "목욕";
		} else if (mcateno == 2) {
			categoryName = "배변위생";
		} else if (mcateno == 3) {
			categoryName = "미용케어";
		} else if (mcateno == 4) {
			categoryName = "홈리빙";
		} else if (mcateno == 5) {
			categoryName = "산책놀이";
		} else if (mcateno == 6) {
			categoryName = "간식영양제";
		} else {
			categoryName = "의류악세서리";
		}
	
		//파일삭제
		directory = "C:/Eclipse-Jsp-workspace/petopia/src/main/webapp/image/" + categoryName + "/";
	
		//삭제할 파일이 존재할때만 삭제 실행
		if (oldImg.length > 0) {
			for (String del : oldImg) {
		File file = new File(directory + del);
		file.delete();
			}
		}
	
		//새로운 파일 업로드
		size = 10 * 1024 * 1024;
		encoding = "UTF-8";
	
		policy = new DefaultFileRenamePolicy();
		multipartRequest = new MultipartRequest(request, directory, size, encoding, policy); //이 부분이 파일을 업로드
	
		//업로드한 파일 얻기
		//uploadedFile = multipartRequest.getFile("img"); //form에서 input type="file" name값을 입력, 업로드한 파일이름을 가져오기 위해 파일을 가져옴
	
		//DB 전송
		int m_pno = Integer.parseInt(multipartRequest.getParameter("pno"));
		int mprice = Integer.parseInt(multipartRequest.getParameter("price"));
		int mstock = Integer.parseInt(multipartRequest.getParameter("stock"));
		String mimg = multipartRequest.getParameter("img");
		int msell = Integer.parseInt(multipartRequest.getParameter("sell"));;
		System.out.println("판매여부 : " + msell);
		pd = new ProductDTO(m_pno, "", mprice, mstock, mimg, mcateno, msell);
	
		mdao = new ManagerDao();
		mdao.productModify(pd);
		
		String alertScript = "<script>alert('상품수정완료'); location.href='ManagerController.jsp?Submit=ProductDetail&pno=" + m_pno
		+ "';</script>"; 
		out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
		
		break;
	
	//상품삭제-보류
	case "delete":
	
		int d_pno = Integer.parseInt(request.getParameter("pno"));
		
		/* 상품번호로 주문상세테이블에서 count(*)조회해서 1개라도 있으면 삭제 불가 0개 일때만 삭제 가능 */
	
		int dcateno = Integer.parseInt(request.getParameter("cateno"));
	
		if (dcateno == 1) {
			categoryName = "목욕";
		} else if (dcateno == 2) {
			categoryName = "배변위생";
		} else if (dcateno == 3) {
			categoryName = "미용케어";
		} else if (dcateno == 4) {
			categoryName = "홈리빙";
		} else if (dcateno == 5) {
			categoryName = "산책놀이";
		} else if (dcateno == 6) {
			categoryName = "간식영양제";
		} else {
			categoryName = "의류악세서리";
		}
	
		//파일 경로 및 크기,인코딩 설정
		String[] dImg = request.getParameter("dimg").split(",");
	
		//삭제하려는 파일경로(위치)
		directory = "C:/Eclipse-Jsp-workspace/petopia/src/main/webapp/image/" + categoryName + "/";
	
		//파일삭제
		for (String dimg : dImg) {
			File fi = new File(directory + dimg);
			fi.delete();
		}
	
		mdao = new ManagerDao();
	
		result = mdao.productDelete(d_pno);
	
		if (result == -1) {//실패
			alertScript = "<script>alert('삭제실패'); location.href='ManagerController.jsp?Submit=pList&cateno=0';</script>";
			out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
		} else { //삭제 성공
			alertScript = "<script>alert('삭제성공'); location.href='ManagerController.jsp?Submit=pList&cateno=0';</script>";
			out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
		}
	
		break;
	
	default:
		break;
	}
%>