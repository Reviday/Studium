package com.studium.index.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.studium.madang.model.dao.BoastMadangDao;
import com.studium.story.model.vo.Story;

public class IndexDao {
private Properties prop=new Properties();
	
	public IndexDao() {
		String path=BoastMadangDao.class.getResource("/sql/story/story-query.properties").getPath();
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
	public List<Story> selectReview(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectReview");
		List<Story> list = new ArrayList<Story>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Story s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("mem_no"));
				s.setpNo(rs.getInt("p_no"));
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
