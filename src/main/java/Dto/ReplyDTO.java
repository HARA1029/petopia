package Dto;

import java.util.Date;

public class ReplyDTO {
	
	private int ano;
	private int rno;
	private String content;
	private Date nowdate;
	
	public ReplyDTO() {
		super();
	}

	public ReplyDTO(int ano, int rno, String content, Date nowdate) {
		super();
		this.ano = ano;
		this.rno = rno;
		this.content = content;
		this.nowdate = nowdate;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getNowdate() {
		return nowdate;
	}

	public void setNowdate(Date nowdate) {
		this.nowdate = nowdate;
	}

}