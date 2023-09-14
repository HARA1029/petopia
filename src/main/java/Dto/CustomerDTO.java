package Dto;

public class CustomerDTO {
	
	private int uno; //회원번호 -> 시퀀스로 자동 생성
	private String uname; // 회원이름
	private String id; //아이디
	private String pw; //이름
	private String mail; //이메일
	private String addr; //주소
	private String tel; //전화번호
	private String grade;//회원등급
	private int zipcode;//우편번호
	
	public CustomerDTO() {
		super();
	}

	public CustomerDTO(int uno, String uname, String id, String pw, String mail, String addr, String tel, String grade,
			int zipcode) {
		super();
		this.uno = uno;
		this.uname = uname;
		this.id = id;
		this.pw = pw;
		this.mail = mail;
		this.addr = addr;
		this.tel = tel;
		this.grade = grade;
		this.zipcode = zipcode;
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

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	
}