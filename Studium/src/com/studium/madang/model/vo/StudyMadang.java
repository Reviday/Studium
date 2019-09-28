package com.studium.madang.model.vo;

import java.sql.Timestamp;

public class StudyMadang {
	
	private int madangNo; // 글번호
	private int madangWriterUid; // 글쓴이 uid
	private String madangWriterEmail; // 글쓴이 이메일
	private String madangWriterName; // 글쓴이 이름
	private String madangTitle; // 글 제목
	private int madangLevel; // 문제 난이도(Level 1~5)
	private String madangContent; // 글 내용
	private String madangMainCategory; // 대분류(관리자 고정)
	private String madangCategory; // 중분류(관리자 고정)
	private String madangSubCategory; // 소분류(사용자 지정)
	private Timestamp madangRegisterDatetime; // 글 작성 일시
	private String madangRegisterIp; // 글 작성 ip 주소
	private Timestamp madangUpdatedDatetime; // 글 수정 일시
	private String madangUpdatedIp; // 글 수정 ip 주소
	private int madangRecCount; // 글 추천 수(recommand)
	private int madangRepCount; // 글 댓글 수(reply)
	private int madangReadCount; // 조회수
	private int madangForkCount; // 글 포크 수
	private int madangAnswerCount; // 글 답변(풀이) 수 
	private char madangStatus; // 삭제 여부
	private String profilePath; // 프로필 사진의 경로를 담아두는 곳으로, cmt DB에는 없고 DAO로 불러오는 과정에 삽입된다.
	
	public StudyMadang() {
		// TODO Auto-generated constructor stub
	}

	public StudyMadang(int madangNo, int madangWriterUid, String madangWriterEmail, String madangWriterName,
			String madangTitle, int madangLevel, String madangContent, String madangMainCategory,
			String madangCategory, String madangSubCategory, Timestamp madangRegisterDatetime, String madangRegisterIp,
			Timestamp madangUpdatedDatetime, String madangUpdatedIp, int madangRecCount, int madangRepCount,
			int madangReadCount, int madangForkCount, int madangAnswerCount, char madangStatus, String profilePath) {
		super();
		this.madangNo = madangNo;
		this.madangWriterUid = madangWriterUid;
		this.madangWriterEmail = madangWriterEmail;
		this.madangWriterName = madangWriterName;
		this.madangTitle = madangTitle;
		this.madangLevel = madangLevel;
		this.madangContent = madangContent;
		this.madangMainCategory = madangMainCategory;
		this.madangCategory = madangCategory;
		this.madangSubCategory = madangSubCategory;
		this.madangRegisterDatetime = madangRegisterDatetime;
		this.madangRegisterIp = madangRegisterIp;
		this.madangUpdatedDatetime = madangUpdatedDatetime;
		this.madangUpdatedIp = madangUpdatedIp;
		this.madangRecCount = madangRecCount;
		this.madangRepCount = madangRepCount;
		this.madangReadCount = madangReadCount;
		this.madangForkCount = madangForkCount;
		this.madangAnswerCount = madangAnswerCount;
		this.madangStatus = madangStatus;
		this.profilePath = profilePath;
	}

	public int getMadangNo() {
		return madangNo;
	}

	public void setMadangNo(int madangNo) {
		this.madangNo = madangNo;
	}

	public int getMadangWriterUid() {
		return madangWriterUid;
	}

	public void setMadangWriterUid(int madangWriterUid) {
		this.madangWriterUid = madangWriterUid;
	}

	public String getMadangWriterEmail() {
		return madangWriterEmail;
	}

	public void setMadangWriterEmail(String madangWriterEmail) {
		this.madangWriterEmail = madangWriterEmail;
	}

	public String getMadangWriterName() {
		return madangWriterName;
	}

	public void setMadangWriterName(String madangWriterName) {
		this.madangWriterName = madangWriterName;
	}

	public String getMadangTitle() {
		return madangTitle;
	}

	public void setMadangTitle(String madangTitle) {
		this.madangTitle = madangTitle;
	}

