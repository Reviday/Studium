package com.studium.madang.model.vo;

import java.sql.Timestamp;

public class FreeMadang {

	private int madangNo; // 글번호
	private int madangParent; // 답글을 달았을 시, 원글의 글번호를 저장
	private int madangOrder; // 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
	private int madangWriterUid; // 글쓴이 uid
	private String madangWriterEmail; // 글쓴이 이메일
	private String madangWriterName; // 글쓴이 이름
	private String madangTitle; // 글 제목
	private String madangContent; // 글 내용
	private Timestamp madangRegisterDatetime; // 글 작성 일시
	private String madangRegisterIp; // 글 작성 ip 주소
	private Timestamp madangUpdatedDatetime; // 글 수정 일시
	private String madangUpdatedIp; // 글 수정 ip 주소
	private int madangRecCount; // 글 추천 수(recommand)
	private int madangRepCount; // 글 댓글 수(reply)
	private int madangReadCount; // 조회수
	private char madangFilePresence; // 파일이 있는지 없는지(List화면에서 표시용으로 사용)
	private char madangImgPresence; // 이미지가 있는지 없는지(List화면에서 표시용으로 사용)
	private char madangStatus; // 삭제 여부
	private String profilePath; // 프로필 사진의 경로를 담아두는 곳으로, cmt DB에는 없고 DAO로 불러오는 과정에 삽입된다.
	
	public FreeMadang() {
		// TODO Auto-generated constructor stub
	}

	public FreeMadang(int madangNo, int madangParent, int madangOrder, int madangWriterUid, String madangWriterEmail,
			String madangWriterName, String madangTitle, String madangContent, Timestamp madangRegisterDatetime,
			String madangRegisterIp, Timestamp madangUpdatedDatetime, String madangUpdatedIp, int madangRecCount,
			int madangRepCount, int madangReadCount, char madangFilePresence, char madangImgPresence, char madangStatus,
			String profilePath) {
		super();
		this.madangNo = madangNo;
		this.madangParent = madangParent;
		this.madangOrder = madangOrder;
		this.madangWriterUid = madangWriterUid;
		this.madangWriterEmail = madangWriterEmail;
		this.madangWriterName = madangWriterName;
		this.madangTitle = madangTitle;
		this.madangContent = madangContent;
		this.madangRegisterDatetime = madangRegisterDatetime;
		this.madangRegisterIp = madangRegisterIp;
		this.madangUpdatedDatetime = madangUpdatedDatetime;
		this.madangUpdatedIp = madangUpdatedIp;
		this.madangRecCount = madangRecCount;
		this.madangRepCount = madangRepCount;
		this.madangReadCount = madangReadCount;
		this.madangFilePresence = madangFilePresence;
		this.madangImgPresence = madangImgPresence;
		this.madangStatus = madangStatus;
		this.profilePath = profilePath;
	}

	public int getMadangNo() {
		return madangNo;
	}

	public void setMadangNo(int madangNo) {
		this.madangNo = madangNo;
	}

	public int getMadangParent() {
		return madangParent;
	}

	public void setMadangParent(int madangParent) {
		this.madangParent = madangParent;
	}

	public int getMadangOrder() {
		return madangOrder;
	}

	public void setMadangOrder(int madangOrder) {
		this.madangOrder = madangOrder;
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

	public String getMadangContent() {
		return madangContent;
	}

	public void setMadangContent(String madangContent) {
		this.madangContent = madangContent;
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

	public char getMadangFilePresence() {
		return madangFilePresence;
	}

	public void setMadangFilePresence(char madangFilePresence) {
		this.madangFilePresence = madangFilePresence;
	}

	public char getMadangImgPresence() {
		return madangImgPresence;
	}

	public void setMadangImgPresence(char madangImgPresence) {
		this.madangImgPresence = madangImgPresence;
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
		return "FreeMadang [madangNo=" + madangNo + ", madangParent=" + madangParent + ", madangOrder=" + madangOrder
				+ ", madangWriterUid=" + madangWriterUid + ", madangWriterEmail=" + madangWriterEmail
				+ ", madangWriterName=" + madangWriterName + ", madangTitle=" + madangTitle + ", madangContent="
				+ madangContent + ", madangRegisterDatetime=" + madangRegisterDatetime + ", madangRegisterIp="
				+ madangRegisterIp + ", madangUpdatedDatetime=" + madangUpdatedDatetime + ", madangUpdatedIp="
				+ madangUpdatedIp + ", madangRecCount=" + madangRecCount + ", madangRepCount=" + madangRepCount
				+ ", madangReadCount=" + madangReadCount + ", madangFilePresence=" + madangFilePresence
				+ ", madangImgPresence=" + madangImgPresence + ", madangStatus=" + madangStatus + ", profilePath="
				+ profilePath + "]";
	}

}