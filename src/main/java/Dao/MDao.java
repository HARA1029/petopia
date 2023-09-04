package Dao;

import Dto.*;
import java.util.*;

public interface MDao {
	
	//상품등록
	public int register(ProductDTO pd);
	
	//상품중복체크
	public int pCheck(String pname);
	
	//상품목록
	public ArrayList<ProductDTO> pList(int cateno, String roll);
	
	//상품검색
	public ArrayList<ProductDTO> sList(String pname);
	
	//상품상세정보
	public ProductDTO pInfo(int pno);
	
	//상품수정
	public void productModify(ProductDTO pd);
	
	//상품삭제
	public int productDelete(int pno);
	
}