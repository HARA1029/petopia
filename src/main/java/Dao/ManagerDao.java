package Dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import DBconn.OracleConn;
import Dto.*;

public class ManagerDao implements MDao {
	
	OracleConn DBconn = new OracleConn();
	Connection conn = DBconn.getConn();

	//상품등록
	@Override
	public int register(ProductDTO pd) {
		
		String sql = "INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL,?,?,?,?,?,?)";
		 
		int check = -1;
		
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, pd.getPname());
			pst.setInt(2, pd.getPrice());
			pst.setInt(3, pd.getStock());
			pst.setString(4, pd.getImg());
			pst.setInt(5, pd.getCateno());
			pst.setInt(6, pd.getSell());
			
			check = pst.executeUpdate(); //오라클 product테이블에 데이터 전송(성공하면 1 return)
			
			pst.close();
	        conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return check;
	}
	
	///상품 중복 체크
	@Override
	public int pCheck(String pname) {

		String sql = "SELECT PNAME FROM PRODUCT WHERE PNAME = " + "'" + pname + "'"; //등록하려는 상품이 이미 존재하는지 보기

		int check=0;
		
		try {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			check = rs.next() ? check : 1; //0 : 중복. 1: 중복x(기존에 없음)
			
			sm.close();
	        conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		return check;
	}
	
	//상품목록
	@Override
	public ArrayList<ProductDTO> pList(int cateno, String roll) {
		
		String sql="";
		
		if(roll.equals("kosa")) { //관리자
			
			if(cateno==0) { //전체보기
				sql = "SELECT * FROM PRODUCT ORDER BY pno";
			}
			else { //카테고리별 목록 출력
				sql = "SELECT * FROM PRODUCT WHERE CATENO=";
				sql+= cateno + "ORDER BY cateno";
			}
		}
		
		else { //일반회원 또는 비로그인
			if(cateno==0) { //전체보기(판매중인상품)
				sql = "SELECT * FROM PRODUCT WHERE SELL=1 ORDER BY pno";
			}
			else { //카테고리별 목록 출력(판매중인상품)
				sql = "SELECT * FROM PRODUCT WHERE CATENO=";
				sql+= cateno + "AND SELL=1 ORDER BY cateno";
			}
		}
		
		ArrayList<ProductDTO> list = new ArrayList<>(); 
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				ProductDTO pd = new ProductDTO();
				pd.setPno(rs.getInt(1));
				pd.setPname(rs.getString(2));//또는 rs.getString("pname");
				pd.setPrice(rs.getInt(3));
				pd.setStock(rs.getInt(4));
				pd.setImg(rs.getString(5).split(",")[0]);
				pd.setCateno(rs.getInt(6));
				list.add(pd);
			}
			
			sm.close();
			conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		
		
		return list;
	}
	
	//상품검색
	@Override
	public ArrayList<ProductDTO> sList(String pname) {
		
		//테이블
		String sql = "SELECT * FROM PRODUCT WHERE PNAME LIKE '%" + pname + "%' AND SELL=1";
		
		ArrayList<ProductDTO> list = new ArrayList<>(); 
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				ProductDTO pd = new ProductDTO();
				pd.setPno(rs.getInt(1));
				pd.setPname(rs.getString(2));//또는 rs.getString("pname");
				pd.setPrice(rs.getInt(3));
				pd.setStock(rs.getInt(4));
				pd.setImg(rs.getString(5).split(",")[0]);
				pd.setCateno(rs.getInt(6));
				list.add(pd);
			}
			
			sm.close();
			conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		
		return list;
	}

	//상품상세정보
	@Override
	public ProductDTO pInfo(int pno) {
		
		//테이블
		String sql = "SELECT * FROM PRODUCT WHERE PNO =" + pno;
		
		ProductDTO pd = new ProductDTO();
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				pd.setPno(rs.getInt(1));
				pd.setPname(rs.getString(2));//또는 rs.getString("pname");
				pd.setPrice(rs.getInt(3));
				pd.setStock(rs.getInt(4));
				pd.setImg(rs.getString(5));
				pd.setCateno(rs.getInt(6));
				pd.setSell(rs.getInt(7));
			}
			
