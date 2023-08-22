<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="Dto.*, Dao.*" %>
 
<%
	
	System.out.println("들어 옴");//
	request.setCharacterEncoding("UTF-8");
	
	String action = request.getParameter("submit");
	System.out.println("action : " + action);//
	
	ManagerDao mdao;
	
	switch(action) { 
		
		//상품등록
		case "register" :
			System.out.println("상품등록에 들어옴");// 지울거
			
			//파일 경로 및 크기,인코딩 설정
			String directory = "C:/Eclipse-Jsp-workspace/petopia/src/main/webapp/image";
			int size = 10 * 1024 * 1024;
			String encoding = "UTF-8";
			//파일 업로드(저장)
			
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest multipartRequest = new MultipartRequest(request, directory, size, encoding, policy); //이 부분이 파일을 업로드
			//업로드한 파일 얻기
			File uploadedFile = multipartRequest.getFile("img"); //form에서 input type="file" name값을 입력, 업로드한 파일이름을 가져오기 위해 파일을 가져옴
			
			
			//DB 전송
			String pname = multipartRequest.getParameter("pname");
			int price = Integer.parseInt(multipartRequest.getParameter("price"));
			int stock = Integer.parseInt(multipartRequest.getParameter("stock"));
			String img = uploadedFile.getName();//파일 이미지명은 이렇게 받아야 한다.
			int cateno = Integer.parseInt(multipartRequest.getParameter("cateno"));
			
			Product pd = new Product(0, pname, price, stock, img, cateno);
			
			mdao = new ManagerDao();
			
			int result = mdao.register(pd);
			
			if(result == -1) { //상품등록 실패
				response.sendRedirect("ManagerController.jsp?submit=pList&cateno=0");
			}
			else {
				response.sendRedirect("ManagerController.jsp?submit=pList&cateno=0");//해당정보만 띄우는 페이지 만들어서 변경해야함
			}
			
			break;
			
		//상품 중복체크	
		case "pCheck" :
			System.out.println("상품중복체크 들어옴");
			String pName = request.getParameter("pname");
			System.out.println("name : " + pName);
			
			int check = new ManagerDao().pCheck(pName); //상품중복체크함수(쿼리) 실행
			System.out.print("check : " + check);
			
			 if(check==0) { //같은상품존재
				 System.out.println("같은상품이 존재한다.");
				 response.getWriter().write("0");
			}
			else { //중복x
				System.out.println("같은상품이 존재X.");
				response.getWriter().write("1");
			}  
			break;	
		
		//상품목록
		case "pList" :
			
			int category = Integer.parseInt(request.getParameter("cateno"));
			System.out.println("상품목록에 들어옴 카테고리 넘버는 : " + category);
			
			mdao = new ManagerDao();
			
			ArrayList<Product> plist = mdao.pList(category); //카테고리별 목록 출력()
			
			request.setAttribute("plist", plist);
			RequestDispatcher dispatcher = request.getRequestDispatcher("../view/ProductList_view.jsp");
			dispatcher.forward(request, response);
			
			break;
			
		//상품상세목록
		case "pDetailList" : 
			
			int pno = Integer.parseInt(request.getParameter("pno"));
			System.out.println("pno : " + pno);
			
			mdao = new ManagerDao();
			Product pInfo = mdao.pInfo(pno); //
			
			request.setAttribute("product",pInfo);
			dispatcher = request.getRequestDispatcher("../view/pDetail_view.jsp");
			dispatcher.forward(request, response);
			
			break;
			
		//상품검색
		case "search" :
			
			String sname = request.getParameter("pname");
			System.out.println("sname : " + sname);
			
			mdao = new ManagerDao();
			ArrayList<Product> slist = mdao.sList(sname); //카테고리별 목록 출력()
			
			request.setAttribute("plist", slist);
			/* RequestDispatcher */ dispatcher = request.getRequestDispatcher("../view/ProductList_view.jsp");
			dispatcher.forward(request, response);
				
			break; 
			
			
		//상품수정페이지
		case "pModify_veiw" :
			System.out.println("상품수정페이지 들어옴");
			int mpno = Integer.parseInt(request.getParameter("pno"));
			
			mdao = new ManagerDao();
			Product mpInfo = mdao.pInfo(mpno); //
			
			request.setAttribute("product",mpInfo);
			dispatcher = request.getRequestDispatcher("../view/ProductModify.jsp");
			dispatcher.forward(request, response);
			System.out.println("상품수정페이지 들어가기");
			break;
			
		//상품수정
		case "pModify" :
			System.out.println("상품 수정하기");
			//파일 경로 및 크기,인코딩 설정
			String oldImg = request.getParameter("oldImg");
			
			//파일삭제
			directory = "C:/Eclipse-Jsp-workspace/petopia/src/main/webapp/image/";
			File file = new File(directory+oldImg);
			file.delete();
			//새로운 파일 업로드
			size = 10 * 1024 * 1024;
			encoding = "UTF-8";
			
			policy = new DefaultFileRenamePolicy();
		  multipartRequest = new MultipartRequest(request, directory, size, encoding, policy); //이 부분이 파일을 업로드
		  System.out.println("파일 이미지 이름 : " + multipartRequest.getParameter("img"));
		  //업로드한 파일 얻기
			uploadedFile = multipartRequest.getFile("img"); //form에서 input type="file" name값을 입력, 업로드한 파일이름을 가져오기 위해 파일을 가져옴
			
			System.out.println("여기까지는 되나?");
			//DB 전송
			//String mpname = multipartRequest.getParameter("pname");
			int m_pno = Integer.parseInt(multipartRequest.getParameter("pno"));
			int mprice = Integer.parseInt(multipartRequest.getParameter("price"));
			int mstock = Integer.parseInt(multipartRequest.getParameter("stock"));
			String mimg = uploadedFile.getName();//파일 이미지명은 이렇게 받아야 한다.
			int mcateno = Integer.parseInt(multipartRequest.getParameter("cateno"));
			
			pd = new Product(m_pno, "", mprice, mstock, mimg, mcateno);
			
			mdao = new ManagerDao();
			mdao.productModify(pd);			
			
			String alertScript = "<script>alert('상품수정완료'); location.href='ManagerController.jsp?submit=pModify_veiw&pno="+m_pno+"';</script>";
			out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
			
			break;
		
		//상품삭제
		case "delete" :
			
			int d_pno = Integer.parseInt(request.getParameter("pno"));
			
			//파일 경로 및 크기,인코딩 설정
			String dImg = request.getParameter("dimg");
			System.out.println("dImg : " + dImg);
			
			//파일삭제
			directory = "C:/Eclipse-Jsp-workspace/petopia/src/main/webapp/image/";
			File fi = new File(directory+dImg);
			fi.delete();
			
			mdao = new ManagerDao();
			
			result = mdao.productDelete(d_pno);
			
			if(result==-1) {//실패
				alertScript = "<script>alert('삭제실패'); location.href='ManagerController.jsp?submit=pList&cateno=0';</script>";
				out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
			}
			else { //삭제 성공
				alertScript = "<script>alert('삭제성공'); location.href='ManagerController.jsp?submit=pList&cateno=0';</script>";
				out.print(alertScript); // out은 JSP 페이지에서 사용 가능한 객체
			}
			
			break;
			
		default :
			break;
	}

%>