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
		
		System.out.println("상품등록 dao에 들어옴");
		String sql = "INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL,?,?,?,?,?)";
		 
		int check = -1;
		
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, pd.getPname());
			pst.setInt(2, pd.getPrice());
			pst.setInt(3, pd.getStock());
			pst.setString(4, pd.getImg());
			pst.setInt(5, pd.getCateno());
			
			check = pst.executeUpdate(); //오라클 product테이블에 데이터 전송(성공하면 1 return)
			
			pst.close();
	        conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		return -1;
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
	public ArrayList<Product> pList(int cateno) {
		
		String sql="";
		
		if(cateno==0) { //전체보기
			sql = "SELECT * FROM PRODUCT ORDER BY pno";
		}
		else { //카테고리별 목록 출력
			sql = "SELECT * FROM PRODUCT WHERE CATENO=";
			sql+= cateno + "ORDER BY cateno";
		}
		
		ArrayList<Product> list = new ArrayList<>(); 
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				Product pd = new Product();
				pd.setPno(rs.getInt(1));
				pd.setPname(rs.getString(2));//또는 rs.getString("pname");
				pd.setPrice(rs.getInt(3));
				pd.setStock(rs.getInt(4));
				pd.setImg(rs.getString(5));
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
	public ArrayList<Product> sList(String pname) {
		
		String sql = "SELECT * FROM PRODUCT WHERE PNAME LIKE '%" + pname + "%'";
		ArrayList<Product> list = new ArrayList<>(); 
		
		try {
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			
			while(rs.next()) {
				Product pd = new Product();
				pd.setPno(rs.getInt(1));
				pd.setPname(rs.getString(2));//또는 rs.getString("pname");
				pd.setPrice(rs.getInt(3));
				pd.setStock(rs.getInt(4));
				pd.setImg(rs.getString(5));
				pd.setCateno(rs.getInt(6));
				list.add(pd);
			}
			
			sm.close();
			conn.close();
			
		} catch(Exception e) { e.printStackTrace(); }
		
		System.out.println("list : " + list);
		return list;
	}

	//상품상세정보
	@Override
	public Product pInfo(int pno) {
		
		String sql = "SELECT * FROM PRODUCT WHERE PNO =" + pno;
		
		Product pd = new Product();
		
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
			}
			
			sm.close();
			conn.close();
		} catch(Exception e) { e.printStackTrace(); }
		
		System.out.println("일단 성공함");
		
		return pd;
	}
	
	//상품수정
	@Override
	public void productModify(Product pd) {
		
		String sql = "UPDATE PRODUCT SET PRICE=?, STOCK=?, IMG=?,CATENO=? WHERE PNO="+pd.getPno(); //기존 장바구니수량 + 새로 담을 장바구니 수량
		
		try {
			
			PreparedStatement pst = conn.prepareStatement(sql);
	
		    //pst.setString(1, pd.getPname()); // 첫 번째 매개변수에는 pname
		    pst.setInt(1, pd.getPrice());   // 두 번째 매개변수에는 price 순서대로 작성
		    pst.setInt(2, pd.getStock());
		    pst.setString(3, pd.getImg());
		    pst.setInt(4, pd.getCateno());
			
		    pst.executeUpdate();
		    
			pst.close();
	        conn.close();
			
		} 
		catch(Exception e) { e.printStackTrace(); }
		
		System.out.println("상품수정완료");
		
	}

}