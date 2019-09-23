package com.studium.admin.model.vo;

import java.util.Date;

public class PointShow {

	private String memId;
	private String memName;
	private String memEmail;
	private int point;
	private char pointStatus;
	private String pointEnrollDate;
	
	public PointShow() {
		// TODO Auto-generated constructor stub
	}

	public PointShow(String memId, String memName, String memEmail, int point, char pointStatus, String pointEnrollDate) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memEmail = memEmail;
		this.point = point;
		this.pointStatus = pointStatus;
		this.pointEnrollDate = pointEnrollDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public char getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(char pointStatus) {
		this.pointStatus = pointStatus;
	}

	public String getPointEnrollDate() {
		return pointEnrollDate;
	}

	public void setPointEnrollDate(String pointEnrollDate) {
		this.pointEnrollDate = pointEnrollDate;
	}

	@Override
	public String toString() {
		return "PointShow [memId=" + memId + ", memName=" + memName + ", memEmail=" + memEmail + ", point=" + point
				+ ", pointStatus=" + pointStatus + ", pointEnrollDate=" + pointEnrollDate + "]";
	}
	
	
	
}
