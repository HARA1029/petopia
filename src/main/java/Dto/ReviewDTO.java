package Dto;

import java.util.ArrayList;
import java.util.Date;

public class ReviewDTO {
	
	private int rno;
	private int pno;
	private int uno;
	private String content;
	private Date nowdate;
	private ArrayList<ReplyDTO> reply;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int rno, int pno, int uno, String content, Date nowdate, ArrayList<ReplyDTO> reply) {
		super();
		this.rno = rno;
		this.pno = pno;
		this.uno = uno;
		this.content = content;
		this.nowdate = nowdate;
		this.reply = reply;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
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

	public ArrayList<ReplyDTO> getReply() {
		return reply;
	}

	public void setReply(ArrayList<ReplyDTO> reply) {
		this.reply = reply;
	}
	
}