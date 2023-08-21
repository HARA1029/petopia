package Dao;

import java.sql.*;

import java.util.*;
import DBconn.*;
import Dto.*;

public class UserDao implements UDao {
	
	OracleConn DBconn = new OracleConn();
	Connection conn = DBconn.getConn();
	
	//장바구니 담기
	@Override
	public int addCart(int uno, int pno, int count) {
		System.out.println("cartDao들어옴");
		
		String sql = "INSERT INTO CART VALUES(CART_SEQ.NEXTVAL,?,?,?)";
		int check = -1; //실패하면 -1
		
		try {	
			System.out.println("일단 db는 들어옴");
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, uno); //회원번호
			pst.setInt(2, pno); //상품번호
			pst.setInt(3, count); //총 구매 수량
			
			check = pst.executeUpdate(); //오라클 product테이블에 데이터 전송(성공하면 1 return)
			
			pst.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return check; //-1은 실패 나머지는 성공
	}
	
	//장바구니 목록
	@Override
	public ArrayList<Cart> cartList() {
		
		String sql = "SELECT C.CNO, P.IMG, P.PNAME, P.PRICE, C.COUNT, C.UNO, C.PNO FROM CART C, PRODUCT P "
				+ "WHERE C.PNO = P.PNO ORDER BY C.CNO";
		
		ArrayList<Cart> cartList = new ArrayList<>();
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				Cart cart = new Cart();
				
				cart.setCno(rs.getInt(1)); //장바구니 번호
				cart.setImg(rs.getString(2)); //상품이미지
				cart.setPname(rs.getString(3)); //상품명
				cart.setPrice(rs.getInt(4)); //상품가격
				cart.setCount(rs.getInt(5)); //장바구니에 담긴 상품수량
				cart.setUno(rs.getInt(6)); //회원번호
				cart.setPno(rs.getInt(7)); //상품번호
				
				cartList.add(cart); //리스트에 넣기
			}
			
			sm.close();
			conn.close();	
			
		}catch(Exception e) { 
			e.printStackTrace();
		}
		for(Cart cart : cartList) {
			System.out.println(cart.getPname());
		}
		System.out.println("장바구니목록임니다.");
		return cartList;
	}
	
	//장바구니 상품 존내 유무 확인
	@Override
	public int cartCheck(int pno) {
		
		//장바구니에 담으려는 상품이 존재하는지 확인
		String sql = "SELECT (P.STOCK - C.COUNT) REST_STOCK FROM CART C, PRODUCT P WHERE C.PNO = P.PNO AND C.PNO =" + pno;
		
		int restStock = -1; //장바구니에 상품이 없으면 -1
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) { //이미 장바구니에 상품이 존재하면 (상품재고-장바구니담긴 상품수량)을 리턴
				restStock = rs.getInt(1); //상품재고-장바구니담은 수량(0이상이면 장바구니에 상품이 존재하고 나머지 재고를 리턴)
			}
			
			sm.close();
	        conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		
		System.out.println("재고-장바구니 수량 : " + restStock);
		
		return restStock; //-1이면 상품이 존재  X, 0이상이면 상품이 존재하고 재고를 리턴	
		
	}
	
	//장바구니 수정(+기존에 상품존재시 재고만 증가)
	@Override
	public void cartModify(int count, int pno) {
		
		String sql = "UPDATE CART SET COUNT = COUNT + ? WHERE PNO = ?"; //기존 장바구니수량 + 새로 담을 장바구니 수량
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
	
		    pst.setInt(1, count); // 첫 번째 매개변수에는 count를 설정
		    pst.setInt(2, pno);   // 두 번째 매개변수에는 pno를 설정
			
		    pst.executeUpdate();
		    
			pst.close();
	        conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		
		System.out.println("장바구니 재고 수량 변경 적용 완료!");
	}

}