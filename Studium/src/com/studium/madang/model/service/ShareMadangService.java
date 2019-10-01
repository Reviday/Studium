package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.studium.madang.model.dao.ShareMadangDao;
import com.studium.madang.model.vo.BoastMadang;
import com.studium.madang.model.vo.ShareMadang;
import com.studium.madang.model.vo.ShareMadangFile;

public class ShareMadangService {

	private ShareMadangDao dao = new ShareMadangDao();

	public int selectCountList() {
		Connection conn = getConnection();
		int result = dao.selectCountList(conn);
		close(conn);
		return result;
	}
	
	public int selectCountList(String choiceSub) {
		Connection conn = getConnection();
		int result = dao.selectCountList(conn, choiceSub);
		close(conn);
		return result;
	}

	public List<ShareMadang> selectMadangList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<ShareMadang> list = dao.selectMadangList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<ShareMadang> selectMadangList(String mCategory, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<ShareMadang> list = dao.selectMadangList(conn, mCategory, cPage, numPerPage);
		close(conn);
		return list;
	}

	public ShareMadang selectMadang(int no, boolean hasRead) {
		Connection conn = getConnection();
		ShareMadang fm = dao.selectMadang(conn, no);
		if (!hasRead && fm != null) {
			int result = dao.updateReadCount(conn, no);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
		}
		close(conn);
		return fm;
	}

	public Map<String, ShareMadang> selectPreNext(int madangNo) {
		Connection conn = getConnection();
		Map<String, ShareMadang> preNext = dao.selectPreNext(conn, madangNo);
		close(conn);
		return preNext;
	}

	public int insertMadang(ShareMadang sm) {
		Connection conn = getConnection();
		int result = dao.insertMadang(conn, sm);
		int madangNo = -1;
		if (result > 0) {
			commit(conn);
			madangNo = dao.selectSeqCurrval(conn);
		} else
			rollback(conn);
		close(conn);
		return madangNo;
	}
	
	public int insertFile(ShareMadangFile smf) {
		Connection conn=getConnection();
		int result=dao.insertFile(conn, smf);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateMadang(ShareMadang sm) {
		Connection conn=getConnection();
		int check=dao.checkWriter(conn, sm);
		if(sm.getMadangWriterUid()==10000) check=1; //관리자 예외
		int result=-1;
		if(check>0) {
			result=dao.updateMadang(conn, sm);
			if(result>0) {
				commit(conn);
			} rollback(conn);
		} 
		close(conn);
		return result;
	}
	
	public int deleteMadang(ShareMadang sm) {
		Connection conn=getConnection();
		int check=dao.checkWriter(conn, sm);
		if(sm.getMadangWriterUid()==10000) check=1; //관리자 예외
		int result=-1;
		if(check>0) {
			result=dao.deleteMadang(conn, sm);
			if(result>0) {
				commit(conn);
			} rollback(conn);
		} 
		close(conn);
		return result;
	}
}
