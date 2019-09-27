package com.studium.admin.model.vo;

public class PayMember {

	private int memNo; //회원번호
	private String memName; //회원이름
	private String memPhone; //회원휴대폰번호
	private String pTitle; //구매한 스터디 제목
	private String purchaseDate; //구매한 날짜
	private String purchaseStatus; //구매한 스터디 진행여부

	public PayMember() {
		// TODO Auto-generated constructor stub
	}

	public PayMember(int memNo, String memName, String memPhone, String pTitle, String purchaseDate,
			String purchaseStatus) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memPhone = memPhone;
		this.pTitle = pTitle;
		this.purchaseDate = purchaseDate;
		this.purchaseStatus = purchaseStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(String purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	@Override
	public String toString() {
		return "PayMember [memNo=" + memNo + ", memName=" + memName + ", memPhone=" + memPhone + ", pTitle=" + pTitle
				+ ", purchaseDate=" + purchaseDate + ", purchaseStatus=" + purchaseStatus + "]";
	}
	
	
	
}

