package Dao;

import java.util.*;
import Dto.*;

public interface UDao {

	// 장바구니 담기
	public int addCart(String id, int pno, int count);

	// 장바구니 목록
	public ArrayList<CartDTO> cartList(String id);

	// 장바구니에 중복된 상품이 있는지 검색
	public int cartCheck(int pno,String id);

	// 장바구니 상품 수정(수량이 상품재고 수량보다 적어야됨)
	public void cartModify(String id, int count, int pno);

	// 주문페이지 주문내역(상품정보) 장바구니 -> 주문페이지
	public ArrayList<CartDTO> opList(ArrayList<Integer> cno);
	
	//상세페이지 -> 주문페이지
	public ArrayList<CartDTO> oplist(String id, int pno, int count);

	// 주문페이지 회원정보
	public CustomerDTO cInfo(String id);

	// 장바구니 삭제(장바구니에서도 삭제, 주문완료 후 삭제
	public int delete(List<Integer> cnoList);

	// [주문]
	// 주문테이블에 전송
	public int orderInsert(OrderDTO order);

	// 주문상세테이블에 전송
	public void detailInsert(ArrayList<OrderDetailDTO> detailList);

	// 상품 재고 수정
	public void stockModify(ArrayList<OrderDetailDTO> detail); // pno, count만 사용
	
	//회원정보
	public CustomerDTO customerInfo(int uno);
	
	//주문정보(주문내역)
	public ArrayList<OrderDTO> orderList(String id);
	
	//주문상세정보(상품정보)
	public ArrayList<OrderDetailDTO> ProductDetailInfo(long ono);
	
	//리뷰
	//리뷰 등록
	public int reviewRegister(String uid, int pno, String content, int dno);

}