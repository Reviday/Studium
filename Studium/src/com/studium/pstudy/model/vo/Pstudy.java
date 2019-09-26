package com.studium.pstudy.model.vo;

import java.security.Timestamp;
import java.sql.Date;

public class Pstudy {
	private int pNo;
	private String pTitle;
	private String pName;
	private String pArea;
	private String pDay;
	private int pStudypserson;
	private int pPrice;
	private String pCategory;
	private String pIntro1;
	private String pIntro2;
	private String pImgtitle;
	private String pImg1;
	private String pImg2;
	private String pImg3;
	private String pTimestart;
	private String pTimeend;
	private Date pDatestart;
	private Date pDateend;
	private int pLike;
	private String pTeachername;
	private int pStudyMember;
	public Pstudy() {
		// TODO Auto-generated constructor stub
	}
	public Pstudy(int pNo, String pTitle, String pName, String pArea, String pDay, int pStudypserson, int pPrice,
			String pCategory, String pIntro1, String pIntro2, String pImgtitle, String pImg1, String pImg2,
			String pImg3, String pTimestart, String pTimeend, Date pDatestart, Date pDateend, int pLike,
			String pTeachername, int pStudyMember) {
		super();
		this.pNo = pNo;
		this.pTitle = pTitle;
		this.pName = pName;
		this.pArea = pArea;
		this.pDay = pDay;
		this.pStudypserson = pStudypserson;
		this.pPrice = pPrice;
		this.pCategory = pCategory;
		this.pIntro1 = pIntro1;
		this.pIntro2 = pIntro2;
		this.pImgtitle = pImgtitle;
		this.pImg1 = pImg1;
		this.pImg2 = pImg2;
		this.pImg3 = pImg3;
		this.pTimestart = pTimestart;
		this.pTimeend = pTimeend;
		this.pDatestart = pDatestart;
		this.pDateend = pDateend;
		this.pLike = pLike;
		this.pTeachername = pTeachername;
		this.pStudyMember = pStudyMember;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpArea() {
		return pArea;
	}
	public void setpArea(String pArea) {
		this.pArea = pArea;
	}
	public String getpDay() {
		return pDay;
	}
	public void setpDay(String pDay) {
		this.pDay = pDay;
	}
	public int getpStudypserson() {
		return pStudypserson;
	}
	public void setpStudypserson(int pStudypserson) {
		this.pStudypserson = pStudypserson;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpIntro1() {
		return pIntro1;
	}
	public void setpIntro1(String pIntro1) {
		this.pIntro1 = pIntro1;
	}
	public String getpIntro2() {
		return pIntro2;
	}
	public void setpIntro2(String pIntro2) {
		this.pIntro2 = pIntro2;
	}
	public String getpImgtitle() {
		return pImgtitle;
	}
	public void setpImgtitle(String pImgtitle) {
		this.pImgtitle = pImgtitle;
	}
	public String getpImg1() {
		return pImg1;
	}
	public void setpImg1(String pImg1) {
		this.pImg1 = pImg1;
	}
	public String getpImg2() {
		return pImg2;
	}
	public void setpImg2(String pImg2) {
		this.pImg2 = pImg2;
	}
	public String getpImg3() {
		return pImg3;
	}
	public void setpImg3(String pImg3) {
		this.pImg3 = pImg3;
	}
	public String getpTimestart() {
		return pTimestart;
	}
	public void setpTimestart(String pTimestart) {
		this.pTimestart = pTimestart;
	}
	public String getpTimeend() {
		return pTimeend;
	}
	public void setpTimeend(String pTimeend) {
		this.pTimeend = pTimeend;
	}
	public Date getpDatestart() {
		return pDatestart;
	}
	public void setpDatestart(Date pDatestart) {
		this.pDatestart = pDatestart;
	}
	public Date getpDateend() {
		return pDateend;
	}
	public void setpDateend(Date pDateend) {
		this.pDateend = pDateend;
	}
	public int getpLike() {
		return pLike;
	}
	public void setpLike(int pLike) {
		this.pLike = pLike;
	}
	public String getpTeachername() {
		return pTeachername;
	}
	public void setpTeachername(String pTeachername) {
		this.pTeachername = pTeachername;
	}
	public int getpStudyMember() {
		return pStudyMember;
	}
	public void setpStudyMember(int pStudyMember) {
		this.pStudyMember = pStudyMember;
	}
	@Override
	public String toString() {
		return "Pstudy [pNo=" + pNo + ", pTitle=" + pTitle + ", pName=" + pName + ", pArea=" + pArea + ", pDay=" + pDay
				+ ", pStudypserson=" + pStudypserson + ", pPrice=" + pPrice + ", pCategory=" + pCategory + ", pIntro1="
				+ pIntro1 + ", pIntro2=" + pIntro2 + ", pImgtitle=" + pImgtitle + ", pImg1=" + pImg1 + ", pImg2="
				+ pImg2 + ", pImg3=" + pImg3 + ", pTimestart=" + pTimestart + ", pTimeend=" + pTimeend + ", pDatestart="
				+ pDatestart + ", pDateend=" + pDateend + ", pLike=" + pLike + ", pTeachername=" + pTeachername
				+ ", pStudyMember=" + pStudyMember + "]";
	}	
	
	
	


}
