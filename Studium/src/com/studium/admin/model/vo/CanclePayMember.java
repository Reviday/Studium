package com.studium.admin.model.vo;

public class CanclePayMember {

	private int memNo; //회원번호
	private String memName; //회원이름
	private String memPhone; //회원휴대폰번호
	private String pTitle; //구매한 스터디 제목
	private String cancleDate; //취소한 날짜
	private int price; //취소금액
	
	public CanclePayMember() {
		// TODO Auto-generated constructor stub
	}

	public CanclePayMember(int memNo, String memName, String memPhone, String pTitle, String cancleDate, int price) {
		super();
		this.memNo = memNo;
		this.memName = memName;
		this.memPhone = memPhone;
		this.pTitle = pTitle;
		this.cancleDate = cancleDate;
		this.price = price;
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

	public String getCancleDate() {
		return cancleDate;
	}

	public void setCancleDate(String cancleDate) {
		this.cancleDate = cancleDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CanclePayMember [memNo=" + memNo + ", memName=" + memName + ", memPhone=" + memPhone + ", pTitle="
				+ pTitle + ", cancleDate=" + cancleDate + ", price=" + price + "]";
	}
	
	
	
}
