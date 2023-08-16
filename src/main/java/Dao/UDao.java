package Dao;

import java.util.*;
import Dto.*;

public interface UDao {
	
	//회원가입
	public int insert(Customer cus);
	
	//회원목록
	public ArrayList<Customer> list();

}