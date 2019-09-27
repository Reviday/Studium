package com.studium.member.model.vo;

public class MyMemo {
	private int memoId;
	private int memNo;
	private int memoFrontId;
	private String memoContents;
	private int memoLeft;
	private int memoTop;
	private char memoDeleteStatus;
	
	public MyMemo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MyMemo [memoId=" + memoId + ", memNo=" + memNo + ", memoFrontId=" + memoFrontId + ", memoContents="
				+ memoContents + ", memoLeft=" + memoLeft + ", memoTop=" + memoTop + ", memoDeleteStatus="
				+ memoDeleteStatus + "]";
	}

	public int getMemoId() {
		return memoId;
	}

	public void setMemoId(int memoId) {
		this.memoId = memoId;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getMemoFrontId() {
		return memoFrontId;
	}

	public void setMemoFrontId(int memoFrontId) {
		this.memoFrontId = memoFrontId;
	}

	public String getMemoContents() {
		return memoContents;
	}

	public void setMemoContents(String memoContents) {
		this.memoContents = memoContents;
	}

	public int getMemoLeft() {
		return memoLeft;
	}

	public void setMemoLeft(int memoLeft) {
		this.memoLeft = memoLeft;
	}

	public int getMemoTop() {
		return memoTop;
	}

	public void setMemoTop(int memoTop) {
		this.memoTop = memoTop;
	}

	public char getMemoDeleteStatus() {
		return memoDeleteStatus;
	}

	public void setMemoDeleteStatus(char memoDeleteStatus) {
		this.memoDeleteStatus = memoDeleteStatus;
	}
	
}
