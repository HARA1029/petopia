package Dto;

public class Customer {
	
	private int uno; //시퀀스로 자동 생성
	private String uname;
	private String id;
	private String pw;
	private String mail;
	private String addr;
	private String tel;
	private String grade;
	
	public Customer() {
		super();
	}

	public Customer(int uno, String uname, String id, String pw, String mail, String addr, String tel, String grade) {
		super();
		this.uno = uno;
		this.uname = uname;
		this.id = id;
		this.pw = pw;
		this.mail = mail;
		this.addr = addr;
		this.tel = tel;
		this.grade = grade;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}