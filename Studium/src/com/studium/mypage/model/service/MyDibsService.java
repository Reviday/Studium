package com.studium.mypage.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.mypage.model.dao.MyDibsDao;
import com.studium.mypage.model.vo.MyCalendar;
import com.studium.mypage.model.vo.MyDibs;


public class MyDibsService {
	private MyDibsDao dao=new MyDibsDao();

	public MyDibs selectDibs(int mNo,int no){
		Connection conn=getConnection();
		MyDibs mydibs =dao.selectDibs(conn,mNo,no);
		close(conn);
		return mydibs;
	}
	public MyDibs selectFstudyDibs(int mNo,int no) {
		Connection conn=getConnection();
		MyDibs mydibs=dao.selectFstudyDibs(conn,mNo,no);
		close(conn);
		return mydibs;
	}
	public int insertCalendar(MyCalendar m) {
		Connection conn=getConnection();
		int result=dao.insertCalendar(conn,m);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public List<MyCalendar> selectCalendar(int memberNo){
		Connection conn=getConnection();
		List<MyCalendar> list=dao.selectCalendar(conn,memberNo);
		close(conn);
		return list;
	}

}
