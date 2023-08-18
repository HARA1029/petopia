package Dto;

public class Cart {
	
	private int cno;
	private int uno; //외래키(회원테이블)
	private int pno; //외래키(상품테이블)
	private int count; //총 구매수량
	
	public Cart() {
		super();
	}

	public Cart(int cno, int uno, int pno, int count) {
		super();
		this.cno = cno;
		this.uno = uno;
		this.pno = pno;
		this.count = count;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}