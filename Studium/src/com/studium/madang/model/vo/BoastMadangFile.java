package com.studium.madang.model.vo;

public class BoastMadangFile {

	private int bmfNo;
	private int madangNo;
	private int memberNo;
	private String bmfOriginalFilename;
	private String bmfRenameFilename;
	private int bmfDownloadCount;
	private long bmfFilesize;
	private String bmfType;
	private String bmfIp;
	
	public BoastMadangFile() {
		// TODO Auto-generated constructor stub
	}

	public BoastMadangFile(int bmfNo, int madangNo, int memberNo, String bmfOriginalFilename, String bmfRenameFilename,
			int bmfDownloadCount, long bmfFilesize, String bmfType, String bmfIp) {
		super();
		this.bmfNo = bmfNo;
		this.madangNo = madangNo;
		this.memberNo = memberNo;
		this.bmfOriginalFilename = bmfOriginalFilename;
		this.bmfRenameFilename = bmfRenameFilename;
		this.bmfDownloadCount = bmfDownloadCount;
		this.bmfFilesize = bmfFilesize;
		this.bmfType = bmfType;
		this.bmfIp = bmfIp;
	}

	public int getBmfNo() {
		return bmfNo;
	}

	public void setBmfNo(int bmfNo) {
		this.bmfNo = bmfNo;
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

	public String getBmfOriginalFilename() {
		return bmfOriginalFilename;
	}

	public void setBmfOriginalFilename(String bmfOriginalFilename) {
		this.bmfOriginalFilename = bmfOriginalFilename;
	}

	public String getBmfRenameFilename() {
		return bmfRenameFilename;
	}

	public void setBmfRenameFilename(String bmfRenameFilename) {
		this.bmfRenameFilename = bmfRenameFilename;
	}

	public int getBmfDownloadCount() {
		return bmfDownloadCount;
	}

	public void setBmfDownloadCount(int bmfDownloadCount) {
		this.bmfDownloadCount = bmfDownloadCount;
	}

	public long getBmfFilesize() {
		return bmfFilesize;
	}

	public void setBmfFilesize(long bmfFilesize) {
		this.bmfFilesize = bmfFilesize;
	}

	public String getBmfType() {
		return bmfType;
	}

	public void setBmfType(String bmfType) {
		this.bmfType = bmfType;
	}

	public String getBmfIp() {
		return bmfIp;
	}

	public void setBmfIp(String bmfIp) {
		this.bmfIp = bmfIp;
	}

	@Override
	public String toString() {
		return "BoastMadangFile [bmfNo=" + bmfNo + ", madangNo=" + madangNo + ", memberNo=" + memberNo
				+ ", bmfOriginalFilename=" + bmfOriginalFilename + ", bmfRenameFilename=" + bmfRenameFilename
				+ ", bmfDownloadCount=" + bmfDownloadCount + ", bmfFilesize=" + bmfFilesize + ", bmfType=" + bmfType
				+ ", bmfIp=" + bmfIp + "]";
	}
	
}
