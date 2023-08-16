package Dao;

import Dto.*;
import java.util.*;

public interface MDao {
	
	//상품등록
	public int register(Product pd);
	
	//상품중복체크
	public int pCheck(String pname);
	
	//상품목록
	public ArrayList<Product> pList(int cateno);
	
}