//			sm.close();
//			conn.close();
		} catch(Exception e) { e.printStackTrace(); }
		
		return pd;
	}
	
	//상품수정
	@Override
	public void productModify(ProductDTO pd) {
		
		String sql = "UPDATE PRODUCT SET PRICE=?, STOCK=?, IMG=?,CATENO=?, SELL=? WHERE PNO="+pd.getPno(); //기존 장바구니수량 + 새로 담을 장바구니 수량
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
	
		    //pst.setString(1, pd.getPname()); // 첫 번째 매개변수에는 pname
		    pst.setInt(1, pd.getPrice());   // 두 번째 매개변수에는 price 순서대로 작성
		    pst.setInt(2, pd.getStock());
		    pst.setString(3, pd.getImg());
		    pst.setInt(4, pd.getCateno());
		    pst.setInt(5, pd.getSell());
			
		    pst.executeUpdate();
		    
			pst.close();
	        conn.close();
			
		}
		catch(Exception e) { e.printStackTrace(); }
		
		System.out.println("상품수정완료");
		
	}

	//상품삭제
	@Override
	public int productDelete(int pno) {
		
		//테이블
		//String sql = "DELETE FROM PRODUCT WHERE pno = ?";
		
		//뷰
		String sql = "DELETE FROM PRODUCTVIEW WHERE pno = ?";
		
		int check = -1;
		
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
        	pst.setInt(1, pno); // ? 에 해당하는 값 설정
        	
        	check = pst.executeUpdate();
        	
        	pst.close();
	        conn.close();
        	
		}
		catch(Exception e) { e.printStackTrace(); }
		
		return check;
	}

	//리뷰정보
	@Override
	public ArrayList<ReviewDTO> reviewInfo(int pno) {
		
		String sql = "SELECT RNO, UNO, CONTENT, NOWDATE "
				   + "FROM REVIEW "
				   + "WHERE PNO = " + pno + "ORDER BY RNO";
		
		ArrayList<ReviewDTO> review = new ArrayList<>(); //리뷰정보 리스트
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				
				ReviewDTO reviewdto = new ReviewDTO(); //리뷰정보
				ArrayList<ReplyDTO> replyList = new ArrayList<>(); //해당 리뷰 답글 리스트
				
				reviewdto.setRno(rs.getInt(1));
				reviewdto.setUno(rs.getInt(2));
				reviewdto.setContent(rs.getString(3));
				reviewdto.setNowdate(rs.getDate(4));
				reviewdto.setPno(pno);
				
				MDao mdao = new ManagerDao();
				replyList = mdao.replyInfo(reviewdto.getRno());
				
				reviewdto.setReply(replyList); //리뷰정보에서 답글정보에 해당 답글 리스트 추가
				
				review.add(reviewdto); // 리뷰정보리스트에 추가
				
			}
			
			sm.close();
			conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		
		return review;
	}
	
	//리뷰답글정보
	@Override
	public ArrayList<ReplyDTO> replyInfo(int rno) {
		
		String sql = "SELECT ANO, CONTENT, NOWDATE "
				   + "FROM REVIEW_REPLY "
				   + "WHERE RNO = " + rno + "ORDER BY NOWDATE DESC";
		
		ArrayList<ReplyDTO> replyList = new ArrayList<>();
		
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				
				ReplyDTO replydto = new ReplyDTO();
				
				replydto.setAno(rs.getInt(1));
				replydto.setRno(rno);
				replydto.setContent(rs.getString(2));
				replydto.setNowdate(rs.getDate(3));
				
				replyList.add(replydto);
				replyList.add(replydto);
				
			}
			
		} catch(Exception e) { e.printStackTrace();}
				
		
		return replyList;
	}

}