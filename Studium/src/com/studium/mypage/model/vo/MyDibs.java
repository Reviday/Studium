package com.studium.mypage.model.vo;

import java.util.Date;

public class MyDibs {
	
	private int dibsId;
	private int memberNo;
	private int pNo;
	private int fNo;
	private Date scrDateTime;
	
	public MyDibs() {
		// TODO Auto-generated constructor stub
	}

	public MyDibs(int dibsId, int memberNo, int pNo, int fNo, Date scrDateTime) {
		super();
		this.dibsId = dibsId;
		this.memberNo = memberNo;
		this.pNo = pNo;
		this.fNo = fNo;
		this.scrDateTime = scrDateTime;
	}

	public int getDibsId() {
		return dibsId;
	}

	public void setDibsId(int dibsId) {
		this.dibsId = dibsId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public Date getScrDateTime() {
		return scrDateTime;
	}

	public void setScrDateTime(Date scrDateTime) {
		this.scrDateTime = scrDateTime;
	}

	@Override
	public String toString() {
		return "MyDibs [dibsId=" + dibsId + ", memberNo=" + memberNo + ", pNo=" + pNo + ", fNo=" + fNo
				+ ", scrDateTime=" + scrDateTime + "]";
	}
	
	
}
