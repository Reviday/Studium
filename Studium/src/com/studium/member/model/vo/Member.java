package com.studium.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {
	
	// 기본 가입 정보(준회원-Associate Member[A])
	private int memNo; // 회원넘버(시퀀스넘버로 부여)
	private String memUserEmail; // 회원 이메일(회원 아이디)
	private String memPassword; // 회원 비밀번호
	private String memName; // 회원이름
	private char memCode; // 회원등급(Manager, Teacher, Regular, Associate) - 자동부여
	
	// 추가 입력 정보(정회원-Regular Member[R])
	private Date memBirth; // 회원생년월일
	private String memPhone; // 회원전화번호
	private char memGender; // 회원 성별
	private int memPoint; // 회원 포인트
	private String memCategory1; // 회원의 선호 카테고리 (최대 3개)
	private String memCategory2;
	private String memCategory3;
	private String memZipCode; // 우편번호
	private String memAddress1; // 회원 주소 앞부분
	private String memAddress2; // 회원 상세주소
	
	// 이하는 부가 정보(Default값으로 초기 설정 후, 추가 입력정보로 받을 정보는 추가로 입력받음)
	private char memReceiveEmail; // 이메일 수신여부(기본값 N)
	private char memUseNote; //쪽지 사용여부(기본값 N)
	private char memReceiveSms; // 문자 수신 여부(기본값 N)
	private char memOpenProfile; // 프로필 공개 여부(기본값 N)
	private char memDenied; // 해당 회원 차단 여부(기본값 N) - 관리자 설정
	private char memEmailCert; // 이메일 인증 여부(기본값 N)
	private Timestamp memEnrollDatetime; // 회원 가입일(시간 포함)
	private String memEnrollIp; // 회원 가입 ip(ip 받아오는게 가능하면 넣을까 싶음)
	private Timestamp memLastloginDatetime; // 마지막 접속일 
	private String memLastloginIp; // 마지막 접속 ip
	private String memProfileContent; // 자기소개(프로필용, 100자)
	private String memAdminmemo; // 회원에 대한 관리자용 메모
	private String memIcon; // 회원 아이콘 경로(댓글 사용할때 이미지 정도)
	private String memPhoto; // 회원 프로필 사진 경로
	
	// 기본 생성자
	public Member() { }

	// 기본 가입하기용 생성자(준회원)
	public Member(String memUserEmail, String memPassword, String memName) {
		this.memUserEmail = memUserEmail;
		this.memPassword = memPassword;
		this.memName = memName;
	}

	public Member(int memNo, String memUserEmail, String memPassword, String memName, char memCode, Date memBirth,
			String memPhone, char memGender, int memPoint, String memCategory1, String memCategory2,
			String memCategory3, String memZipCode, String memAddress1, String memAddress2, char memReceiveEmail,
			char memUseNote, char memReceiveSms, char memOpenProfile, char memDenied, char memEmailCert,
			Timestamp memEnrollDatetime, String memEnrollIp, Timestamp memLastloginDatetime, String memLastloginIp,
			String memProfileContent, String memAdminmemo, String memIcon, String memPhoto) {
		super();
		this.memNo = memNo;
		this.memUserEmail = memUserEmail;
		this.memPassword = memPassword;
		this.memName = memName;
		this.memCode = memCode;
		this.memBirth = memBirth;
		this.memPhone = memPhone;
		this.memGender = memGender;
		this.memPoint = memPoint;
		this.memCategory1 = memCategory1;
		this.memCategory2 = memCategory2;
		this.memCategory3 = memCategory3;
		this.memZipCode = memZipCode;
		this.memAddress1 = memAddress1;
		this.memAddress2 = memAddress2;
		this.memReceiveEmail = memReceiveEmail;
		this.memUseNote = memUseNote;
		this.memReceiveSms = memReceiveSms;
		this.memOpenProfile = memOpenProfile;
		this.memDenied = memDenied;
		this.memEmailCert = memEmailCert;
		this.memEnrollDatetime = memEnrollDatetime;
		this.memEnrollIp = memEnrollIp;
		this.memLastloginDatetime = memLastloginDatetime;
		this.memLastloginIp = memLastloginIp;
		this.memProfileContent = memProfileContent;
		this.memAdminmemo = memAdminmemo;
		this.memIcon = memIcon;
		this.memPhoto = memPhoto;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemUserEmail() {
		return memUserEmail;
	}

	public void setMemUserEmail(String memUserEmail) {
		this.memUserEmail = memUserEmail;
	}

	public String getMemPassword() {
		return memPassword;
	}

	public void setMemPassword(String memPassword) {
		this.memPassword = memPassword;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public char getMemCode() {
		return memCode;
	}

	public void setMemCode(char memCode) {
		this.memCode = memCode;
	}

	public Date getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public char getMemGender() {
		return memGender;
	}

	public void setMemGender(char memGender) {
		this.memGender = memGender;
	}

	public int getMemPoint() {
		return memPoint;
	}

	public void setMemPoint(int memPoint) {
		this.memPoint = memPoint;
	}

	public String getMemCategory1() {
		return memCategory1;
	}

	public void setMemCategory1(String memCategory1) {
		this.memCategory1 = memCategory1;
	}

	public String getMemCategory2() {
		return memCategory2;
	}

	public void setMemCategory2(String memCategory2) {
		this.memCategory2 = memCategory2;
	}

	public String getMemCategory3() {
		return memCategory3;
	}

	public void setMemCategory3(String memCategory3) {
		this.memCategory3 = memCategory3;
	}

	public String getMemZipCode() {
		return memZipCode;
	}

	public void setMemZipCode(String memZipCode) {
		this.memZipCode = memZipCode;
	}

	public String getMemAddress1() {
		return memAddress1;
	}

	public void setMemAddress1(String memAddress1) {
		this.memAddress1 = memAddress1;
	}

	public String getMemAddress2() {
		return memAddress2;
	}

	public void setMemAddress2(String memAddress2) {
		this.memAddress2 = memAddress2;
	}

	public char getMemReceiveEmail() {
		return memReceiveEmail;
	}

	public void setMemReceiveEmail(char memReceiveEmail) {
		this.memReceiveEmail = memReceiveEmail;
	}

	public char getMemUseNote() {
		return memUseNote;
	}

	public void setMemUseNote(char memUseNote) {
		this.memUseNote = memUseNote;
	}

	public char getMemReceiveSms() {
		return memReceiveSms;
	}

	public void setMemReceiveSms(char memReceiveSms) {
		this.memReceiveSms = memReceiveSms;
	}

	public char getMemOpenProfile() {
		return memOpenProfile;
	}

	public void setMemOpenProfile(char memOpenProfile) {
		this.memOpenProfile = memOpenProfile;
	}

	public char getMemDenied() {
		return memDenied;
	}

	public void setMemDenied(char memDenied) {
		this.memDenied = memDenied;
	}

	public char getMemEmailCert() {
		return memEmailCert;
	}

	public void setMemEmailCert(char memEmailCert) {
		this.memEmailCert = memEmailCert;
	}

	public Timestamp getMemEnrollDatetime() {
		return memEnrollDatetime;
	}

	public void setMemEnrollDatetime(Timestamp memEnrollDatetime) {
		this.memEnrollDatetime = memEnrollDatetime;
	}

	public String getMemEnrollIp() {
		return memEnrollIp;
	}

	public void setMemEnrollIp(String memEnrollIp) {
		this.memEnrollIp = memEnrollIp;
	}

	public Timestamp getMemLastloginDatetime() {
		return memLastloginDatetime;
	}

	public void setMemLastloginDatetime(Timestamp memLastloginDatetime) {
		this.memLastloginDatetime = memLastloginDatetime;
	}

	public String getMemLastloginIp() {
		return memLastloginIp;
	}

	public void setMemLastloginIp(String memLastloginIp) {
		this.memLastloginIp = memLastloginIp;
	}

	public String getMemProfileContent() {
		return memProfileContent;
	}

	public void setMemProfileContent(String memProfileContent) {
		this.memProfileContent = memProfileContent;
	}

	public String getMemAdminmemo() {
		return memAdminmemo;
	}

	public void setMemAdminmemo(String memAdminmemo) {
		this.memAdminmemo = memAdminmemo;
	}

	public String getMemIcon() {
		return memIcon;
	}

	public void setMemIcon(String memIcon) {
		this.memIcon = memIcon;
	}

	public String getMemPhoto() {
		return memPhoto;
	}

	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memUserEmail=" + memUserEmail + ", memPassword=" + memPassword
				+ ", memName=" + memName + ", memCode=" + memCode + ", memBirth=" + memBirth + ", memPhone=" + memPhone
				+ ", memGender=" + memGender + ", memPoint=" + memPoint + ", memCategory1=" + memCategory1
				+ ", memCategory2=" + memCategory2 + ", memCategory3=" + memCategory3 + ", memZipCode=" + memZipCode
				+ ", memAddress1=" + memAddress1 + ", memAddress2=" + memAddress2 + ", memReceiveEmail="
				+ memReceiveEmail + ", memUseNote=" + memUseNote + ", memReceiveSms=" + memReceiveSms
				+ ", memOpenProfile=" + memOpenProfile + ", memDenied=" + memDenied + ", memEmailCert=" + memEmailCert
				+ ", memEnrollDatetime=" + memEnrollDatetime + ", memEnrollIp=" + memEnrollIp
				+ ", memLastloginDatetime=" + memLastloginDatetime + ", memLastloginIp=" + memLastloginIp
				+ ", memProfileContent=" + memProfileContent + ", memAdminmemo=" + memAdminmemo + ", memIcon=" + memIcon
				+ ", memPhoto=" + memPhoto + "]";
	}
	
}