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
		    	System.out.println("중복된 id입니다.");
		    }
		    else{
		    	System.out.println("사용 가능한 id입니다.");
		    }
		 
		    pstmt.close();
	        conn.close();
	        return;
	 }

    // 회원 가입 처리
    if (request.getParameter("action") != null && request.getParameter("action").equals("signup")) {
    	System.out.println("회원가입 처리 시작");
        
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
        	
        	System.out.println("회원가입 성공!");
            
            request.setAttribute("u_name", u_name);
            request.setAttribute("u_id", u_id);
            request.setAttribute("u_mail", u_mail);
            request.setAttribute("u_addr", u_addr);
            request.setAttribute("u_tel", u_tel);
            
            request.getRequestDispatcher("joinSuccess.jsp").forward(request, response);
            
        } else {
        	System.out.println("회원가입 실패!");
            response.sendRedirect("../main.jsp");
        }
        pstmt.close();
        conn.close();
    }

	//로그인 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("login")) {
	    System.out.println("로그인 처리 시작");
	
	    String u_id = request.getParameter("userID");
	    String u_pw = request.getParameter("userPW");
		String u_name = request.getParameter("uname");
		String u_mail = request.getParameter("mail");
		String u_addr = request.getParameter("userAddr");
		String u_tel = request.getParameter("userTel");
	
	    // 입력한 아이디와 일치하는 사용자 조회
	    String sql = "SELECT * FROM customer WHERE id = ?";
	    PreparedStatement sm = conn.prepareStatement(sql);
	    sm.setString(1, u_id);
	   	rs = sm.executeQuery();
	
	    if (rs.next()) {
	        String dbPW = rs.getString("pw"); // db에 저장된 비밀번호 가져오기
	
	        if (dbPW.equals(u_pw)) { // 로그인 성공 
	        	
	        	// 저장한 정보 top.jsp에서 사용
	            session.setAttribute("userID", u_id); // 세션에 id 저장
	        
	            String name = rs.getString("uname");
	            session.setAttribute("userName", name);	// 세션에 이름 저장
	            
	            String mail = rs.getString("mail");
	            session.setAttribute("userMail", mail);	// 세션에 주소 저장
	            out.println(mail);
	            
	            String addr = rs.getString("addr");
	            session.setAttribute("userAddr", addr);	// 세션에 주소 저장
	            
	            String tel = rs.getString("tel");
	            session.setAttribute("userTel", tel);	// 세션에 전화번호 저장
	            
	            String grade = rs.getString("grade");
	            session.setAttribute("userGrade", grade); // 세션에 등급 저장
	            
	            
	            response.sendRedirect("../main.jsp");
	        } else { // 비번 틀림
	        	out.println("<script>loginerror1();</script>");
	        }
	    } else { // 존재하지 않는 아이디
	    	out.println("<script>loginerror2();</script>");
	    }
	
	    sm.close();
	    conn.close();
	}
	
	//회원 정보 수정
	if (request.getParameter("action") != null && request.getParameter("action").equals("edit")) {
	    String u_id = request.getParameter("id");
	    String u_pw = request.getParameter("pw");
	    String u_name = request.getParameter("uname");
	    String u_mail = request.getParameter("mail");
	    String u_addr = request.getParameter("addr");
	    String u_tel = request.getParameter("tel");
	    String u_grade = request.getParameter("grade");


	    try {
	        String sql = "UPDATE customer SET pw = ?, uname = ?, mail = ?, addr = ?, tel = ?, grade = ? WHERE id = ?";
	        PreparedStatement sm = conn.prepareStatement(sql);
	        sm.setString(1, u_pw);
	        
	     		// 기존 정보와 수정한 정보 비교 후 업데이트
	        boolean hasUpdates = false; // 업데이트 여부 체크용 변수
	        
	       
	        
	        if (u_name != null) {
	            sm.setString(2, u_name);
	            hasUpdates = true;
	        } else {
	            sm.setString(2, (String) session.getAttribute("userName"));
	        }
	        
	        if (u_mail != null) {
	            sm.setString(3, u_mail);
	            hasUpdates = true;
	        } else {
	            sm.setString(3, (String) session.getAttribute("userMail"));
	        }
	        
	        if (u_addr != null) {
	            sm.setString(4, u_addr);
	            hasUpdates = true;
	        } else {
	            sm.setString(4, (String) session.getAttribute("userAddr"));
	        }
	        
	        if (u_tel != null) {
	            sm.setString(5, u_tel);
	            hasUpdates = true;
	        } else {
	            sm.setString(5, (String) session.getAttribute("userTel"));
	        }
	        
	        if (u_grade != null) {
	            sm.setString(6, u_grade);
	        } else {
	            sm.setString(6, (String) session.getAttribute("userGrade"));
	        }
	        
	        if (hasUpdates) { // 업데이트가 있을 경우에만 실행
	        	sm.setString(7, u_id);

	        	int rowsUpdated = sm.executeUpdate();

	        if (rowsUpdated > 0) {
	            // 성공적으로 수정되었을 때
	            session.setAttribute("userPW", u_pw);
	            session.setAttribute("userMail", u_mail); // 세션에 변경된 이메일 저장
	            session.setAttribute("userAddr", u_addr); // 세션에 변경된 주소 저장
	            session.setAttribute("userTel", u_tel);   // 세션에 변경된 번호 저장
	            out.println("<script>alert('회원 정보 수정이 완료되었습니다.'); </script>");
	            response.sendRedirect("editSuccess.jsp");
	        } else {
                // 수정 실패
                out.println("<script>alert('회원 정보 수정에 실패했습니다.'); history.go(-1);</script>");
            }
	    }
         else {
            // 기존 값과 수정 값이 동일한 경우
            out.println("<script>alert('변경된 내용이 없습니다.'); history.go(-1);</script>");
        }

        sm.close();
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('회원 정보 수정 중 오류가 발생했습니다.'); history.go(-1);</script>");
    } finally {
        conn.close();
    }
	}

	// 로그아웃 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
		session.invalidate();
        response.sendRedirect("../main.jsp"); // Redirect to the main page after logout
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
	        	System.out.println("조회수 증가 처리 완료");
	        }
	        
	        response.sendRedirect("../notice/noticeDetail.jsp?postNumber=" + postNumber);
	    }
	    
	    pstmt.close();
        conn.close();
	}
	
	// 공지사항 등록 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("noticeWrite")) {
		System.out.println("공지사항 등록 처리 시작");
        
        String n_title = request.getParameter("title");
        String n_content = request.getParameter("content");
        n_content = n_content.replace("\n", "<br>"); // 엔터 저장
        

        String sql = "INSERT INTO notice VALUES";
        sql += "(NOTICE_SEQ.NEXTVAL,'" + n_title + "','" + n_content + "', 0 , sysdate)";
        
        pstmt = conn.prepareStatement(sql);
        
        int count = pstmt.executeUpdate();

        if (count == 1) {
        	System.out.println("공지사항 등록 성공!");
            response.sendRedirect("../notice/notice.jsp"); // 공지사항 목록 페이지로 리다이렉트
        } else {
        	System.out.println("공지사항 등록 실패!");
        }
        
        pstmt.close();
        conn.close();
    }
	
	// 공지사항 수정 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("noticeEdit")) {
		System.out.println("공지사항 수정 처리 시작");

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
        	System.out.println("공지사항 수정 성공!");
            response.sendRedirect("../notice/notice.jsp"); 
        } else {
        	System.out.println("공지사항 수정 실패!");
        }

        pstmt.close();
        conn.close();
    }
	
	// 공지사항 삭제 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("noticeDelete")) {
		System.out.println("공지사항 삭제 처리 시작");
	
	    String postNumberParam = request.getParameter("postNumber");
	
	    if (postNumberParam != null) {
	        int postNumber = Integer.parseInt(postNumberParam);
	
	        String deleteSql = "DELETE FROM notice WHERE no = ?";
	        PreparedStatement deleteSm = conn.prepareStatement(deleteSql);
	        deleteSm.setInt(1, postNumber);
	        int deleteResult = deleteSm.executeUpdate();
	
	        if (deleteResult > 0) {
	        	System.out.println("공지사항 삭제 성공!");
	            response.sendRedirect("../notice/notice.jsp"); // 공지사항 목록 페이지로 리다이렉트
	        } else {
	        	System.out.println("공지사항 삭제 실패! ");
	        }
	
	        deleteSm.close();
	    } else {
	        out.println("잘못된 요청입니다.");
	    }
	    
        pstmt.close();
        conn.close();	       
	}
	
	// 리뷰 답글 등록 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("reply")) {
		System.out.println("답글 등록 처리 시작");
		
        int reviewNumber = Integer.parseInt(request.getParameter("rno"));
        String content = request.getParameter("content");

        String sql = "INSERT INTO review_reply VALUES (REVIEW_REPLY_SEQ.NEXTVAL, ?, ?, sysdate)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, reviewNumber);
        pstmt.setString(2, content);

        int count = pstmt.executeUpdate();

        if (count == 1) {
        	System.out.println("답글 등록 성공!");
            response.sendRedirect("/petopia/admin/reviewManagement.jsp"); // 등록 후 페이지로 리다이렉트
        } else {
        	System.out.println("답글 등록 실패!");
        }

        pstmt.close();
        conn.close();
    } 
	
	// 리뷰 삭제 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("deleteReview")) {
		System.out.println("리뷰 삭제 처리 시작");
		
		int reviewNumber = Integer.parseInt(request.getParameter("rno"));
	    
	    String sql = "DELETE FROM review WHERE rno = ?";
	    
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, reviewNumber);
	    
	    int count = pstmt.executeUpdate();
	   
	    if (count == 1) {
        	System.out.println("답글 삭제 성공!");
            response.sendRedirect("/petopia/admin/reviewManagement.jsp"); // 등록 후 페이지로 리다이렉트
        } else {
        	System.out.println("답글 삭제 실패!");
        }

        pstmt.close();
        conn.close();
	}
	
	// 주문 상태 변경 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("updateOrderStatus")) {
	    System.out.println("주문 상태 업데이트 처리 시작");
	
	    int orderNumber = Integer.parseInt(request.getParameter("orderNumber"));
	    int newStatus = Integer.parseInt(request.getParameter("newStatus"));
	
	    // 적절한 SQL 쿼리를 작성하여 주문 상태를 업데이트
	    String sql = "UPDATE product_order SET state = ? WHERE ono = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, newStatus);
	    pstmt.setInt(2, orderNumber);
	
	    int count = pstmt.executeUpdate();
	
	    if (count == 1) {
	        System.out.println("주문 상태 업데이트 성공!");
	        response.sendRedirect("/petopia/admin/orderManagement.jsp");
	    } else {
	        System.out.println("주문 상태 업데이트 실패!");
	    }
	
	    pstmt.close();
	    conn.close();
	}


	//회원 탈퇴 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("withdrawal")) {
	    System.out.println("탈퇴 처리 시작");
	
	    String u_id = request.getParameter("userID");
	    String u_pw = request.getParameter("userPW");
	
	    // 입력한 아이디와 일치하는 사용자 조회
	    String sql = "SELECT * FROM customer WHERE id = ?";
	    PreparedStatement sm = conn.prepareStatement(sql);
	    sm.setString(1, u_id);
	   	rs = sm.executeQuery();
	
	   	if (rs.next()) {
            String dbPW = rs.getString("pw"); // db에 저장된 비밀번호 가져오기

            if (dbPW.equals(u_pw)) { // 비밀번호 일치 - 회원 탈퇴 진행
                String deleteSql = "DELETE FROM customer WHERE id = ?";
                PreparedStatement deleteSm = conn.prepareStatement(deleteSql);
                deleteSm.setString(1, u_id);
                int deletedRows = deleteSm.executeUpdate();
                deleteSm.close();

                if (deletedRows > 0) {
                    // 세션 해제 등의 작업 수행
                    session.invalidate();
                    response.sendRedirect("withdrawalSuccess.jsp");
                } else {
                    response.sendRedirect("withdrawal.jsp");
                }
            } else { // 비밀번호 틀림
                out.println("<script>withdrawErrorPw();</script>");
            }
        } else { // 존재하지 않는 아이디
            out.println("<script>withdrawErrorId();</script>");
        }

        sm.close();
        conn.close();
    
}
%>