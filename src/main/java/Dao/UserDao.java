package Dao;

import java.sql.*;
import java.util.*;
import DBconn.*;
import Dto.*;

public class UserDao implements UDao {
	
	OracleConn DBconn = new OracleConn();
	Connection conn = DBconn.getConn();

	@Override
	public int insert(Customer cus) {
		String sql = "INSERT INTO CUSTOMER VALUES(CUSTOMER_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		//String sql = "INSERT INTO CUSTOMER VALUES"; 위와 같은 방식
		//sql += "(CUSTOMER_SEQ.NEXTVAL,'" + u.getUname() + "','" + u.getId() + "','" +
		//		 u.getPw() + "','" + u.getMail() + "','" + u.getAddr() + "','" + u.getTel() + "','" + u.getGrade() + "')";
		 		
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, cus.getUname());
			pst.setString(2, cus.getId());
			pst.setString(3, cus.getPw());
			pst.setString(4, cus.getMail());
			pst.setString(5, cus.getAddr());
			pst.setString(6, cus.getTel());
			pst.setString(7, cus.getGrade());
			
			return pst.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public ArrayList<Customer> list() {
		String sql = "SELECT uname, id FROM CUSTOMER ORDER BY UNO";
		ArrayList<Customer> list = new ArrayList<>();
		
		try {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);
			while(rs.next()) {
				Customer cus = new Customer();
				cus.setUname(rs.getString(1)); //또는 rs.getString("uname");
				cus.setId(rs.getString(2));
				list.add(cus);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
