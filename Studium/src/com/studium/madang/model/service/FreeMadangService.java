package com.studium.madang.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.studium.madang.model.dao.FreeMadangDao;
import com.studium.madang.model.vo.FreeMadang;

public class FreeMadangService {

	private FreeMadangDao dao=new FreeMadangDao();
	
	public List<FreeMadang> selectMadangList() {
		Connection conn=getConnection();
		List<FreeMadang> list=dao.selectMadangList(conn);
		close(conn);
		return list;
	}
}
