package com.studium.admin.model.vo;

public class FAQ {

	private int faqNO; //게시글번호
	private String faqType; //질문종류
	private String faqTitle; //질문제목
	private String faqContent; //질문내용
	
	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(int faqNO, String faqType, String faqTitle, String faqContent) {
		super();
		this.faqNO = faqNO;
		this.faqType = faqType;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public int getFaqNO() {
		return faqNO;
	}

	public void setFaqNO(int faqNO) {
		this.faqNO = faqNO;
	}

	public String getFaqType() {
		return faqType;
	}

	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	@Override
	public String toString() {
		return "FAQ [faqNO=" + faqNO + ", faqType=" + faqType + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent
				+ "]";
	}
	
	
	
}
