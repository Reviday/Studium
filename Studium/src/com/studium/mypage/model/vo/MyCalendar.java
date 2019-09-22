package com.studium.mypage.model.vo;

import java.util.Date;

import com.sun.jmx.snmp.Timestamp;

public class MyCalendar {
	
		private int editNo;
		private int memNo;
		private String memberName;
		private String editTitle;
		private String editStart;
		private String editEnd;
		private String editcolor;
		private String editdesc;
		
		
		public MyCalendar() {
			// TODO Auto-generated constructor stub
		}


		public MyCalendar(int editNo, int memNo, String memberName, String editTitle, String editStart, String editEnd,
				String editcolor, String editdesc) {
			super();
			this.editNo = editNo;
			this.memNo = memNo;
			this.memberName = memberName;
			this.editTitle = editTitle;
			this.editStart = editStart;
			this.editEnd = editEnd;
			this.editcolor = editcolor;
			this.editdesc = editdesc;
		}


		public int getEditNo() {
			return editNo;
		}


		public void setEditNo(int editNo) {
			this.editNo = editNo;
		}


		public int getMemNo() {
			return memNo;
		}


		public void setMemNo(int memNo) {
			this.memNo = memNo;
		}


		public String getMemberName() {
			return memberName;
		}


		public void setMemberName(String memberName) {
			this.memberName = memberName;
		}


		public String getEditTitle() {
			return editTitle;
		}


		public void setEditTitle(String editTitle) {
			this.editTitle = editTitle;
		}


		public String getEditStart() {
			return editStart;
		}


		public void setEditStart(String editStart) {
			this.editStart = editStart;
		}


		public String getEditEnd() {
			return editEnd;
		}


		public void setEditEnd(String editEnd) {
			this.editEnd = editEnd;
		}


		public String getEditcolor() {
			return editcolor;
		}


		public void setEditcolor(String editcolor) {
			this.editcolor = editcolor;
		}


		public String getEditdesc() {
			return editdesc;
		}


		public void setEditdesc(String editdesc) {
			this.editdesc = editdesc;
		}


		@Override
		public String toString() {
			return "MyCalendar [editNo=" + editNo + ", memNo=" + memNo + ", memberName=" + memberName + ", editTitle="
					+ editTitle + ", editStart=" + editStart + ", editEnd=" + editEnd + ", editcolor=" + editcolor
					+ ", editdesc=" + editdesc + "]";
		}

		
		
		
		
		
		

}
