<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbConn.jsp" %>
<script src="../js/function.js"></script>
<%
	request.setCharacterEncoding("UTF-8");

 	// 아이디 중복 확인
	 if (request.getParameter("action") != null && request.getParameter("action").equals("checkID")){
		 String u_id = request.getParameter("id");
		 
		 String sql = "SELECT * FROM customer WHERE id = ?";
		    PreparedStatement sm = conn.prepareStatement(sql);
		    sm.setString(1, u_id);
		    ResultSet rs = sm.executeQuery();
		
		    if (rs.next()) {
		    	out.println("중복된 id입니다.");
		    }
		    else{
		    	 out.println("사용 가능한 id입니다.");
		    }
		 
		    sm.close();
	        conn.close();
	        return;
	 }

    // 회원 가입 처리
    if (request.getParameter("action") != null && request.getParameter("action").equals("signup")) {
        out.println("회원가입 처리 시작");
        
        String u_name = request.getParameter("uname");
        String u_id = request.getParameter("id");
        String u_pw = request.getParameter("pw");
        String u_mail = request.getParameter("mail");
        String u_addr = request.getParameter("addr");
        String u_tel = request.getParameter("tel");
        String u_grade = request.getParameter("grade");

        String sql = "INSERT INTO customer VALUES";
        sql += "(CUSTOMER_SEQ.NEXTVAL,'" + u_name + "','" + u_id + "','" + u_pw + "','" + u_mail + "','" + u_addr + "','" + u_tel + "','" + u_grade + "')";

        Statement sm = conn.createStatement();

        int count = sm.executeUpdate(sql);

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
            //response.sendRedirect("signup.jsp");
        }
        sm.close();
        conn.close();
    }

	//로그인 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("login")) {
	    System.out.println("로그인 처리 시작");
	
	    String u_id = request.getParameter("userID");
	    String u_pw = request.getParameter("userPW");
	
	    // 입력한 아이디와 일치하는 사용자 조회
	    String sql = "SELECT * FROM customer WHERE id = ?";
	    PreparedStatement sm = conn.prepareStatement(sql);
	    sm.setString(1, u_id);
	    ResultSet rs = sm.executeQuery();
	
	    if (rs.next()) {
	        String dbPW = rs.getString("pw"); // db에 저장된 비밀번호 가져오기
	
	        if (dbPW.equals(u_pw)) { // 로그인 성공 -> 세션에 저장
	        	
	            session.setAttribute("userID", u_id);
	        
	            String name = rs.getString("uname");
	            session.setAttribute("userName", name);	    
	            
	            String grade = rs.getString("grade");
	            session.setAttribute("userGrade", grade);	  
	            
	            response.sendRedirect("main.jsp");
	        } else { // 비번 틀림
	        	out.println("<script>loginerror1();</script>");
	        }
	    } else { // 존재하지 않는 아이디
	    	out.println("<script>loginerror2();</script>");
	    }
	
	    sm.close();
	    conn.close();
	}
	
	// 로그아웃 처리
	if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
        session.invalidate();
        response.sendRedirect("main.jsp"); // Redirect to the main page after logout
    }
	
	// 세션 test
	if (request.getParameter("action") != null && request.getParameter("action").equals("test")) {
		
		String sessionID = (String) session.getAttribute("userID");
		
		String sql = "SELECT id, pw, uname FROM customer WHERE id = ?";
		PreparedStatement sm = conn.prepareStatement(sql);
    	sm.setString(1, sessionID);
	    ResultSet rs = sm.executeQuery();
	     
	    String str ="";
	    if (rs.next()){
	    	str = rs.getString("id") + " / " + rs.getString("pw") + " / " + rs.getString("uname");
	    }	    
		
	    out.print(str);
		
	}
	
%>