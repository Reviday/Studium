package com.studium.mypage.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.studium.mypage.model.dao.MyDibsDao;
import com.studium.mypage.model.vo.MyDibs;


public class MyDibsService {
	private MyDibsDao dao=new MyDibsDao();
	
	public MyDibs selectDibs(int mNo,int pNo){
		Connection conn=getConnection();
		MyDibs mydibs =dao.selectDibs(conn,mNo,pNo);
		close(conn);
		return mydibs;
	}

}
