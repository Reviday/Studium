package com.studium.member.model.vo;

import java.sql.Timestamp;

public class MemberLoginLog {
	
	private int mllNo; // 시퀀스 PK 
	private char mllSuccess; // 로그인 성공 여부
	private int mllMemNo; // 로그인 한 회원 PK
	private String mllUserEmail; // 로그인 시도할 때에 입력한 이메일
	private Timestamp mllDatetime; // 로그인 일시
	private String mllIp; // 로그인 한 IP
	private String mllReason; // 로그인 성공/실패시 이유
	private String mllUseragent; // 로그인한 브라우저의 user agent
	private String mllUrl; // 로그인한 페이지 주소
	private String mllReferer; // 이전 페이지 주소
	
	public MemberLoginLog() {
		// TODO Auto-generated constructor stub
	}

	public MemberLoginLog(int mllNo, char mllSuccess, int mllMemNo, String mllUserEmail, Timestamp mllDatetime,
			String mllIp, String mllReason, String mllUseragent, String mllUrl, String mllReferer) {
		super();
		this.mllNo = mllNo;
		this.mllSuccess = mllSuccess;
		this.mllMemNo = mllMemNo;
		this.mllUserEmail = mllUserEmail;
		this.mllDatetime = mllDatetime;
		this.mllIp = mllIp;
		this.mllReason = mllReason;
		this.mllUseragent = mllUseragent;
		this.mllUrl = mllUrl;
		this.mllReferer = mllReferer;
	}

	public int getMllNo() {
		return mllNo;
	}

	public void setMllNo(int mllNo) {
		this.mllNo = mllNo;
	}

	public char getMllSuccess() {
		return mllSuccess;
	}

	public void setMllSuccess(char mllSuccess) {
		this.mllSuccess = mllSuccess;
	}

	public int getMllMemNo() {
		return mllMemNo;
	}

	public void setMllMemNo(int mllMemNo) {
		this.mllMemNo = mllMemNo;
	}

	public String getMllUserEmail() {
		return mllUserEmail;
	}

	public void setMllUserEmail(String mllUserEmail) {
		this.mllUserEmail = mllUserEmail;
	}

	public Timestamp getMllDatetime() {
		return mllDatetime;
	}

	public void setMllDatetime(Timestamp mllDatetime) {
		this.mllDatetime = mllDatetime;
	}

	public String getMllIp() {
		return mllIp;
	}

	public void setMllIp(String mllIp) {
		this.mllIp = mllIp;
	}

	public String getMllReason() {
		return mllReason;
	}

	public void setMllReason(String mllReason) {
		this.mllReason = mllReason;
	}

	public String getMllUseragent() {
		return mllUseragent;
	}

	public void setMllUseragent(String mllUseragent) {
		this.mllUseragent = mllUseragent;
	}

	public String getMllUrl() {
		return mllUrl;
	}

	public void setMllUrl(String mllUrl) {
		this.mllUrl = mllUrl;
	}

	public String getMllReferer() {
		return mllReferer;
	}

	public void setMllReferer(String mllReferer) {
		this.mllReferer = mllReferer;
	}

	@Override
	public String toString() {
		return "MemberLoginLog [mllNo=" + mllNo + ", mllSuccess=" + mllSuccess + ", mllMemNo=" + mllMemNo
				+ ", mllUserEmail=" + mllUserEmail + ", mllDatetime=" + mllDatetime + ", mllIp=" + mllIp
				+ ", mllReason=" + mllReason + ", mllUseragent=" + mllUseragent + ", mllUrl=" + mllUrl + ", mllReferer="
				+ mllReferer + "]";
	}
	
}
