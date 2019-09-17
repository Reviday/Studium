package com.studium.util.model.vo;

public class SideMenuElement {	
	
	private int menuId; // 기본키
	private String menuCategory; // 메뉴가 사용될 위치
	private String menuName; // 메뉴 이름
	private String menuUrl; // 이동시킬 경로
	private String menuClass; // 메뉴에 설정할 class (아이콘 설정용//하위메뉴는 null)
	private char useDown; // 하위 메뉴 사용 여부
	private int sortNo; // 정렬 순서
	private int parentId; // 부모 메뉴의 id
	
	public SideMenuElement() {
		// TODO Auto-generated constructor stub
	}

	public SideMenuElement(int menuId, String menuCategory, String menuName, String menuUrl, String menuClass,
			char useDown, int sortNo, int parentId) {
		super();
		this.menuId = menuId;
		this.menuCategory = menuCategory;
		this.menuName = menuName;
		this.menuUrl = menuUrl;
		this.menuClass = menuClass;
		this.useDown = useDown;
		this.sortNo = sortNo;
		this.parentId = parentId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getMenuCategory() {
		return menuCategory;
	}

	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuClass() {
		return menuClass;
	}

	public void setMenuClass(String menuClass) {
		this.menuClass = menuClass;
	}

	public char getUseDown() {
		return useDown;
	}

	public void setUseDown(char useDown) {
		this.useDown = useDown;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	@Override
	public String toString() {
		return "SideMenuElement [menuId=" + menuId + ", menuCategory=" + menuCategory + ", menuName=" + menuName
				+ ", menuUrl=" + menuUrl + ", menuClass=" + menuClass + ", useDown=" + useDown + ", sortNo=" + sortNo
				+ ", parentId=" + parentId + "]";
	}
	
}
