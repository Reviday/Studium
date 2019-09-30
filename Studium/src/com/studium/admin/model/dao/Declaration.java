package com.studium.admin.model.dao;

import java.sql.Timestamp;

public class Declaration {

	private int dNo; //신고번호
	private int rNo; //신고한 사람 번호
	private int pNo; //신고당한 사람 번호
	private char dType; //신고타입(G:게시글, D:댓글)
	private char dCategory; //신고카테고리(P:영리목적의 광고, U:음란성/선정성 게시글, D:도배 게시글/댓글 S:개인정보 노출/사생활 침해 G:개인정보 노출/사생활 침해)
	private Timestamp dDate; //신고한 시간
	private String dIp; //아이피
	private String dContent; //신고내용
	
	public Declaration() {
		// TODO Auto-generated constructor stub
	}

	public Declaration(int dNo, int rNo, int pNo, char dType, char dCategory, Timestamp dDate, String dIp,
			String dContent) {
		super();
		this.dNo = dNo;
		this.rNo = rNo;
		this.pNo = pNo;
		this.dType = dType;
		this.dCategory = dCategory;
		this.dDate = dDate;
		this.dIp = dIp;
		this.dContent = dContent;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public char getdType() {
		return dType;
	}

	public void setdType(char dType) {
		this.dType = dType;
	}

	public char getdCategory() {
		return dCategory;
	}

	public void setdCategory(char dCategory) {
		this.dCategory = dCategory;
	}

	public Timestamp getdDate() {
		return dDate;
	}

	public void setdDate(Timestamp dDate) {
		this.dDate = dDate;
	}

	public String getdIp() {
		return dIp;
	}

	public void setdIp(String dIp) {
		this.dIp = dIp;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	@Override
	public String toString() {
		return "Declaration [dNo=" + dNo + ", rNo=" + rNo + ", pNo=" + pNo + ", dType=" + dType + ", dCategory="
				+ dCategory + ", dDate=" + dDate + ", dIp=" + dIp + ", dContent=" + dContent + "]";
	}
	
	
}
