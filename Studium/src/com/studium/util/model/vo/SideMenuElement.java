package com.studium.util.model.vo;

public class SideMenuElement {	
	
	private int smUid; // PK
	private String smCategory; // 사이드 메뉴 요소를 적용할 최상단 카테고리(해당 명칭을 기준으로 각 페이지의 사이드메뉴 요소를 불러온다)
	private String smMenuName; // 사이드 메뉴 요소의 이름 
	private String smPrent; // 하위 요소의 경우, 상위 요소의 이름이 저장된다. 상위 요소의 경우 null값
	private int smOrder; // 요소들의 정렬 순서
	
	public SideMenuElement() {
		// TODO Auto-generated constructor stub
	}

	public SideMenuElement(int smUid, String smCategory, String smMenuName, String smPrent, int smOrder) {
		this.smUid = smUid;
		this.smCategory = smCategory;
		this.smMenuName = smMenuName;
		this.smPrent = smPrent;
		this.smOrder = smOrder;
	}

	public int getSmUid() {
		return smUid;
	}

	public void setSmUid(int smUid) {
		this.smUid = smUid;
	}

	public String getSmCategory() {
		return smCategory;
	}

	public void setSmCategory(String smCategory) {
		this.smCategory = smCategory;
	}

	public String getSmMenuName() {
		return smMenuName;
	}

	public void setSmMenuName(String smMenuName) {
		this.smMenuName = smMenuName;
	}

	public String getSmPrent() {
		return smPrent;
	}

	public void setSmPrent(String smPrent) {
		this.smPrent = smPrent;
	}

	public int getSmOrder() {
		return smOrder;
	}

	public void setSmOrder(int smOrder) {
		this.smOrder = smOrder;
	}

	@Override
	public String toString() {
		return "SideMenuElement [smUid=" + smUid + ", smCategory=" + smCategory + ", smMenuName=" + smMenuName
				+ ", smPrent=" + smPrent + ", smOrder=" + smOrder + "]";
	}
	
}
