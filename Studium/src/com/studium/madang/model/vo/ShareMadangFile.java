package com.studium.madang.model.vo;

public class ShareMadangFile {

	private int smfNo;
	private int madangNo;
	private int memberNo;
	private String smfOriginalFilename;
	private String smfRenameFilename;
	private int smfDownloadCount;
	private long smfFilesize;
	private String smfType;
	private String smfIp;
	
	public ShareMadangFile() {
		// TODO Auto-generated constructor stub
	}

	public ShareMadangFile(int smfNo, int madangNo, int memberNo, String smfOriginalFilename, String smfRenameFilename,
			int smfDownloadCount, long smfFilesize, String smfType, String smfIp) {
		super();
		this.smfNo = smfNo;
		this.madangNo = madangNo;
		this.memberNo = memberNo;
		this.smfOriginalFilename = smfOriginalFilename;
		this.smfRenameFilename = smfRenameFilename;
		this.smfDownloadCount = smfDownloadCount;
		this.smfFilesize = smfFilesize;
		this.smfType = smfType;
		this.smfIp = smfIp;
	}

	public int getSmfNo() {
		return smfNo;
	}

	public void setSmfNo(int smfNo) {
		this.smfNo = smfNo;
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

	public String getSmfOriginalFilename() {
		return smfOriginalFilename;
	}

	public void setSmfOriginalFilename(String smfOriginalFilename) {
		this.smfOriginalFilename = smfOriginalFilename;
	}

	public String getSmfRenameFilename() {
		return smfRenameFilename;
	}

	public void setSmfRenameFilename(String smfRenameFilename) {
		this.smfRenameFilename = smfRenameFilename;
	}

	public int getSmfDownloadCount() {
		return smfDownloadCount;
	}

	public void setSmfDownloadCount(int smfDownloadCount) {
		this.smfDownloadCount = smfDownloadCount;
	}

	public long getSmfFilesize() {
		return smfFilesize;
	}

	public void setSmfFilesize(long smfFilesize) {
		this.smfFilesize = smfFilesize;
	}

	public String getSmfType() {
		return smfType;
	}

	public void setSmfType(String smfType) {
		this.smfType = smfType;
	}

	public String getSmfIp() {
		return smfIp;
	}

	public void setSmfIp(String smfIp) {
		this.smfIp = smfIp;
	}

	@Override
	public String toString() {
		return "ShareMadangFile [smfNo=" + smfNo + ", madangNo=" + madangNo + ", memberNo=" + memberNo
				+ ", smfOriginalFilename=" + smfOriginalFilename + ", smfRenameFilename=" + smfRenameFilename
				+ ", smfDownloadCount=" + smfDownloadCount + ", smfFilesize=" + smfFilesize + ", smfType=" + smfType
				+ ", smfIp=" + smfIp + "]";
	}

	
	
}
