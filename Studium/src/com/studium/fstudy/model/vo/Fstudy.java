package com.studium.fstudy.model.vo;

import java.sql.Date;

public class Fstudy {
	
	private int fNo;
	private String fTitle;
	private String fName;
	private String fArea;
	private String fDay;
	private int fStudypserson;
	private String fCategory;
	private String fIntro1;
	private String fIntro2;
	private String fImgtitle;
	private String fImg1;
	private String fImg2;
	private String fImg3;
	private String fTimestart;
	private String fTimeend;
	private Date fDatestart;
	private Date fDateend;
	private int fLike;
	private String fReadername;

	public Fstudy() {
		// TODO Auto-generated constructor stub
	}

	public Fstudy(int fNo, String fTitle, String fName, String fArea, String fDay, int fStudypserson, String fCategory,
			String fIntro1, String fIntro2, String fImgtitle, String fImg1, String fImg2, String fImg3,
			String fTimestart, String fTimeend, Date fDatestart, Date fDateend, int fLike, String fReadername) {
		super();
		this.fNo = fNo;
		this.fTitle = fTitle;
		this.fName = fName;
		this.fArea = fArea;
		this.fDay = fDay;
		this.fStudypserson = fStudypserson;
		this.fCategory = fCategory;
		this.fIntro1 = fIntro1;
		this.fIntro2 = fIntro2;
		this.fImgtitle = fImgtitle;
		this.fImg1 = fImg1;
		this.fImg2 = fImg2;
		this.fImg3 = fImg3;
		this.fTimestart = fTimestart;
		this.fTimeend = fTimeend;
		this.fDatestart = fDatestart;
		this.fDateend = fDateend;
		this.fLike = fLike;
		this.fReadername = fReadername;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfArea() {
		return fArea;
	}

	public void setfArea(String fArea) {
		this.fArea = fArea;
	}

	public String getfDay() {
		return fDay;
	}

	public void setfDay(String fDay) {
		this.fDay = fDay;
	}

	public int getfStudypserson() {
		return fStudypserson;
	}

	public void setfStudypserson(int fStudypserson) {
		this.fStudypserson = fStudypserson;
	}

	public String getfCategory() {
		return fCategory;
	}

	public void setfCategory(String fCategory) {
		this.fCategory = fCategory;
	}

	public String getfIntro1() {
		return fIntro1;
	}

	public void setfIntro1(String fIntro1) {
		this.fIntro1 = fIntro1;
	}

	public String getfIntro2() {
		return fIntro2;
	}

	public void setfIntro2(String fIntro2) {
		this.fIntro2 = fIntro2;
	}

	public String getfImgtitle() {
		return fImgtitle;
	}

	public void setfImgtitle(String fImgtitle) {
		this.fImgtitle = fImgtitle;
	}

	public String getfImg1() {
		return fImg1;
	}

	public void setfImg1(String fImg1) {
		this.fImg1 = fImg1;
	}

	public String getfImg2() {
		return fImg2;
	}

	public void setfImg2(String fImg2) {
		this.fImg2 = fImg2;
	}

	public String getfImg3() {
		return fImg3;
	}

	public void setfImg3(String fImg3) {
		this.fImg3 = fImg3;
	}

	public String getfTimestart() {
		return fTimestart;
	}

	public void setfTimestart(String fTimestart) {
		this.fTimestart = fTimestart;
	}

	public String getfTimeend() {
		return fTimeend;
	}

	public void setfTimeend(String fTimeend) {
		this.fTimeend = fTimeend;
	}

	public Date getfDatestart() {
		return fDatestart;
	}

	public void setfDatestart(Date fDatestart) {
		this.fDatestart = fDatestart;
	}

	public Date getfDateend() {
		return fDateend;
	}

	public void setfDateend(Date fDateend) {
		this.fDateend = fDateend;
	}

	public int getfLike() {
		return fLike;
	}

	public void setfLike(int fLike) {
		this.fLike = fLike;
	}

	public String getfReadername() {
		return fReadername;
	}

	public void setfReadername(String fReadername) {
		this.fReadername = fReadername;
	}

	@Override
	public String toString() {
		return "Fstudy [fNo=" + fNo + ", fTitle=" + fTitle + ", fName=" + fName + ", fArea=" + fArea + ", fDay=" + fDay
				+ ", fStudypserson=" + fStudypserson + ", fCategory=" + fCategory + ", fIntro1=" + fIntro1
				+ ", fIntro2=" + fIntro2 + ", fImgtitle=" + fImgtitle + ", fImg1=" + fImg1 + ", fImg2=" + fImg2
				+ ", fImg3=" + fImg3 + ", fTimestart=" + fTimestart + ", fTimeend=" + fTimeend + ", fDatestart="
				+ fDatestart + ", fDateend=" + fDateend + ", fLike=" + fLike + ", fReadername=" + fReadername + "]";
	}
	
}

 

