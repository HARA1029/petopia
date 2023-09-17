package Dto;

//주문상세
public class OrderDetailDTO {
	
	private int dno; //주문상세번호(pk)
	private long ono; //주문번호(fk)
	private int pno; //상품번호(fk)
	private int count; // 각 상품 구매개수
	private String pname; //상품명
	private int price; //판매가
	private String img; //이미지
	private int reviewcheck; //리뷰 체크
	
	public OrderDetailDTO() {
		super();
	}

	public OrderDetailDTO(int dno, long ono, int pno, int count, String pname, int price, String img, int reviewcheck) {
		super();
		this.dno = dno;
		this.ono = ono;
		this.pno = pno;
		this.count = count;
		this.pname = pname;
		this.price = price;
		this.img = img;
		this.reviewcheck = reviewcheck;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public long getOno() {
		return ono;
	}

	public void setOno(long ono) {
		this.ono = ono;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getReviewcheck() {
		return reviewcheck;
	}

	public void setReviewcheck(int reviewcheck) {
		this.reviewcheck = reviewcheck;
	}

}