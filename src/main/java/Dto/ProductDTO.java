package Dto;

public class ProductDTO {
	
	private int pno; //상품번호
	private String pname; //상품명
	private int price; //상품가격
	private int stock; //상품재고
	private String img; //상품이미지
	private int cateno; //상품카테고리 
	private int sell; //판매여부(판매중/판매중지)
	
	public ProductDTO() {
		super();
	}

	public ProductDTO(int pno, String pname, int price, int stock, String img, int cateno, int sell) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.price = price;
		this.stock = stock;
		this.img = img;
		this.cateno = cateno;
		this.sell = sell;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getCateno() {
		return cateno;
	}

	public void setCateno(int cateno) {
		this.cateno = cateno;
	}

	public int getSell() {
		return sell;
	}

	public void setSell(int sell) {
		this.sell = sell;
	}
	
}