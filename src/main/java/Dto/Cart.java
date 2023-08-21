package Dto;

public class Cart {
	
	private int cno; //카트번호
	private String img; //상품이미지
	private String pname;//상품명
	private int price; //상품가격
	private int count; //총 구매수량
	
	private int uno; //외래키(회원테이블)
	private int pno; //외래키(상품테이블)
	
	public Cart() {
		super();
	}

	public Cart(int cno, String img, String pname, int price, int count, int uno, int pno) {
		super();
		this.cno = cno;
		this.img = img;
		this.pname = pname;
		this.price = price;
		this.count = count;
		this.uno = uno;
		this.pno = pno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

}