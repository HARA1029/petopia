package Dao;

import java.util.*;
import Dto.*;

public interface UDao {
	
	//장바구니 담기
	public int addCart(Cart cart);
	
	//장바구니 목록
	public ArrayList<Cart> cartList();

}