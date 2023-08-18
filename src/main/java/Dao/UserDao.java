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
	public int addCart(Cart cart) {
		System.out.println("cartDao들어옴");
		
		String sql = "INSERT INTO CART VALUES(CART_SEQ.NEXTVAL,?,?,?)";
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setInt(1, cart.getUno()); //회원번호
			pst.setInt(2, cart.getPno()); //상품번호
			pst.setInt(3, cart.getCount()); //총 주문수량
			
			conn.close();
			
			return pst.executeUpdate(); //오라클 product테이블에 데이터 전송(성공하면 1 return)
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	//장바구니 목록
	@Override
	public ArrayList<Cart> cartList() {
		// TODO Auto-generated method stub
		return null;
	}


}