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
			pstmt.setDate(4, (Date) m.getEditStart());
			pstmt.setDate(5, (Date) m.getEditEnd());
			pstmt.setString(6, m.getEditcolor());
			pstmt.setString(7, m.getEditdesc());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<MyCalendar> selectCalendar(Connection conn,int memberNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MyCalendar> list = new ArrayList();
		String sql=prop.getProperty("selectCalendar");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MyCalendar m=new MyCalendar();
				m.setEditNo(rs.getInt("edit_no"));
				m.setMemNo(rs.getInt("mem_no"));
				m.setMemberName(rs.getString("mem_name"));
				m.setEditTitle(rs.getString("edit_title"));
				m.setEditStart(rs.getDate("edit_start"));
				m.setEditEnd(rs.getDate("edit_end"));
				m.setEditcolor(rs.getString("edit_color"));
				m.setEditdesc(rs.getString("edit_desc"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<MyDibs> selectMyDibs(Connection conn, int memberNo,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectmyDibs");
		List<MyDibs> list= new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MyDibs m =new MyDibs();
				m.setDibsId(rs.getInt("dibs_id"));
				m.setMemberNo(rs.getInt("mem_no"));
				m.setpNo(rs.getInt("p_no"));
				m.setfNo(rs.getInt("f_no"));
				m.setScrDateTime(rs.getDate("scr_datetime"));
				list.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}return list;
		
	}
	public int selectCountDibs(Connection conn,int memberNo) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result=0;
		String sql =prop.getProperty("selectCountDibs");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}

}
