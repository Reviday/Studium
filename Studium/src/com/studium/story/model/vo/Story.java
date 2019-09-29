package com.studium.story.model.vo;

import java.sql.Timestamp;

public class Story {
	private int storyNo; 
	private int memNo;
	private int pNo;
	private String storyStudentpicture; //학생사진
	private String storyWrite; //글쓴이이름
	private String storyContent; // 글 내용
	private Timestamp storyTime; // 글 올린 시간
	private String storyTeachername; // 강사 이름
	private String storyTeacherpicture; //강사 사진
	private String storySubject; //배운 과목
	private int storyStar; //별 갯수
	
public Story() {
	// TODO Auto-generated constructor stub
}

public Story(int storyNo, int memNo, int pNo, String storyStudentpicture, String storyWrite, String storyContent,
		Timestamp storyTime, String storyTeachername, String storyTeacherpicture, String storySubject, int storyStar) {
	super();
	this.storyNo = storyNo;
	this.memNo = memNo;
	this.pNo = pNo;
	this.storyStudentpicture = storyStudentpicture;
	this.storyWrite = storyWrite;
	this.storyContent = storyContent;
	this.storyTime = storyTime;
	this.storyTeachername = storyTeachername;
	this.storyTeacherpicture = storyTeacherpicture;
	this.storySubject = storySubject;
	this.storyStar = storyStar;
}

public int getStoryNo() {
	return storyNo;
}

public void setStoryNo(int storyNo) {
	this.storyNo = storyNo;
}

public int getMemNo() {
	return memNo;
}

public void setMemNo(int memNo) {
	this.memNo = memNo;
}

public int getpNo() {
	return pNo;
}

public void setpNo(int pNo) {
	this.pNo = pNo;
}

public String getStoryStudentpicture() {
	return storyStudentpicture;
}

public void setStoryStudentpicture(String storyStudentpicture) {
	this.storyStudentpicture = storyStudentpicture;
}

public String getStoryWrite() {
	return storyWrite;
}

public void setStoryWrite(String storyWrite) {
	this.storyWrite = storyWrite;
}

public String getStoryContent() {
	return storyContent;
}

public void setStoryContent(String storyContent) {
	this.storyContent = storyContent;
}

public Timestamp getStoryTime() {
	return storyTime;
}

public void setStoryTime(Timestamp storyTime) {
	this.storyTime = storyTime;
}

public String getStoryTeachername() {
	return storyTeachername;
}

public void setStoryTeachername(String storyTeachername) {
	this.storyTeachername = storyTeachername;
}

public String getStoryTeacherpicture() {
	return storyTeacherpicture;
}

public void setStoryTeacherpicture(String storyTeacherpicture) {
	this.storyTeacherpicture = storyTeacherpicture;
}

public String getStorySubject() {
	return storySubject;
}

public void setStorySubject(String storySubject) {
	this.storySubject = storySubject;
}

public int getStoryStar() {
	return storyStar;
}

public void setStoryStar(int storyStar) {
	this.storyStar = storyStar;
}

@Override
public String toString() {
	return "Story [storyNo=" + storyNo + ", memNo=" + memNo + ", pNo=" + pNo + ", storyStudentpicture="
			+ storyStudentpicture + ", storyWrite=" + storyWrite + ", storyContent=" + storyContent + ", storyTime="
			+ storyTime + ", storyTeachername=" + storyTeachername + ", storyTeacherpicture=" + storyTeacherpicture
			+ ", storySubject=" + storySubject + ", storyStar=" + storyStar + "]";
}



}