package com.studium.madang.model.vo;

public class FreeMadangFile {

	private int fmfNo;
	private int madangNo;
	private int memberNo;
	private String fmfOriginalFilename;
	private String fmfRenameFilename;
	private int fmfDownloadCount;
	private long fmfFilesize;
	private String fmfType;
	private String fmfIp;
	
	public FreeMadangFile() {
		// TODO Auto-generated constructor stub
	}

	public FreeMadangFile(int fmfNo, int madangNo, int memberNo, String fmfOriginalFilename, String fmfRenameFilename,
			int fmfDownloadCount, long fmfFilesize, String fmfType, String fmfIp) {
		super();
		this.fmfNo = fmfNo;
		this.madangNo = madangNo;
		this.memberNo = memberNo;
		this.fmfOriginalFilename = fmfOriginalFilename;
		this.fmfRenameFilename = fmfRenameFilename;
		this.fmfDownloadCount = fmfDownloadCount;
		this.fmfFilesize = fmfFilesize;
		this.fmfType = fmfType;
		this.fmfIp = fmfIp;
	}

	public int getFmfNo() {
		return fmfNo;
	}

	public void setFmfNo(int fmfNo) {
		this.fmfNo = fmfNo;
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

	public String getFmfOriginalFilename() {
		return fmfOriginalFilename;
	}

	public void setFmfOriginalFilename(String fmfOriginalFilename) {
		this.fmfOriginalFilename = fmfOriginalFilename;
	}

	public String getFmfRenameFilename() {
		return fmfRenameFilename;
	}

	public void setFmfRenameFilename(String fmfRenameFilename) {
		this.fmfRenameFilename = fmfRenameFilename;
	}

	public int getFmfDownloadCount() {
		return fmfDownloadCount;
	}

	public void setFmfDownloadCount(int fmfDownloadCount) {
		this.fmfDownloadCount = fmfDownloadCount;
	}

	public long getFmfFilesize() {
		return fmfFilesize;
	}

	public void setFmfFilesize(long fmfFilesize) {
		this.fmfFilesize = fmfFilesize;
	}

	public String getFmfType() {
		return fmfType;
	}

	public void setFmfType(String fmfType) {
		this.fmfType = fmfType;
	}

	public String getFmfIp() {
		return fmfIp;
	}

	public void setFmfIp(String fmfIp) {
		this.fmfIp = fmfIp;
	}

	@Override
	public String toString() {
		return "FreeMadangFile [fmfNo=" + fmfNo + ", madangNo=" + madangNo + ", memberNo=" + memberNo
				+ ", fmfOriginalFilename=" + fmfOriginalFilename + ", fmfRenameFilename=" + fmfRenameFilename
				+ ", fmfDownloadCount=" + fmfDownloadCount + ", fmfFilesize=" + fmfFilesize + ", fmfType=" + fmfType
				+ ", fmfIp=" + fmfIp + "]";
	}

}
