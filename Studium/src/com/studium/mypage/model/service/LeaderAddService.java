package com.studium.mypage.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.studium.mypage.model.dao.LeaderAddDao;
import com.studium.mypage.model.vo.LeaderAdd;
import com.studium.mypage.model.vo.MyDibs;


public class LeaderAddService {
	private LeaderAddDao dao=new LeaderAddDao();

	public int addLeader(LeaderAdd l){
		Connection conn=getConnection();
		int result =dao.addLeader(conn,l);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	
	}


}
