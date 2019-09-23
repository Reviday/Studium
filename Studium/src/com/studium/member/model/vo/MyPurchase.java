package com.studium.member.model.vo;

import java.sql.Date;

public class MyPurchase {
	private int purId;//구매아이디
	private int memNo;//구매한 멤버 no
	private int pNo;//구매한 p study의 no
	private String pTitle;//구매한 p study의 title
	private Date purchaseDate;//구매한 날짜
	private char purchaseCancelStatus;//구매 취소상태
	private Date cancelDate;//취소날짜
	private char purchaseStatus;//구매 상태(스터디 진행중 유무)
	private char submitFile;//발급서류 유무

	public MyPurchase() {
		// TODO Auto-generated constructor stub
	}

	public int getPurId() {
		return purId;
	}

	public void setPurId(int purId) {
		this.purId = purId;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public char getPurchaseCancelStatus() {
		return purchaseCancelStatus;
	}

	public void setPurchaseCancelStatus(char purchaseCancelStatus) {
		this.purchaseCancelStatus = purchaseCancelStatus;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
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
		return "MyPurchase [purId=" + purId + ", memNo=" + memNo + ", pNo=" + pNo + ", pTitle=" + pTitle
				+ ", purchaseDate=" + purchaseDate + ", purchaseCancelStatus=" + purchaseCancelStatus + ", cancelDate="
				+ cancelDate + ", purchaseStatus=" + purchaseStatus + ", submitFile=" + submitFile + "]";
	}

	
}
