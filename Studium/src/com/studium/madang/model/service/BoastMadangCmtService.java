package com.studium.madang.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.madang.model.dao.BoastMadangCmtDao;
import com.studium.madang.model.vo.BoastMadangCmt;

public class BoastMadangCmtService {
	
	private BoastMadangCmtDao dao=new BoastMadangCmtDao();
	
	public int selectCountList(int madangNo) {
		Connection conn=getConnection();
		int result=dao.selectCountList(conn, madangNo);
		close(conn);
		return result;
	}
	
	public List<BoastMadangCmt> selectCmtList(int madangNo, int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<BoastMadangCmt> list=dao.selectCmtList(conn, madangNo, cPage, numPerPage);
		close(conn);
		return list;
	}
	
	public int insertComment(BoastMadangCmt cmt) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, cmt);
		if(result>0) {
			commit(conn);
			new BoastMadangService().updateMadangRepCount(cmt.getCmtMadangNo());
		}
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertReply(BoastMadangCmt cmt) {
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
					new BoastMadangService().updateMadangRepCount(cmt.getCmtMadangNo());
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
}
