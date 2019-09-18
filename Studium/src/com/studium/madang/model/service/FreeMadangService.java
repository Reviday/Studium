package com.studium.madang.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.studium.madang.model.dao.FreeMadangDao;
import com.studium.madang.model.vo.FreeMadang;

public class FreeMadangService {

	private FreeMadangDao dao=new FreeMadangDao();
	
	public int selectCountList() {
		Connection conn=getConnection();
		int result=dao.selectCountList(conn);
		close(conn);
		return result;
	}
	
	public List<FreeMadang> selectMadangList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<FreeMadang> list=dao.selectMadangList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public FreeMadang selectMadang(int no) {
		Connection conn=getConnection();
		FreeMadang fm=dao.selectMadang(conn, no);
		close(conn);
		return fm;
	}
	
}
