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
import java.util.Properties;

import com.studium.member.model.dao.MemberDao;
import com.studium.mypage.model.vo.MyCalendar;
import com.studium.mypage.model.vo.MyDibs;

public class MyDibsDao {
	
	
	private Properties prop=new Properties();

	public MyDibsDao() {
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
	public MyDibs selectDibs(Connection conn,int mNo,int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectDibs");
		MyDibs m =new MyDibs();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			m.setDibsId(rs.getInt("dibs_id"));
			m.setMemberNo(rs.getInt("mem_no"));
			m.setpNo(rs.getInt("p_no"));
			m.setfNo(rs.getInt("f_no"));
			m.setScrDateTime(rs.getDate("scr_datetime"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
		
	}
	public MyDibs selectFstudyDibs(Connection conn,int mNo,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectFstudyDibs");
		MyDibs m =new MyDibs();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			m.setDibsId(rs.getInt("dibs_id"));
			m.setMemberNo(rs.getInt("mem_no"));
			m.setpNo(rs.getInt("p_no"));
			m.setfNo(rs.getInt("f_no"));
			m.setScrDateTime(rs.getDate("scr_datetime"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	public int insertCalendar(Connection conn,MyCalendar m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertCalendar");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, m.getMemNo());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getEditTitle());
			pstmt.setString(4, m.getEditStart());
			pstmt.setString(5, m.getEditEnd());
			pstmt.setString(6, m.getEditcolor());
			pstmt.setString(7, m.getEditdesc());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	

}
