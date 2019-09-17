package com.studium.util.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.studium.util.model.vo.SideMenuElement;
import static common.template.JDBCTemplate.close;

public class SideMenuElementDao {

	private Properties prop=new Properties();
	
	public SideMenuElementDao() {
		String path=SideMenuElementDao.class.getResource("/sql/util/sidemenuelement-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} 
	}
	
	public List<SideMenuElement> selectElements(Connection conn, String category) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SideMenuElement> elements=new ArrayList<SideMenuElement>();
		String sql=prop.getProperty("selectElements");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				SideMenuElement element=new SideMenuElement();
				element.setMenuId(rs.getInt("menu_id"));
				element.setMenuCategory(rs.getString("menu_category"));
				element.setMenuName(rs.getString("menu_name"));
				element.setMenuUrl(rs.getString("menu_url"));
				element.setMenuClass(rs.getString("menu_class"));
				element.setUseDown(rs.getString("use_down").charAt(0));
				element.setSortNo(rs.getInt("sort_no"));
				element.setParentId(rs.getInt("parent_id"));
				elements.add(element);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return elements;
	}
	
}
