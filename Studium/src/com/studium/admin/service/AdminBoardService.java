package com.studium.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.admin.model.dao.AdminBoardDao;
import com.studium.admin.model.vo.FAQ;
import com.studium.story.model.vo.Story;

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
	
	public int updateFAQ(String no, String type, String title, String content) {
		Connection conn = getConnection();
		int result = dao.updateFAQ(conn, no, type, title, content);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public int deleteFAQ(String faqNo) {
		Connection conn = getConnection();
		int result = dao.deleteFAQ(conn, faqNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public List<FAQ> showFAQList(){
		Connection conn = getConnection();
		List<FAQ> list=dao.showFAQList(conn);
		close(conn);
		return list;
	}
	
	public int selectCountStory() {
		Connection conn=getConnection();
		int result=dao.selectCountStory(conn);
		close(conn);
		return result;
	}
	
	public List<Story> selectStoryList(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Story> list=dao.selectStoryList(conn, cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectCountStorySearch(String pName) {
		Connection conn=getConnection();
		int result=dao.selectCountStorySearch(conn, pName);
		close(conn);
		return result;
	}
	
	public List<Story> selectStorySearchList(int cPage, int numPerPage, String pName){
		Connection conn = getConnection();
		List<Story> list=dao.selectStorySearchList(conn, cPage,numPerPage, pName);
		close(conn);
		return list;
	}
	
	public int deleteStory(String storyNo) {
		Connection conn = getConnection();
		int result = dao.deleteStory(conn, storyNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
}
