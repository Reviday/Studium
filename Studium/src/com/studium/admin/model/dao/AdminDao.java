package com.studium.admin.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import com.studium.admin.model.vo.QandA;

public class AdminDao {
	
	private Properties prop=new Properties();
	
	public AdminDao() {
		String path=AdminDao.class.getResource("/sql/admin/admin-QandA.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertQandA(Connection conn, String content, String email) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertQandA");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, content);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectCountQandA(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountQandA");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<QandA> selectQandAList(Connection conn,int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QandA> list=new ArrayList();
		String sql=prop.getProperty("selectQandAList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QandA q=new QandA();
				q.setcNo(rs.getInt("no"));
				q.setEmail(rs.getString("email"));
				if(rs.getString("content").length() < 20) {
					q.setContent(rs.getString("content"));
				}else {
					q.setContent(rs.getString("content").substring(0, 17)+"...");					
				}
				q.setFullContent(rs.getString("content"));
				q.setEnrollDate(rs.getDate("enroll_date"));
				
				
				Date today = new Date();
				long calDate = today.getTime() - rs.getDate("enroll_date").getTime();
				long calDateDays = calDate / (24*60*60*1000); 
				calDateDays = Math.abs(calDateDays);
				if(calDateDays == 0) {
					q.setPastDate("오늘");
				}else {
					q.setPastDate(calDateDays+"일 전");
				}
				
				
				list.add(q);				
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int deleteQnAList(Connection conn, String[] deList) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteQandAList");
		for(String s : deList) {
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, s);				
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		}
		return result;
	}
	
}
