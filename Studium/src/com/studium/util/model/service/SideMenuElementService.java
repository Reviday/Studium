package com.studium.util.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.studium.util.model.dao.SideMenuElementDao;
import com.studium.util.model.vo.SideMenuElement;

public class SideMenuElementService {
	
	private SideMenuElementDao dao=new SideMenuElementDao();

	public List<SideMenuElement> selectElements(String category) {
		Connection conn=getConnection();
		List<SideMenuElement> elements=dao.selectElements(conn, category);
		close(conn);
		return elements;
	}
}
