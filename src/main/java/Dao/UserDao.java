package Dao;

import java.sql.*;

import java.util.*;
import DBconn.*;
import Dto.*;

public class UserDao implements UDao {
    
	OracleConn DBconn = new OracleConn();
	Connection conn = DBconn.getConn();

	// 장바구니 담기
	@Override
	public int addCart(String id, int pno, int count) {
		
		System.out.println("cartDao들어옴");
		System.out.println("user id : " + id);
		String SQL = "SELECT UNO FROM CUSTOMER WHERE ID = '" + id + "'"; //회원번호 찾기
		String sql = "INSERT INTO CART VALUES(CART_SEQ.NEXTVAL,?,?,?)";
		
		int uno=0;
		int check = -1; // 실패하면 -1

		try {
			System.out.println("일단 db는 들어옴");
			
			//회원번호 찾기
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(SQL);
			
			while (rs.next()) {
				uno = rs.getInt(1); //회원번호
			}
			
			//장바구니에 저장
			PreparedStatement pst = conn.prepareStatement(sql);
			System.out.println("uno : " + uno);
			pst.setInt(1, uno); // 회원번호
			pst.setInt(2, pno); // 상품번호
			pst.setInt(3, count); // 총 구매 수량

			check = pst.executeUpdate(); // 오라클 product테이블에 데이터 전송(성공하면 1 return)

			pst.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return check; // -1은 실패 나머지는 성공
	}

	// 장바구니 목록
	@Override
	public ArrayList<CartDTO> cartList(String id) {
		
		String sql = "SELECT C.CNO, P.IMG, P.PNAME, P.PRICE, C.COUNT, C.UNO, C.PNO, CATE.CATENAME " +
	             "FROM CART C " +
	             "JOIN PRODUCT P ON C.PNO = P.PNO " +
	             "JOIN CATEGORY CATE ON P.CATENO = CATE.CATENO " +
	             "WHERE C.UNO = (SELECT UNO FROM CUSTOMER WHERE ID='" + id + "')" +
	             "ORDER BY C.CNO";

		ArrayList<CartDTO> cartList = new ArrayList<>();

		try {

			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) {
				CartDTO cart = new CartDTO();

				cart.setCno(rs.getInt(1)); // 장바구니 번호
				String imgName = rs.getString(2).split(",")[0]; // 상품이미지(가장 첫번째 사진)
				cart.setPname(rs.getString(3)); // 상품명
				cart.setPrice(rs.getInt(4)); // 상품가격
				cart.setCount(rs.getInt(5)); // 장바구니에 담긴 상품수량
				cart.setUno(rs.getInt(6)); // 회원번호
				cart.setPno(rs.getInt(7)); // 상품번호
				
				//상품이미지를 불러오기 위해서 상품 경로를 카테고리로 설정
				String category = rs.getString(8).replace("/", "");
				imgName = category + "/" + imgName;
				
				cart.setImg(imgName);
				
				cartList.add(cart); // 리스트에 넣기
			}

			sm.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("장바구니목록임니다.");
		return cartList;
	}

	// 장바구니 상품 존내 유무 확인
	@Override
	public int cartCheck(int pno, String id) {

		// 장바구니에 담으려는 상품이 존재하는지 확인
		String sql = "SELECT (P.STOCK - C.COUNT) REST_STOCK FROM CART C, PRODUCT P WHERE C.PNO = P.PNO AND C.PNO ="
				+ pno + " AND C.UNO = (SELECT UNO FROM CUSTOMER WHERE ID = '"+ id + "')";

		int restStock = -1; // 장바구니에 상품이 없으면 -1

		try {

			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) { // 이미 장바구니에 상품이 존재하면 (상품재고-장바구니담긴 상품수량)을 리턴(로그인한 회원의)
				restStock = rs.getInt(1); // 상품재고-장바구니담은 수량(0이상이면 장바구니에 상품이 존재하고 나머지 재고를 리턴)
			}

			sm.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("재고-장바구니 수량 : " + restStock);

		return restStock; // -1이면 상품이 존재 X, 0이상이면 상품이 존재하고 재고를 리턴

	}

	// 장바구니 수정(+기존에 상품존재시 재고만 증가)
	@Override
	public void cartModify(String id, int count, int pno) {

		String sql = "UPDATE CART SET COUNT = COUNT + ? WHERE PNO = ? AND "
				+ "UNO = (SELECT UNO FROM CUSTOMER WHERE ID = ?)"; // 기존 장바구니수량 + 새로 담을 장바구니 수량

		try {

			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setInt(1, count); // 첫 번째 매개변수에는 count를 설정
			pst.setInt(2, pno); // 두 번째 매개변수에는 pno를 설정
			pst.setString(3, id); //세 번째 매개변수에는 id를 설정

			pst.executeUpdate();

			pst.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("장바구니 재고 수량 변경 적용 완료!");
	}

	// 주문페이지 주문내역(상품정보) 장바구니 -> 주문페이지로 이동
	@Override
	public ArrayList<CartDTO> opList(ArrayList<Integer> cno) {

		ArrayList<CartDTO> list = new ArrayList<>();

		try {
			Statement sm = conn.createStatement();

			for (int cNo : cno) {
				System.out.println("장바구니 번호 : " + cNo);

				/*
				 * String sql =
				 * "SELECT C.CNO, P.IMG, P.PNAME, P.PRICE, C.COUNT, C.UNO, C.PNO FROM CART C, PRODUCT P "
				 * + "WHERE C.PNO = P.PNO AND C.CNO = " + no;
				 */
				String sql = "SELECT C.CNO, P.IMG, P.PNAME, P.PRICE, C.COUNT, C.UNO, C.PNO, CATE.CATENAME "
				           + "FROM CART C "
				           + "JOIN PRODUCT P ON C.PNO = P.PNO "
				           + "JOIN CATEGORY CATE ON P.CATENO = CATE.CATENO "
				           + "WHERE C.CNO = " + cNo;

				ResultSet rs = sm.executeQuery(sql);

				while (rs.next()) {

					CartDTO dto = new CartDTO();

					dto.setCno(rs.getInt(1)); // 장바구니 번호
					String img = rs.getString(2).split(",")[0]; // 상품이미지(무조건 첫번째 이미지만)
					dto.setPname(rs.getString(3)); // 상품명
					dto.setPrice(rs.getInt(4)); // 상품가격
					dto.setCount(rs.getInt(5)); // 장바구니에 담긴 상품수량
					dto.setUno(rs.getInt(6)); // 회원번호
					dto.setPno(rs.getInt(7)); // 상품번호
					
					String cateName = rs.getString(8).replace("/", "");
					img = cateName + "/" + img;
					dto.setImg(img);

					list.add(dto); // 장바구니 상품 리스트에 넣기
				}
			}

//			sm.close();
//			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("된다.");
		return list;
	}
	
	//상세페이지 -> 주문페이지 바로 이동
	@Override
	public ArrayList<CartDTO> oplist(String id, int pno, int count) {
		
		String sql = "SELECT P.IMG, P.PNAME, P.PRICE, CATE.CATENAME, C.UNO "
				+ "FROM PRODUCT P, CUSTOMER C, CATEGORY CATE "
				+ "WHERE P.CATENO = CATE.CATENO AND P.PNO = " + pno
				+ "AND C.ID = '" + id + "'";
		
		ArrayList<CartDTO> list = new ArrayList<>();

		try {
			Statement sm = conn.createStatement();

			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) {

				CartDTO dto = new CartDTO();
				
				dto.setCno(0); //상세페이지에서 바로 주문페이지 갈 경우 장바구니 번호는 0으로 지정
				String img = rs.getString(1).split(",")[0]; // 상품이미지(무조건 첫번째 이미지만)
				dto.setPname(rs.getString(2)); // 상품명
				dto.setPrice(rs.getInt(3)); // 상품가격
				dto.setCount(count); // 장바구니에 담긴 상품수량
				dto.setUno(rs.getInt(5)); // 회원번호
				dto.setPno(pno); // 상품번호
				
				String cateName = rs.getString(4).replace("/", "");
				img = cateName + "/" + img;
				dto.setImg(img);

				list.add(dto); // 장바구니 상품 리스트에 넣기
			}
			

			sm.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("된다.");
		return list;
	}

	// 주문페이지 회원정보 
	@Override
	public CustomerDTO cInfo(String id) {

		String sql = "SELECT * FROM CUSTOMER WHERE ID = '" + id +"'";

		CustomerDTO customer = new CustomerDTO();

		try {

			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) {
				customer.setUno(rs.getInt(1));
				customer.setUname(rs.getString(2));
				customer.setId(rs.getString(3));
				customer.setPw(rs.getString(4));
				customer.setMail(rs.getString(5));
				customer.setAddr(rs.getString(6));
				customer.setTel(rs.getString(7));
				customer.setGrade(rs.getString(8));
			}

//			sm.close();
//			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return customer;

	}

	// 장바구니 삭제
	@Override
	public int delete(List<Integer> cnoList) {

		String sql = "DELETE FROM CART WHERE cno = ? ";

		int check = -1;

		try {

			PreparedStatement pst = conn.prepareStatement(sql);

			for (int cno : cnoList) {
				pst.setInt(1, cno); // ? 에 해당하는 값 설정
				check = pst.executeUpdate(); // 장바구니 삭제
			}

//			pst.close();
//			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return check;
	}

	// 주문테이블에 전송 + 회원등급 수정
	@Override
	public int orderInsert(OrderDTO order) {
		
		System.out.println("주문테이블 전송 dao 들어옴");
 
		String sql = "INSERT INTO PRODUCT_ORDER INFO(ONO, UNO, TITLE, TOTAL, STATE, MESSAGE) VALUES(?,?,?,?,?,?)";
		
		String SQL = "SELECT COUNT(*) FROM PRODUCT_ORDER WHERE UNO = " + order.getUno();
		
		String Sql = "UPDATE CUSTOMER SET GRADE = ? WHERE UNO = ?";

		int check = -1; // 실패하면 -1
		
		try {

			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setLong(1, order.getOno()); // 주문번호
			pst.setInt(2, order.getUno()); // 회원번호
			pst.setString(3, order.getTitle()); // 타이틀
			pst.setInt(4, order.getTotal()); // 총 주문금액
			pst.setInt(5, order.getState()); // 주문상태
			pst.setString(6, order.getMessage()); // 배송메시지

			check = pst.executeUpdate(); // 오라클 product테이블에 데이터 전송(성공하면 1 return)
			
			if(check == 1) { //주문테이블 전송 성공
				
				Statement sm = conn.createStatement();
				ResultSet rs = sm.executeQuery(SQL);

				while (rs.next()) { //구매횟수 구해서 등급 조정
				
					int purchase = rs.getInt(1); //총 구매횟수
					String grade = purchase==1 ? "B" : "A"; //일단 최소 1개부터는 B등급 2개이상은 A
					
					pst = conn.prepareStatement(Sql); //회원등급 수정
					pst.setString(1,grade);
					pst.setInt(2, order.getUno());
					
					check = pst.executeUpdate(); //회원등급 수정
					
				}
			}

//			pst.close(); -> 뒤에서 마지막 데이터베이스 사용하는 곳에서 닫을거
//			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check; // -1은 실패 나머지는 성공

	}

	// 주문상세테이블에 전송
	@Override
	public void detailInsert(ArrayList<OrderDetailDTO> detailList) {

		String sql = "INSERT INTO DETAIL VALUES(DETAIL_SEQ.NEXTVAL,?,?,?)";

		try {

			PreparedStatement pst = conn.prepareStatement(sql);
			
			for(OrderDetailDTO detail : detailList) {
				
				pst.setLong(1,detail.getOno()); // 주문번호
				pst.setInt(2, detail.getPno()); // 상품번호
				pst.setInt(3, detail.getCount()); // 주문 개수
				
				pst.executeUpdate(); // 오라클 product테이블에 데이터 전송(성공하면 1 return)
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// 상품 재고 수정
	@Override
	public void stockModify(ArrayList<OrderDetailDTO> detail) { // pno, count만 사용
		
		String sql = "UPDATE PRODUCT SET STOCK = STOCK - ? WHERE PNO = ?"; // 기존 상품수량 - 구매 수량
		

		try {

			PreparedStatement pst = conn.prepareStatement(sql);
			
			for(OrderDetailDTO dto : detail) {
				
				pst.setInt(1,dto.getCount()); // 주문개수
				pst.setInt(2, dto.getPno()); // 상품번호
				
				pst.executeUpdate(); // 오라클 product테이블에 데이터 전송(성공하면 1 return)
				
			}

//			pst.close(); 
//			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	//회원정보
	@Override
	public CustomerDTO customerInfo(int uno) {
		
		String sql = "SELECT UNAME, ID, PW, MAIL, ADDR, TEL, GRADE, ZIPCODE FROM CUSTOMER WHERE UNO = " + uno;
		
		CustomerDTO cusdto = new CustomerDTO();
		
		try {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) {
				cusdto.setUno(uno);
				cusdto.setUname(rs.getString(1));
				cusdto.setId(rs.getString(2));
				cusdto.setPw(rs.getString(3));
				cusdto.setMail(rs.getString(4));
				cusdto.setAddr(rs.getString(5));
				cusdto.setTel(rs.getString(6));
				cusdto.setGrade(rs.getString(7));
				cusdto.setZipcode(rs.getInt(8));
			}
			
			sm.close(); 
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return cusdto;
	}
	
	
	//주문내역
	@Override
	public ArrayList<OrderDTO> orderList(String id) {
		
		String sql = "SELECT ONO, UNO, TITLE, TOTAL, ORDERDATE, STATE, MESSAGE "
				   + "FROM PRODUCT_ORDER WHERE UNO = (SELECT UNO FROM CUSTOMER WHERE ID = '" + id + "') "
				   + "ORDER BY ORDERDATE";
		
		ArrayList<OrderDTO> orderList = new ArrayList<>();
		
		try {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) {
				OrderDTO dto = new OrderDTO();
				
				dto.setOno(rs.getLong(1)); //회원번호
				dto.setUno(rs.getInt(2));
				dto.setTitle(rs.getString(3)); //주문 타이틀 
				dto.setTotal(rs.getInt(4)); //총 주문금액
				dto.setOrderdate(rs.getDate(5)); //주문일
				dto.setState(rs.getInt(6)); //주문상태
				dto.setMessage(rs.getString(7)); //배송메시지
				
				orderList.add(dto);
				
			}
			sm.close(); 
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return orderList;
	}
	
	//주문 상세 정보
	@Override
	public ArrayList<OrderDetailDTO> ProductDetailInfo(long ono) {
		
		String sql = "SELECT D.DNO, D.COUNT, P.PNO, P.PNAME, P.PRICE, P.IMG, C.CATENAME "
				   + "FROM DETAIL D, PRODUCT P, CATEGORY C "
				   + "WHERE D.PNO = P.PNO AND C.CATENO = P.CATENO AND D.ONO = " + ono;
		
		ArrayList<OrderDetailDTO> odList = new ArrayList<>();
		
		try {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			while (rs.next()) {
				
				OrderDetailDTO odDto = new OrderDetailDTO();
				
				odDto.setDno(rs.getInt(1));
				odDto.setOno(ono);
				odDto.setCount(rs.getInt(2));
				odDto.setPno(rs.getInt(3));
				odDto.setPname(rs.getString(4));
				odDto.setPrice(rs.getInt(5));
				
				String img = rs.getString(6).split(",")[0]; // 처음 index 자리 이미지 명만 저장
				String category = rs.getString(7).replace("/", "");
				img = category + "/" +img; //이미지 경로
				
				odDto.setImg(img);
				
				odList.add(odDto);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return odList;
	}

}