package com.studium.story.model.vo;

public class Story {
	private int storyNo;
	private String storyStudentpicture;
	private String storyWrite;
	private String storyContent;
	private String storyTime;
	private String storyTeachername;
	private String storyTeacherpicture;
	
public Story() {
	// TODO Auto-generated constructor stub
}

public Story(int storyNo, String storyStudentpicture, String storyWrite, String storyContent, String storyTime,
		String storyTeachername, String storyTeacherpicture) {
	super();
	this.storyNo = storyNo;
	this.storyStudentpicture = storyStudentpicture;
	this.storyWrite = storyWrite;
	this.storyContent = storyContent;
	this.storyTime = storyTime;
	this.storyTeachername = storyTeachername;
	this.storyTeacherpicture = storyTeacherpicture;
}

public int getStoryNo() {
	return storyNo;
}

public void setStoryNo(int storyNo) {
	this.storyNo = storyNo;
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

public String getStoryTime() {
	return storyTime;
}

public void setStoryTime(String storyTime) {
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

@Override
public String toString() {
	return "Story [storyNo=" + storyNo + ", storyStudentpicture=" + storyStudentpicture + ", storyWrite=" + storyWrite
			+ ", storyContent=" + storyContent + ", storyTime=" + storyTime + ", storyTeachername=" + storyTeachername
			+ ", storyTeacherpicture=" + storyTeacherpicture + "]";
	}
}
