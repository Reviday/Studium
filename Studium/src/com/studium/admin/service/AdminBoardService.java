package com.studium.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.admin.model.dao.AdminBoardDao;
import com.studium.admin.model.vo.FAQ;

public class AdminBoardService {

	AdminBoardDao dao = new AdminBoardDao();
	
	public int selectCountFAQ() {
		Connection conn=getConnection();
		int result=dao.selectCountFAQ(conn);
		close(conn);
		return result;
	}
	
	public List<FAQ> selectFAQList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<FAQ> list=dao.selectFAQList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int insertQnA(String type, String title, String content) {
		Connection conn = getConnection();
		int result = dao.insertQnA(conn, type, title, content);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public FAQ selectFAQdeleteupdateList(String faqNo) {
		Connection conn=getConnection();
		FAQ faq=dao.selectFAQdeleteupdateList(conn, faqNo);
		close(conn);
		return faq;
	}
	
}
