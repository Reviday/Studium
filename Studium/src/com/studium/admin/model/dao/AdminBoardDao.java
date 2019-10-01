package com.studium.admin.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.studium.admin.model.vo.FAQ;
import com.studium.story.model.vo.Story;

public class AdminBoardDao {

	private Properties prop=new Properties();

	public AdminBoardDao() {
		String path=AdminBoardDao.class.getResource("/sql/admin/admin-board.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int selectCountFAQ(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountFAQ");
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

	public List<FAQ> selectFAQList(Connection conn,int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<FAQ> list=new ArrayList();
		String sql=prop.getProperty("selectFAQList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FAQ f=new FAQ();
				f.setFaqNO(rs.getInt("faq_no"));
				f.setFaqType(rs.getString("faq_type"));
				f.setFaqTitle(rs.getString("faq_title"));
				f.setFaqContent(rs.getString("faq_content"));
				list.add(f);				
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	public int insertQnA(Connection conn, String type, String title, String content) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertQnA");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	public FAQ selectFAQdeleteupdateList(Connection conn, String faqNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		FAQ faq = new FAQ();
		String sql=prop.getProperty("selectFAQdeleteupdateList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, faqNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
	
				faq.setFaqNO(rs.getInt("faq_no"));
				faq.setFaqType(rs.getString("faq_type"));
				faq.setFaqTitle(rs.getString("faq_title"));
				faq.setFaqContent(rs.getString("faq_content"));
								
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return faq;
	}
	
	public int updateFAQ(Connection conn, String no, String type, String title, String content) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateFAQ");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	public int deleteFAQ(Connection conn, String faqNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteFAQ");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, faqNo);

			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	public List<FAQ> showFAQList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<FAQ> list=new ArrayList();
		String sql=prop.getProperty("showFAQList");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FAQ f=new FAQ();
				f.setFaqNO(rs.getInt("faq_no"));
				f.setFaqType(rs.getString("faq_type"));
				f.setFaqTitle(rs.getString("faq_title"));
				String content = rs.getString("faq_content");
				content = content.replaceAll("\n", "<br/>");
				f.setFaqContent(content);
				list.add(f);				
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectCountStory(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountStory");
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
	
	public List<Story> selectStoryList(Connection conn, int cPage, int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Story> list=new ArrayList();
		String sql=prop.getProperty("selectStoryList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));
				s.setMemNo(rs.getInt("mem_no"));
				s.setpNo(rs.getInt("p_no"));
				list.add(s);		
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectCountStorySearch(Connection conn, String pName) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountStorySearch") + pName + "%'";
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
	
	public List<Story> selectStorySearchList(Connection conn, int cPage, int numPerPage, String pName){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Story> list=new ArrayList();
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM TA_STORY WHERE STORY_TEACHER_NAME LIKE '%" + pName + 
				   "%' ORDER BY STORY_NO DESC)A) WHERE RNUM BETWEEN " + ((cPage-1)*numPerPage+1) + " AND " + (cPage*numPerPage);
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));
				s.setMemNo(rs.getInt("mem_no"));
				s.setpNo(rs.getInt("p_no"));
				list.add(s);		
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int deleteStory(Connection conn, String storyNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteStory");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, storyNo);

			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	public String storyMemo(Connection conn, String storyNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String storyMemo = "";
		String sql=prop.getProperty("storyMemo");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, storyNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				storyMemo=rs.getString(1);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return storyMemo;
	}

}
