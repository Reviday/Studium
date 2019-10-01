package com.studium.story.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.studium.story.model.vo.Story;

public class StoryDao {
	private Properties prop = new Properties();

	public StoryDao() {
		String path = StoryDao.class.getResource("/sql/story/story-query.properties").getPath();

		try {
			prop.load(new FileReader(path));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Story selectStory(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Story s = null;
		String sql = prop.getProperty("selectStroy");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));


			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return s;

	}

	public List<Story> selectStoryList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectStoryList");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));
				list.add(s);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReadCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Story> selectForeignlanguageList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectForeignlanguageList");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));



				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Story> selectProgrammingList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectProgrammingList");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));


				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Story> selectPublicofficerList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectPublicofficerList");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));



				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Story> selectCertificateList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectCertificateList");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));


				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<Story> selectEmploymentList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectEmploymentList");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int selectTotalnumberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectTotalnumberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectForeignlanguagenumberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectForeignlanguagenumberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectProgrammingnumberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectProgrammingnumberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectPublicofficernumberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectPublicofficernumberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectCertificatenumberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectCertificatenumberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectEmploymentnumberList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("selectEmploymentnumberList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public List<Story> selectPstudyStory(Connection conn,int no){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectPstudyStory");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setpTitle(rs.getString("P_TITLE"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));	
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStorySubject(rs.getString("STORY_SUBJECT"));
				s.setStoryStar(rs.getInt("STORY_STAR"));

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
