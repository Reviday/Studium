package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

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
	
	public FreeMadang selectMadang(int no, boolean hasRead) {
		Connection conn=getConnection();
		FreeMadang fm=dao.selectMadang(conn, no);
		if(!hasRead && fm!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return fm;
	}
	
	public Map<String, FreeMadang> selectPreNext(int madangNo) {
		Connection conn=getConnection();
		Map<String, FreeMadang> preNext=dao.selectPreNext(conn, madangNo);
		close(conn);
		return preNext;
	}
	
	public int insertMadang(FreeMadang fm) {
		Connection conn=getConnection();
		int result=dao.insertMadang(conn, fm);
	}
}
