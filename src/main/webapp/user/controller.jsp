<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbConn.jsp" %>
<script src="../js/function.js"></script>
<%
	request.setCharacterEncoding("UTF-8");

 	// 아이디 중복 확인
	 if (request.getParameter("action") != null && request.getParameter("action").equals("checkID")){
		 String u_id = request.getParameter("id");
		 
		 String sql = "SELECT * FROM customer WHERE id = ?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, u_id);
		    rs = pstmt.executeQuery();
		
		    if (rs.next()) {
		    	out.println("중복된 id입니다.");
		    }
		    else{
		    	 out.println("사용 가능한 id입니다.");
		    }
		 
		    pstmt.close();
	        conn.close();
	        return;
	 }

    // 회원 가입 처리
    if (request.getParameter("action") != null && request.getParameter("action").equals("signup")) {
        out.println("회원가입 처리 시작");
        
        String u_name = request.getParameter("uname");
        String u_id = request.getParameter("id");
        String u_pw = request.getParameter("pw");
        
        String u_tel1 = request.getParameter("tel1");
        String u_tel2 = request.getParameter("tel2");
        String u_tel3 = request.getParameter("tel3");
        String u_tel = u_tel1 + "-" + u_tel2 + "-" + u_tel3;

        String u_mail1 = request.getParameter("mail1");
        String u_mail2 = request.getParameter("mail2");
        String u_emailDomain = request.getParameter("emailDomain");
        
        String u_zipcode = request.getParameter("zipcode");
        String u_addr1 = request.getParameter("addr1");
        String u_addr2 = request.getParameter("addr2");
        String u_addr = u_addr1 + " " + u_addr2;
        
        String u_grade = request.getParameter("grade");
               
        String u_mail;
        if (!u_emailDomain.equals("직접입력")) {
            u_mail = u_mail1 + "@" + u_emailDomain;
        }else{
        	u_mail = u_mail1 + "@" + u_mail2;
        }
        
        String sql = "INSERT INTO customer VALUES";
        sql += "(CUSTOMER_SEQ.NEXTVAL,'" + u_name + "','" + u_id + "','" + u_pw + "','" + u_mail + "','" + u_addr + "','" + u_tel + "','" + u_grade + "','" + u_zipcode + "')";

		pstmt = conn.prepareStatement(sql);
        
        int count = pstmt.executeUpdate();

        if (count == 1) {
        	
            out.println("회원가입 성공!");
            
            request.setAttribute("u_name", u_name);
            request.setAttribute("u_id", u_id);
            request.setAttribute("u_mail", u_mail);
            request.setAttribute("u_addr", u_addr);
            request.setAttribute("u_tel", u_tel);
            
            request.getRequestDispatcher("joinSuccess.jsp").forward(request, response);
            
        } else {
            out.println("회원가입 실패!");
            response.sendRedirect("main.jsp");
        }
        pstmt.close();
        conn.close();
    }

	//로그인 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("login")) {
	    System.out.println("로그인 처리 시작");
	
	    String u_id = request.getParameter("userID");
	    String u_pw = request.getParameter("userPW");
	
	    // 입력한 아이디와 일치하는 사용자 조회
	    String sql = "SELECT * FROM customer WHERE id = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, u_id);
	    rs = pstmt.executeQuery();
	
	    if (rs.next()) {
	        String dbPW = rs.getString("pw"); // db에 저장된 비밀번호 가져오기
	
	        if (dbPW.equals(u_pw)) { // 로그인 성공 
	        	
	        	// 저장한 정보 top.jsp에서 사용
	            session.setAttribute("userID", u_id); // 세션에 id 저장
	        
	            String name = rs.getString("uname");
	            session.setAttribute("userName", name);	// 세션에 이름 저장    
	            
	            String grade = rs.getString("grade");
	            session.setAttribute("userGrade", grade); // 세션에 등급 저장
	            
	            
	            response.sendRedirect("main.jsp");
	        } else { // 비번 틀림
	        	out.println("<script>loginerror1();</script>");
	        }
	    } else { // 존재하지 않는 아이디
	    	out.println("<script>loginerror2();</script>");
	    }
	
	    pstmt.close();
	    conn.close();
	}
	
	// 로그아웃 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
        session.invalidate();
        response.sendRedirect("main.jsp"); // Redirect to the main page after logout
    }
	
	// 공지사항 제목 클릭 -> 조회수 증가 -> 상세페이지이동
	if (request.getParameter("action") != null && request.getParameter("action").equals("viewNotice")) {
    	String postNumberParam = request.getParameter("postNumber");

	    if (postNumberParam != null) {
	        int postNumber = Integer.parseInt(postNumberParam);
	
	        String sql = "UPDATE notice SET ncount = ncount + 1 WHERE no = ?";
	        
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, postNumber);
	        
	        int count = pstmt.executeUpdate();
	
	        if (count > 0) {
	            out.println("조회수 증가 처리 완료");
	        }
	        
	        response.sendRedirect("../notice/noticeDetail.jsp?postNumber=" + postNumber);
	    }
	    
	    pstmt.close();
        conn.close();
	}
	
	// 공지사항 등록 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("noticeWrite")) {
        out.println("공지사항 등록 처리 시작");
        
        String n_title = request.getParameter("title");
        String n_content = request.getParameter("content");
        n_content = n_content.replace("\n", "<br>"); // 엔터 저장
        

        String sql = "INSERT INTO notice VALUES";
        sql += "(NOTICE_SEQ.NEXTVAL,'" + n_title + "','" + n_content + "', 0 , sysdate)";
        
        pstmt = conn.prepareStatement(sql);
        
        int count = pstmt.executeUpdate();

        if (count == 1) {
            out.println("공지사항 등록 성공!");
            response.sendRedirect("../notice/notice.jsp"); // 공지사항 목록 페이지로 리다이렉트
        } else {
            out.println("공지사항 등록 실패!");
        }
        
        pstmt.close();
        conn.close();
    }
	
	// 공지사항 수정 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("noticeEdit")) {
        out.println("공지사항 수정 처리 시작");

        int postNumber = Integer.parseInt(request.getParameter("postNumber"));
        String n_title = request.getParameter("title");
        String n_content = request.getParameter("content");
        n_content = n_content.replace("\n", "<br>");

        String sql = "UPDATE notice SET ntitle = ?, ncontent = ?, ndate = sysdate WHERE no = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, n_title);
        pstmt.setString(2, n_content);
        pstmt.setInt(3, postNumber);

        int count = pstmt.executeUpdate();

        if (count == 1) {
            out.println("공지사항 수정 성공!");
            response.sendRedirect("../notice/notice.jsp"); 
        } else {
            out.println("공지사항 수정 실패!");
        }

        pstmt.close();
        conn.close();
    }
	
	// 공지사항 삭제 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("noticeDelete")) {
	    out.println("공지사항 삭제 처리 시작");
	
	    String postNumberParam = request.getParameter("postNumber");
	
	    if (postNumberParam != null) {
	        int postNumber = Integer.parseInt(postNumberParam);
	
	        String deleteSql = "DELETE FROM notice WHERE no = ?";
	        PreparedStatement deleteSm = conn.prepareStatement(deleteSql);
	        deleteSm.setInt(1, postNumber);
	        int deleteResult = deleteSm.executeUpdate();
	
	        if (deleteResult > 0) {
	            out.println("공지사항 삭제 성공!");
	            response.sendRedirect("../notice/notice.jsp"); // 공지사항 목록 페이지로 리다이렉트
	        } else {
	            out.println("공지사항 삭제 실패: 해당 공지사항을 찾을 수 없습니다.");
	        }
	
	        deleteSm.close();
	    } else {
	        out.println("잘못된 요청입니다.");
	    }
	    
        pstmt.close();
        conn.close();	       
	}

%>