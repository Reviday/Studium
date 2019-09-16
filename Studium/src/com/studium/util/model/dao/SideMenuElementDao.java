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
				element.setSmUid(rs.getInt("sm_uid"));
				element.setSmCategory(rs.getString("sm_category"));
				element.setSmMenuName(rs.getString("sm_menu_name"));
				element.setSmParent(rs.getString("sm_parent"));
				element.setSmOrder(rs.getInt("sm_order"));
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
