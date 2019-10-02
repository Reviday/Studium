package com.studium.madang.model.vo;

public class QuestionMadangFile {

	private int qmfNo;
	private int madangNo;
	private int memberNo;
	private String qmfOriginalFilename;
	private String qmfRenameFilename;
	private int qmfDownloadCount;
	private long qmfFilesize;
	private String qmfType;
	private String qmfIp;
	
	public QuestionMadangFile() {
		// TODO Auto-generated constructor stub
	}

	public QuestionMadangFile(int qmfNo, int madangNo, int memberNo, String qmfOriginalFilename,
			String qmfRenameFilename, int qmfDownloadCount, long qmfFilesize, String qmfType, String qmfIp) {
		super();
		this.qmfNo = qmfNo;
		this.madangNo = madangNo;
		this.memberNo = memberNo;
		this.qmfOriginalFilename = qmfOriginalFilename;
		this.qmfRenameFilename = qmfRenameFilename;
		this.qmfDownloadCount = qmfDownloadCount;
		this.qmfFilesize = qmfFilesize;
		this.qmfType = qmfType;
		this.qmfIp = qmfIp;
	}

	public int getQmfNo() {
		return qmfNo;
	}

	public void setQmfNo(int qmfNo) {
		this.qmfNo = qmfNo;
	}

	public int getMadangNo() {
		return madangNo;
	}

	public void setMadangNo(int madangNo) {
		this.madangNo = madangNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getQmfOriginalFilename() {
		return qmfOriginalFilename;
	}

	public void setQmfOriginalFilename(String qmfOriginalFilename) {
		this.qmfOriginalFilename = qmfOriginalFilename;
	}

	public String getQmfRenameFilename() {
		return qmfRenameFilename;
	}

	public void setQmfRenameFilename(String qmfRenameFilename) {
		this.qmfRenameFilename = qmfRenameFilename;
	}

	public int getQmfDownloadCount() {
		return qmfDownloadCount;
	}

	public void setQmfDownloadCount(int qmfDownloadCount) {
		this.qmfDownloadCount = qmfDownloadCount;
	}

	public long getQmfFilesize() {
		return qmfFilesize;
	}

	public void setQmfFilesize(long qmfFilesize) {
		this.qmfFilesize = qmfFilesize;
	}

	public String getQmfType() {
		return qmfType;
	}

	public void setQmfType(String qmfType) {
		this.qmfType = qmfType;
	}

	public String getQmfIp() {
		return qmfIp;
	}

	public void setQmfIp(String qmfIp) {
		this.qmfIp = qmfIp;
	}

	@Override
	public String toString() {
		return "QuestionMadangFile [qmfNo=" + qmfNo + ", madangNo=" + madangNo + ", memberNo=" + memberNo
				+ ", qmfOriginalFilename=" + qmfOriginalFilename + ", qmfRenameFilename=" + qmfRenameFilename
				+ ", qmfDownloadCount=" + qmfDownloadCount + ", qmfFilesize=" + qmfFilesize + ", qmfType=" + qmfType
				+ ", qmfIp=" + qmfIp + "]";
	}
	
}
