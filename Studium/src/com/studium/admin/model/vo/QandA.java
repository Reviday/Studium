package com.studium.admin.model.vo;

import java.util.Date;

public class QandA {

	private String email; // 답변받을 이메일
	private String content; // 문의내용짜른거
	private String fullContent; //문의내용 전체내용
	private Date enrollDate; // 문의한 날짜
	private String pastDate; // 문의한 날짜와 현재 날짜의 차이
	private int cNo; // 문의글번호
	
	public QandA() {
		// TODO Auto-generated constructor stub
	}

	public QandA(String email, String content, String fullContent, Date enrollDate, String pastDate, int cNo) {
		super();
		this.email = email;
		this.content = content;
		this.fullContent = fullContent;
		this.enrollDate = enrollDate;
		this.pastDate = pastDate;
		this.cNo = cNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFullContent() {
		return fullContent;
	}

	public void setFullContent(String fullContent) {
		this.fullContent = fullContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPastDate() {
		return pastDate;
	}

	public void setPastDate(String pastDate) {
		this.pastDate = pastDate;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "QandA [email=" + email + ", content=" + content + ", fullContent=" + fullContent + ", enrollDate="
				+ enrollDate + ", pastDate=" + pastDate + ", cNo=" + cNo + "]";
	}

	
	
	
}
