package Dto;

public class Product {
	
	private int pno;
	private String pname;
	private int price;
	private int stock;
	private String img;
	private int cateno;
	
	public Product() {
		super();
	}

	public Product(int pno, String pname, int price, int stock, String img, int cateno) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.price = price;
		this.stock = stock;
		this.img = img;
		this.cateno = cateno;
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

}