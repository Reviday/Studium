package com.studium.category.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.studium.category.model.vo.Category;

public class CategoryDao {

	private Properties prop=new Properties();

	public CategoryDao() {
		String path=CategoryDao.class.getResource("/sql/category/category-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Category> selectAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectAll");
		List <Category>list =new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			System.out.println(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				Category c=new Category();
				c.setCategoryBId(rs.getString("category_b_id"));
				c.setCategoryMId(rs.getString("category_m_id"));
				c.setCategorySId(rs.getInt("category_s_id"));
				c.setTitleS(rs.getString("title_s"));
				c.setTitleM(rs.getString("title_m"));
				c.setTitleB(rs.getString("title_b"));
				list.add(c);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
}
