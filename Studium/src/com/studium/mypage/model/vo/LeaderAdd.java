package com.studium.mypage.model.vo;

import java.util.Date;

public class LeaderAdd {
	private int lNo;
	private String lName;
	private String lGender;
	private String lEmail;
	private String lPhone;
	private String lType;
	private String lArea;
	private String lCategory1;
	private String lCategory2;
	private String lCategory3;
	private String lMessage;
	private Date lEnrolldate;
	private String lStatus;
	
	public LeaderAdd() {
		// TODO Auto-generated constructor stub
	}
	


	public LeaderAdd(int lNo, String lName, String lGender, String lEmail, String lPhone, String lType, String lArea,
			String lCategory1, String lCategory2, String lCategory3, String lMessage, Date lEnrolldate, String lStatus) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lGender = lGender;
		this.lEmail = lEmail;
		this.lPhone = lPhone;
		this.lType = lType;
		this.lArea = lArea;
		this.lCategory1 = lCategory1;
		this.lCategory2 = lCategory2;
		this.lCategory3 = lCategory3;
		this.lMessage = lMessage;
		this.lEnrolldate = lEnrolldate;
		this.lStatus = lStatus;
	}



	public int getlNo() {
		return lNo;
	}


	public void setlNo(int lNo) {
		this.lNo = lNo;
	}


	public String getlName() {
		return lName;
	}


	public void setlName(String lName) {
		this.lName = lName;
	}


	public String getlGender() {
		return lGender;
	}


	public void setlGender(String lGender) {
		this.lGender = lGender;
	}


	public String getlEmail() {
		return lEmail;
	}


	public void setlEmail(String lEmail) {
		this.lEmail = lEmail;
	}


	public String getlPhone() {
		return lPhone;
	}


	public void setlPhone(String lPhone) {
		this.lPhone = lPhone;
	}


	public String getlType() {
		return lType;
	}


	public void setlType(String lType) {
		this.lType = lType;
	}


	public String getlArea() {
		return lArea;
	}


	public void setlArea(String lArea) {
		this.lArea = lArea;
	}


	public String getlCategory1() {
		return lCategory1;
	}


	public void setlCategory1(String lCategory1) {
		this.lCategory1 = lCategory1;
	}


	public String getlCategory2() {
		return lCategory2;
	}


	public void setlCategory2(String lCategory2) {
		this.lCategory2 = lCategory2;
	}


	public String getlCategory3() {
		return lCategory3;
	}


	public void setlCategory3(String lCategory3) {
		this.lCategory3 = lCategory3;
	}


	public String getlMessage() {
		return lMessage;
	}


	public void setlMessage(String lMessage) {
		this.lMessage = lMessage;
	}

	

	public Date getlEnrolldate() {
		return lEnrolldate;
	}



	public void setlEnrolldate(Date lEnrolldate) {
		this.lEnrolldate = lEnrolldate;
	}



	public String getlStatus() {
		return lStatus;
	}



	public void setlStatus(String lStatus) {
		this.lStatus = lStatus;
	}



	@Override
	public String toString() {
		return "LeaderAdd [lNo=" + lNo + ", lName=" + lName + ", lGender=" + lGender + ", lEmail=" + lEmail
				+ ", lPhone=" + lPhone + ", lType=" + lType + ", lArea=" + lArea + ", lCategory1=" + lCategory1
				+ ", lCategory2=" + lCategory2 + ", lCategory3=" + lCategory3 + ", lMessage=" + lMessage + "]";
	}
	

}
