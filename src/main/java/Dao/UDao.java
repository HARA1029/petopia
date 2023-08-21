package Dao;

import java.util.*;
import Dto.*;

public interface UDao {
	
	//장바구니 담기
	public int addCart(int uno, int pno, int count);
	
	//장바구니 목록
	public ArrayList<Cart> cartList();
	
	//장바구니에 중복된 상품이 있는지 검색
	public int cartCheck(int pno);
	
	//장바구니 상품 수정(수량이 상품재고 수량보다 적어야됨)
	public void cartModify(int count, int pno);

}