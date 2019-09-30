package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.studium.madang.model.dao.BoastMadangDao;
import com.studium.madang.model.vo.BoastMadang;

public class BoastMadangService {

	private BoastMadangDao dao=new BoastMadangDao();
	
	public int selectCountList() {
		Connection conn=getConnection();
		int result=dao.selectCountList(conn);
		close(conn);
		return result;
	}
	
	public int selectCountList(String choiceSub) {
		Connection conn=getConnection();
		int result=dao.selectCountList(conn, choiceSub);
		close(conn);
		return result;
	}
	
	public List<BoastMadang> selectMadangList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<BoastMadang> list=dao.selectMadangList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<BoastMadang> selectMadangList(String choiceSub, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<BoastMadang> list=dao.selectMadangList(conn, choiceSub, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public BoastMadang selectMadang(int no, boolean hasRead) {
		Connection conn=getConnection();
		BoastMadang bm=dao.selectMadang(conn, no);
		if(!hasRead && bm!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return bm;
	}
	
	public Map<String, BoastMadang> selectPreNext(int madangNo) {
		Connection conn=getConnection();
		Map<String, BoastMadang> preNext=dao.selectPreNext(conn, madangNo);
		close(conn);
		return preNext;
	}
	
	public int insertMadang(BoastMadang bm) {
		Connection conn=getConnection();
		int result=dao.insertMadang(conn, bm);
		int madangNo=-1;
		if(result>0) {
			commit(conn);
			madangNo=dao.selectSeqCurrval(conn);
		}
		else rollback(conn);
		close(conn);
		return madangNo;
	}
}
