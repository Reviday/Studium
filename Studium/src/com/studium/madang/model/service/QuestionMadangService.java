package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.studium.madang.model.dao.QuestionMadangDao;
import com.studium.madang.model.vo.QuestionMadang;
import com.studium.madang.model.vo.QuestionMadangFile;

public class QuestionMadangService {
private QuestionMadangDao dao=new QuestionMadangDao();
	
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
	
	public List<QuestionMadang> selectMadangList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<QuestionMadang> list=dao.selectMadangList(conn, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public List<QuestionMadang> selectMadangList(String choiceSub, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<QuestionMadang> list=dao.selectMadangList(conn, choiceSub, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public QuestionMadang selectMadang(int no, boolean hasRead) {
		Connection conn=getConnection();
		QuestionMadang qm=dao.selectMadang(conn, no);
		if(!hasRead && qm!=null) {
			int result=dao.updateReadCount(conn,no);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return qm;
	}
	
	public Map<String, QuestionMadang> selectPreNext(int madangNo) {
		Connection conn=getConnection();
		Map<String, QuestionMadang> preNext=dao.selectPreNext(conn, madangNo);
		close(conn);
		return preNext;
	}
	
	public int insertMadang(QuestionMadang qm) {
		Connection conn=getConnection();
		int result=dao.insertMadang(conn, qm);
		int madangNo=-1;
		if(result>0) {
			commit(conn);
			madangNo=dao.selectSeqCurrval(conn);
		}
		else rollback(conn);
		close(conn);
		return madangNo;
	}
	
	public int updateMadang(QuestionMadang qm) {
		Connection conn=getConnection();
		int check=dao.checkWriter(conn, qm);
		if(qm.getMadangWriterUid()==10000) check=1; //관리자 예외
		int result=-1;
		if(check>0) {
			result=dao.updateMadang(conn, qm);
			if(result>0) {
				commit(conn);
			} rollback(conn);
		} 
		close(conn);
		return result;
	}
	
	public int deleteMadang(QuestionMadang qm) {
		Connection conn=getConnection();
		int check=dao.checkWriter(conn, qm);
		if(qm.getMadangWriterUid()==10000) check=1; //관리자 예외
		int result=-1;
		if(check>0) {
			result=dao.deleteMadang(conn, qm);
			if(result>0) {
				commit(conn);
			} rollback(conn);
		} 
		close(conn);
		return result;
	}
	
	public int insertFile(QuestionMadangFile qmf) {
		Connection conn=getConnection();
		int result=dao.insertFile(conn, qmf);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateMadangRepCount(int madangNo) {
		Connection conn=getConnection();
		int result=dao.updateMadangRepCount(conn, madangNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