	public int getMadangLevel() {
		return madangLevel;
	}

	public void setMadangLevel(int madangLevel) {
		this.madangLevel = madangLevel;
	}

	public String getMadangContent() {
		return madangContent;
	}

	public void setMadangContent(String madangContent) {
		this.madangContent = madangContent;
	}

	public String getMadangMainCategory() {
		return madangMainCategory;
	}

	public void setMadangMainCategory(String madangMainCategory) {
		this.madangMainCategory = madangMainCategory;
	}

	public String getMadangCategory() {
		return madangCategory;
	}

	public void setMadangCategory(String madangCategory) {
		this.madangCategory = madangCategory;
	}

	public String getMadangSubCategory() {
		return madangSubCategory;
	}

	public void setMadangSubCategory(String madangSubCategory) {
		this.madangSubCategory = madangSubCategory;
	}

	public Timestamp getMadangRegisterDatetime() {
		return madangRegisterDatetime;
	}

	public void setMadangRegisterDatetime(Timestamp madangRegisterDatetime) {
		this.madangRegisterDatetime = madangRegisterDatetime;
	}

	public String getMadangRegisterIp() {
		return madangRegisterIp;
	}

	public void setMadangRegisterIp(String madangRegisterIp) {
		this.madangRegisterIp = madangRegisterIp;
	}

	public Timestamp getMadangUpdatedDatetime() {
		return madangUpdatedDatetime;
	}

	public void setMadangUpdatedDatetime(Timestamp madangUpdatedDatetime) {
		this.madangUpdatedDatetime = madangUpdatedDatetime;
	}

	public String getMadangUpdatedIp() {
		return madangUpdatedIp;
	}

	public void setMadangUpdatedIp(String madangUpdatedIp) {
		this.madangUpdatedIp = madangUpdatedIp;
	}

	public int getMadangRecCount() {
		return madangRecCount;
	}

	public void setMadangRecCount(int madangRecCount) {
		this.madangRecCount = madangRecCount;
	}

	public int getMadangRepCount() {
		return madangRepCount;
	}

	public void setMadangRepCount(int madangRepCount) {
		this.madangRepCount = madangRepCount;
	}

	public int getMadangReadCount() {
		return madangReadCount;
	}

	public void setMadangReadCount(int madangReadCount) {
		this.madangReadCount = madangReadCount;
	}

	public int getMadangForkCount() {
		return madangForkCount;
	}

	public void setMadangForkCount(int madangForkCount) {
		this.madangForkCount = madangForkCount;
	}

	public int getMadangAnswerCount() {
		return madangAnswerCount;
	}

	public void setMadangAnswerCount(int madangAnswerCount) {
		this.madangAnswerCount = madangAnswerCount;
	}

	public char getMadangStatus() {
		return madangStatus;
	}

	public void setMadangStatus(char madangStatus) {
		this.madangStatus = madangStatus;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "StudyMadang [madangNo=" + madangNo + ", madangWriterUid=" + madangWriterUid + ", madangWriterEmail="
				+ madangWriterEmail + ", madangWriterName=" + madangWriterName + ", madangTitle=" + madangTitle
				+ ", madangLevel=" + madangLevel + ", madangContent=" + madangContent + ", madangMainCategory="
				+ madangMainCategory + ", madangCategory=" + madangCategory + ", madangSubCategory=" + madangSubCategory
				+ ", madangRegisterDatetime=" + madangRegisterDatetime + ", madangRegisterIp=" + madangRegisterIp
				+ ", madangUpdatedDatetime=" + madangUpdatedDatetime + ", madangUpdatedIp=" + madangUpdatedIp
				+ ", madangRecCount=" + madangRecCount + ", madangRepCount=" + madangRepCount + ", madangReadCount="
				+ madangReadCount + ", madangForkCount=" + madangForkCount + ", madangAnswerCount=" + madangAnswerCount
				+ ", madangStatus=" + madangStatus + ", profilePath=" + profilePath + "]";
	}
	
}
