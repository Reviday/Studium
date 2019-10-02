package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.madang.model.dao.QuestionMadangCmtDao;
import com.studium.madang.model.vo.QuestionMadangCmt;

public class QuestionMadangCmtService {

	private QuestionMadangCmtDao dao=new QuestionMadangCmtDao();
	
	public int selectCountList(int madangNo) {
		Connection conn=getConnection();
		int result=dao.selectCountList(conn, madangNo);
		close(conn);
		return result;
	}
	
	public List<QuestionMadangCmt> selectCmtList(int madangNo, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<QuestionMadangCmt> list=dao.selectCmtList(conn, madangNo, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int insertComment(QuestionMadangCmt cmt) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, cmt);
		if(result>0) {
			commit(conn);
			new QuestionMadangService().updateMadangRepCount(cmt.getCmtMadangNo());
		}
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertReply(QuestionMadangCmt cmt) {
		Connection conn=getConnection();
		int insertResult=-1;
		int updateResult=-1;
		int updateCmtReply=-1;
		System.out.println(cmt);
		updateResult=dao.updateReplySort(conn, cmt);
		if(updateResult>=0) {
			insertResult=dao.insertReply(conn, cmt);
			if(insertResult>0) {
				updateCmtReply=dao.updateCmtReply(conn, cmt);
				if(updateCmtReply>=0) {
					commit(conn);
					new QuestionMadangService().updateMadangRepCount(cmt.getCmtMadangNo());
				}
				else rollback(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		close(conn);
		return insertResult;
	}	
	
	public int updateComment(QuestionMadangCmt cmt) {
		Connection conn=getConnection();
		int result=dao.updateComment(conn, cmt);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteComment(QuestionMadangCmt cmt) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn, cmt);
		if(result>0) {
			dao.autoDeleteReply(conn, cmt);
			commit(conn);
			new QuestionMadangService().updateMadangRepCount(cmt.getCmtMadangNo());
		}
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateReply(QuestionMadangCmt cmt) {
		Connection conn=getConnection();
		int result=dao.updateReply(conn, cmt);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteReply(QuestionMadangCmt cmt) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn, cmt);
		if(result>0) {
			dao.updateReplySortOnDelete(conn, cmt);
			dao.checkForReply(conn, cmt);
			commit(conn);
			new QuestionMadangService().updateMadangRepCount(cmt.getCmtMadangNo());
		}
		else rollback(conn);
		close(conn);
		return result;
	}
}
