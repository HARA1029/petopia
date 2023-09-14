package Dto;

import java.util.Date;

public class OrderDTO {
	
	private long ono; //주문번호(pk)
	private int uno; //회원번호(fk)
	private String title; //주문제목
	private int total; //총 주문금액
	private Date orderdate; //주문일
	private int state; //주문상태(0:결제완료, 1:배송완료)
	private String message; //배송 메시지
	
	public OrderDTO() {
		super();
	}

	public OrderDTO(long ono, int uno, String title, int total, Date orderdate, int state, String message) {
		super();
		this.ono = ono;
		this.uno = uno;
		this.title = title;
		this.total = total;
		this.orderdate = orderdate;
		this.state = state;
		this.message = message;
	}

	public long getOno() {
		return ono;
	}

	public void setOno(long ono) {
		this.ono = ono;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}