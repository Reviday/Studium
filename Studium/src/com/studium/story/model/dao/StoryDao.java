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
	private Properties prop=new Properties();
	
	public StoryDao() {
		String path=StoryDao.class.getResource("/sql/story/story-query.properties").getPath();
		
		try {
			prop.load(new FileReader(path));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	
	public Story selectStory(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Story s=null;
		String sql=prop.getProperty("selectStroy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				s=new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDNET_PICTURE"));
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getString("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTURE"));
			
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return s;
		
	}

	public List<Story> selectStoryList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectStoryList");
		List<Story> list=new ArrayList<Story>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Story s=new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDNET_PICTURE"));
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getString("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTURE"));
				
				list.add(s);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateReadCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
