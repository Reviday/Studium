package com.studium.madang.model.vo;

import java.sql.Timestamp;

public class QuestionMadangCmt {

	private int cmtNo; // 댓글 시퀀스 넘버
	private int cmtParent; // 부모 댓글의 번호를 가짐. 부모는 null
	private int cmtSort; // 댓글 정렬 (기본값 0으로, 대댓글 순서대로 1씩 증가)
	private int cmtMadangNo; // 게시글 번호(왜래키)
	private String cmtContent; // 댓글 내용
	private char cmtReply; // 대댓글 존재 여부
	private int cmtWriterUid; // 댓글 작성자 uid(고유넘버)
	private String cmtWriter; // 댓글 작성자 이메일 (기본적으로 댓글에 정보를 띄워주기 위함)
	private String cmtWriterName; // 댓글 작성자 이름 (기본적으로 댓글에 정보를 띄워주기 위함)
	private Timestamp cmtRegisterDatetime; // 댓글 작성 일시
	private Timestamp cmtUpdatedDatetime; // 댓글 최근 수정 일시
	private String cmtRegisterIp; // 댓글 작성 ip 주소
	private String cmtUpdatedIp; // 댓글 최근 수정 ip 주소
	private char status; // 댓글 삭제 여부(부모 댓글이 삭제 처리될 시, 대댓글도 모두 N으로 처리)
	private int cmtBlame; // 신고 횟수
	private char cmtBlameAdmin; // 신고 접수로인해 관리자 판단 하에 삭제조치된 경우. ("관리자에의 의해 삭제처리된 댓글입니다." 표기//일단 지금은 그냥 삭제처리와 동일하게)
	private String profilePath; // 프로필 사진의 경로를 담아두는 곳으로, cmt DB에는 없고 DAO로 불러오는 과정에 삽입된다.
	
	public QuestionMadangCmt() {
		// TODO Auto-generated constructor stub
	}

	public QuestionMadangCmt(int cmtNo, int cmtParent, int cmtSort, int cmtMadangNo, String cmtContent, char cmtReply,
			int cmtWriterUid, String cmtWriter, String cmtWriterName, Timestamp cmtRegisterDatetime,
			Timestamp cmtUpdatedDatetime, String cmtRegisterIp, String cmtUpdatedIp, char status, int cmtBlame,
			char cmtBlameAdmin, String profilePath) {
		super();
		this.cmtNo = cmtNo;
		this.cmtParent = cmtParent;
		this.cmtSort = cmtSort;
		this.cmtMadangNo = cmtMadangNo;
		this.cmtContent = cmtContent;
		this.cmtReply = cmtReply;
		this.cmtWriterUid = cmtWriterUid;
		this.cmtWriter = cmtWriter;
		this.cmtWriterName = cmtWriterName;
		this.cmtRegisterDatetime = cmtRegisterDatetime;
		this.cmtUpdatedDatetime = cmtUpdatedDatetime;
		this.cmtRegisterIp = cmtRegisterIp;
		this.cmtUpdatedIp = cmtUpdatedIp;
		this.status = status;
		this.cmtBlame = cmtBlame;
		this.cmtBlameAdmin = cmtBlameAdmin;
		this.profilePath = profilePath;
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}

	public int getCmtParent() {
		return cmtParent;
	}

	public void setCmtParent(int cmtParent) {
		this.cmtParent = cmtParent;
	}

	public int getCmtSort() {
		return cmtSort;
	}

	public void setCmtSort(int cmtSort) {
		this.cmtSort = cmtSort;
	}

	public int getCmtMadangNo() {
		return cmtMadangNo;
	}

	public void setCmtMadangNo(int cmtMadangNo) {
		this.cmtMadangNo = cmtMadangNo;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public char getCmtReply() {
		return cmtReply;
	}

	public void setCmtReply(char cmtReply) {
		this.cmtReply = cmtReply;
	}

	public int getCmtWriterUid() {
		return cmtWriterUid;
	}

	public void setCmtWriterUid(int cmtWriterUid) {
		this.cmtWriterUid = cmtWriterUid;
	}

	public String getCmtWriter() {
		return cmtWriter;
	}

	public void setCmtWriter(String cmtWriter) {
		this.cmtWriter = cmtWriter;
	}

	public String getCmtWriterName() {
		return cmtWriterName;
	}

	public void setCmtWriterName(String cmtWriterName) {
		this.cmtWriterName = cmtWriterName;
	}

	public Timestamp getCmtRegisterDatetime() {
		return cmtRegisterDatetime;
	}

	public void setCmtRegisterDatetime(Timestamp cmtRegisterDatetime) {
		this.cmtRegisterDatetime = cmtRegisterDatetime;
	}

	public Timestamp getCmtUpdatedDatetime() {
		return cmtUpdatedDatetime;
	}

	public void setCmtUpdatedDatetime(Timestamp cmtUpdatedDatetime) {
		this.cmtUpdatedDatetime = cmtUpdatedDatetime;
	}

	public String getCmtRegisterIp() {
		return cmtRegisterIp;
	}

	public void setCmtRegisterIp(String cmtRegisterIp) {
		this.cmtRegisterIp = cmtRegisterIp;
	}

	public String getCmtUpdatedIp() {
		return cmtUpdatedIp;
	}

	public void setCmtUpdatedIp(String cmtUpdatedIp) {
		this.cmtUpdatedIp = cmtUpdatedIp;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getCmtBlame() {
		return cmtBlame;
	}

	public void setCmtBlame(int cmtBlame) {
		this.cmtBlame = cmtBlame;
	}

	public char getCmtBlameAdmin() {
		return cmtBlameAdmin;
	}

	public void setCmtBlameAdmin(char cmtBlameAdmin) {
		this.cmtBlameAdmin = cmtBlameAdmin;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "QuestionMadangCmt [cmtNo=" + cmtNo + ", cmtParent=" + cmtParent + ", cmtSort=" + cmtSort
				+ ", cmtMadangNo=" + cmtMadangNo + ", cmtContent=" + cmtContent + ", cmtReply=" + cmtReply
				+ ", cmtWriterUid=" + cmtWriterUid + ", cmtWriter=" + cmtWriter + ", cmtWriterName=" + cmtWriterName
				+ ", cmtRegisterDatetime=" + cmtRegisterDatetime + ", cmtUpdatedDatetime=" + cmtUpdatedDatetime
				+ ", cmtRegisterIp=" + cmtRegisterIp + ", cmtUpdatedIp=" + cmtUpdatedIp + ", status=" + status
				+ ", cmtBlame=" + cmtBlame + ", cmtBlameAdmin=" + cmtBlameAdmin + ", profilePath=" + profilePath + "]";
	}
	
}
