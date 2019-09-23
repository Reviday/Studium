package com.studium.mypage.model.dao;
import static common.template.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.studium.member.model.dao.MemberDao;
import com.studium.mypage.model.vo.LeaderAdd;
import com.studium.mypage.model.vo.MyCalendar;
import com.studium.mypage.model.vo.MyDibs;

public class LeaderAddDao {
	
	
	private Properties prop=new Properties();

	public LeaderAddDao() {
		String path=MemberDao.class.getResource("/sql/mydibs/mydibs-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int addLeader(Connection conn,LeaderAdd l) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("addLeader");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, l.getlName());
			pstmt.setString(2, l.getlGender());
			pstmt.setString(3, l.getlEmail());
			pstmt.setString(4, l.getlPhone());
			pstmt.setString(5, l.getlType());
			pstmt.setString(6, l.getlArea());
			pstmt.setString(7, l.getlCategory1());
			pstmt.setString(8, l.getlCategory2());
			pstmt.setString(9, l.getlCategory3());
			pstmt.setString(10, l.getlMessage());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	

}
