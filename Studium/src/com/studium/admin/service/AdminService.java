package com.studium.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import com.studium.admin.model.dao.AdminDao;
import com.studium.admin.model.vo.QandA;

public class AdminService {

	
	private AdminDao dao = new AdminDao();
	
	public int insertQandA(String content, String email) {
		
		Connection conn=getConnection();
		int result=dao.insertQandA(conn,content, email);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;	
		
	}
	
	public int selectCountQandA() {
		Connection conn=getConnection();
		int result=dao.selectCountQandA(conn);
		close(conn);
		return result;
	}
	
	public List<QandA> selectQandAList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<QandA> list=dao.selectQandAList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
}
