package Dao;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DBconn.OracleConn;
import Dto.Customer;
import Dto.Product;

public class ManagerDao implements MDao {
	
	OracleConn DBconn = new OracleConn();
	Connection conn = DBconn.getConn();
	
	//상품등록
	@Override
	public int register(Product pd) {
		
		String sql = "INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL,?,?,?,?,?)";
		 		
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, pd.getPname());
			pst.setInt(2, pd.getPrice());
			pst.setInt(3, pd.getStock());
			pst.setString(4, pd.getImg());
			pst.setInt(5, pd.getCateno());
			
			return pst.executeUpdate(); //오라클 product테이블에 데이터 전송(성공하면 1 return)
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	///상품 중복 체크
	@Override
	public int pCheck(String pname) {
		System.out.println("pname : " + pname);
		String sql = "SELECT PNAME FROM PRODUCT WHERE PNAME = " + "'" + pname + "'"; //등록하려는 상품이 이미 존재하는지 보기
		System.out.println("sql : " + sql);
		int check=0;
		try {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			check = rs.next() ? check : 1; //0 : 중복. 1: 중복x(기존에 없음)
			
		} catch(Exception e) { e.printStackTrace(); }
		return check;
	}
	
	//상품목록
	@Override
	public ArrayList<Product> pList(int cateno) {
		
		String sql="";
		if(cateno==0) { //전체보기
			sql = "SELECT pno, pname, price, img, cateno FROM PRODUCT ORDER BY pno";
		}
		else { //카테고리별 목록 출력
			sql = "SELECT pno, pname, price, img, cateno FROM PRODUCT WHERE CATENO=";
			sql+= cateno + "ORDER BY cateno";
		}
		
		ArrayList<Product> list = new ArrayList<>(); 
		System.out.println("list생성");
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				Product pd = new Product();
				pd.setPno(rs.getInt(1));
				pd.setPname(rs.getString(2));//또는 rs.getString("pname");
				pd.setPrice(rs.getInt(3));
				pd.setImg(rs.getString(4));
				pd.setCateno(rs.getInt(5));
				list.add(pd);
			}
			
		} catch(Exception e) { e.printStackTrace(); }
		
		return list;
	}


}