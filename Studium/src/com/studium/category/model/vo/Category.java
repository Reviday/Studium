package com.studium.category.model.vo;

public class Category {
	private String categoryBId;//대분류의 카테고리아이디
	private String categoryMId;//중분류의 카테고리아이디
	private int categorySId; //소분류의카테고리아이디
	 private String titleS;//소분류의 카테고리 이름
	 private String titleM;//중분류의 카테고리 이름
	 private String titleB;//대분류의 카테고리 이름
	 
public Category() {
	// TODO Auto-generated constructor stub
}


@Override
public String toString() {
	return "CategoryS [categoryBId=" + categoryBId + ", categoryMId=" + categoryMId + ", categorySId=" + categorySId
			+ ", titleS=" + titleS + ", titleM=" + titleM + ", titleB=" + titleB + "]";
}


public String getCategoryBId() {
	return categoryBId;
}


public void setCategoryBId(String categoryBId) {
	this.categoryBId = categoryBId;
}


public String getCategoryMId() {
	return categoryMId;
}


public void setCategoryMId(String categoryMId) {
	this.categoryMId = categoryMId;
}


public int getCategorySId() {
	return categorySId;
}


public void setCategorySId(int categorySId) {
	this.categorySId = categorySId;
}


public String getTitleS() {
	return titleS;
}


public void setTitleS(String titleS) {
	this.titleS = titleS;
}


public String getTitleM() {
	return titleM;
}


public void setTitleM(String titleM) {
	this.titleM = titleM;
}


public String getTitleB() {
	return titleB;
}


public void setTitleB(String titleB) {
	this.titleB = titleB;
}

}
