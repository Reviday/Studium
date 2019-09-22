package com.studium.member.model.vo;

import java.sql.Date;

public class MyPurchase {
	private int purId;
	private int memberNo;
	private int pNo;
	private Date purchaseDate;
	private char purchaseStatus;
	private char submitFile;

	public MyPurchase() {
		// TODO Auto-generated constructor stub
	}

	public int getPurId() {
		return purId;
	}

	public void setPurId(int purId) {
		this.purId = purId;
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

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public char getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(char purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	public char getSubmitFile() {
		return submitFile;
	}

	public void setSubmitFile(char submitFile) {
		this.submitFile = submitFile;
	}

	@Override
	public String toString() {
		return "MyPurchase [purId=" + purId + ", memberNo=" + memberNo + ", pNo=" + pNo + ", purchaseDate="
				+ purchaseDate + ", purchaseStatus=" + purchaseStatus + ", submitFile=" + submitFile + "]";
	}
	
}
