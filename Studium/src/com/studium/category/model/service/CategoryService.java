package com.studium.category.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.studium.category.model.dao.CategoryDao;
import com.studium.category.model.vo.Category;

public class CategoryService {

	private CategoryDao dao = new CategoryDao();

	public List<Category> selectAll() {
		Connection conn = getConnection();
		List<Category> list = dao.selectAll(conn);
		close(conn);
		return list;
	}

	// 중분류값가져오기
	public List<Category> selectTitleM() {
		Connection conn = getConnection();
		List<Category> list = dao.selectTitleM(conn);
		close(conn);
		return list;
	}

	// 대분류값가져오기
	public List<Category> selectTitleB() {
		Connection conn = getConnection();
		List<Category> list = dao.selectTitleB(conn);
		close(conn);
		return list;
	}

}
