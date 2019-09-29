package com.studium.madang.model.vo;

import java.sql.Timestamp;

public class StudyMadangQuestion {

	private int questionNo; // 시퀀스 pk
	private int madangNo; // 해당 글번호
	private int questionWriterUid; // 글쓴이 uid
	private String questionWriterEmail; // 글쓴이 이메일
	private String questionWriterName; // 글쓴이 이름(이름으로 표기)
	private String questionContent; // 글 내용
	private Timestamp questionRegisterDatetime; // 글 작성 일시
	private String questionRegisterIp; // 글 작성 ip 주소
	private Timestamp questionUpdatedDatetime; // 글 수정 일시
	private String questionUpdatedIp; // 글 수정 ip 주소
	private int questionRecCount; // 글 추천 수(recommand)
	private int questionRepCount; //글 댓글 수
	private String profilePath; // 프로필 사진의 경로를 담아두는 곳으로, cmt DB에는 없고 DAO로 불러오는 과정에 삽입된다.
	
	public StudyMadangQuestion() {
		// TODO Auto-generated constructor stub
	}

	public StudyMadangQuestion(int questionNo, int madangNo, int questionWriterUid, String questionWriterEmail,
			String questionWriterName, String questionContent, Timestamp questionRegisterDatetime,
			String questionRegisterIp, Timestamp questionUpdatedDatetime, String questionUpdatedIp,
			int questionRecCount, int questionRepCount, String profilePath) {
		super();
		this.questionNo = questionNo;
		this.madangNo = madangNo;
		this.questionWriterUid = questionWriterUid;
		this.questionWriterEmail = questionWriterEmail;
		this.questionWriterName = questionWriterName;
		this.questionContent = questionContent;
		this.questionRegisterDatetime = questionRegisterDatetime;
		this.questionRegisterIp = questionRegisterIp;
		this.questionUpdatedDatetime = questionUpdatedDatetime;
		this.questionUpdatedIp = questionUpdatedIp;
		this.questionRecCount = questionRecCount;
		this.questionRepCount = questionRepCount;
		this.profilePath = profilePath;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getMadangNo() {
		return madangNo;
	}

	public void setMadangNo(int madangNo) {
		this.madangNo = madangNo;
	}

	public int getQuestionWriterUid() {
		return questionWriterUid;
	}

	public void setQuestionWriterUid(int questionWriterUid) {
		this.questionWriterUid = questionWriterUid;
	}

	public String getQuestionWriterEmail() {
		return questionWriterEmail;
	}

	public void setQuestionWriterEmail(String questionWriterEmail) {
		this.questionWriterEmail = questionWriterEmail;
	}

	public String getQuestionWriterName() {
		return questionWriterName;
	}

	public void setQuestionWriterName(String questionWriterName) {
		this.questionWriterName = questionWriterName;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Timestamp getQuestionRegisterDatetime() {
		return questionRegisterDatetime;
	}

	public void setQuestionRegisterDatetime(Timestamp questionRegisterDatetime) {
		this.questionRegisterDatetime = questionRegisterDatetime;
	}

	public String getQuestionRegisterIp() {
		return questionRegisterIp;
	}

	public void setQuestionRegisterIp(String questionRegisterIp) {
		this.questionRegisterIp = questionRegisterIp;
	}

	public Timestamp getQuestionUpdatedDatetime() {
		return questionUpdatedDatetime;
	}

	public void setQuestionUpdatedDatetime(Timestamp questionUpdatedDatetime) {
		this.questionUpdatedDatetime = questionUpdatedDatetime;
	}

	public String getQuestionUpdatedIp() {
		return questionUpdatedIp;
	}

	public void setQuestionUpdatedIp(String questionUpdatedIp) {
		this.questionUpdatedIp = questionUpdatedIp;
	}

	public int getQuestionRecCount() {
		return questionRecCount;
	}

	public void setQuestionRecCount(int questionRecCount) {
		this.questionRecCount = questionRecCount;
	}

	public int getQuestionRepCount() {
		return questionRepCount;
	}

	public void setQuestionRepCount(int questionRepCount) {
		this.questionRepCount = questionRepCount;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "StudyMadangQuestion [questionNo=" + questionNo + ", madangNo=" + madangNo + ", questionWriterUid="
				+ questionWriterUid + ", questionWriterEmail=" + questionWriterEmail + ", questionWriterName="
				+ questionWriterName + ", questionContent=" + questionContent + ", questionRegisterDatetime="
				+ questionRegisterDatetime + ", questionRegisterIp=" + questionRegisterIp + ", questionUpdatedDatetime="
				+ questionUpdatedDatetime + ", questionUpdatedIp=" + questionUpdatedIp + ", questionRecCount="
				+ questionRecCount + ", questionRepCount=" + questionRepCount + ", profilePath=" + profilePath + "]";
	}
	
}
