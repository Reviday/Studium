package com.studium.madang.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.studium.madang.model.vo.StudyMadang;
import com.studium.madang.model.vo.StudyMadangQuestion;
import com.studium.member.model.service.MemberService;

public class StudyMadangDao {

	private Properties prop=new Properties();
	
	public StudyMadangDao() {
		String path=StudyMadangDao.class.getResource("/sql/madang/studymadang-query.properties").getPath();
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
	
	public int selectCountList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return result;
	}
	
	public List<StudyMadang> selectMadangList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<StudyMadang> list=new ArrayList<StudyMadang>();
		String sql=prop.getProperty("selectMadangList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				StudyMadang sm=new StudyMadang();
				sm.setMadangNo(rs.getInt("madang_no"));
				sm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				sm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				sm.setMadangWriterName(rs.getString("madang_writer_name"));
				sm.setMadangTitle(rs.getString("madang_title"));
				sm.setMadangLevel(rs.getInt("madang_level"));
				sm.setMadangContent(rs.getString("madang_content"));
				sm.setMadangMainCategory(rs.getString("madang_main_category"));
				sm.setMadangCategory(rs.getString("madang_category"));
				sm.setMadangSubCategory(rs.getString("madang_sub_category"));
				sm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				sm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				sm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				sm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				sm.setMadangRecCount(rs.getInt("madang_rec_count"));
				sm.setMadangRepCount(rs.getInt("madang_rep_count"));
				sm.setMadangReadCount(rs.getInt("madang_read_count"));
				sm.setMadangForkCount(rs.getInt("madang_fork_count"));
				sm.setMadangAnswerCount(rs.getInt("madang_answer_count"));
				list.add(sm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public StudyMadang selectMadang(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StudyMadang sm=null;
		String sql=prop.getProperty("selectMadang");
		MemberService service= new MemberService();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sm=new StudyMadang();
				sm.setMadangNo(rs.getInt("madang_no"));
				sm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				sm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				sm.setMadangWriterName(rs.getString("madang_writer_name"));
				sm.setMadangTitle(rs.getString("madang_title"));
				sm.setMadangLevel(rs.getInt("madang_level"));
				sm.setMadangContent(rs.getString("madang_content"));
				sm.setMadangMainCategory(rs.getString("madang_main_category"));
				sm.setMadangCategory(rs.getString("madang_category"));
				sm.setMadangSubCategory(rs.getString("madang_sub_category"));
				sm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				sm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				sm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				sm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				sm.setMadangRecCount(rs.getInt("madang_rec_count"));
				sm.setMadangRepCount(rs.getInt("madang_rep_count"));
				sm.setMadangReadCount(rs.getInt("madang_read_count"));
				sm.setMadangForkCount(rs.getInt("madang_fork_count"));
				sm.setMadangAnswerCount(rs.getInt("madang_answer_count"));
				sm.setProfilePath(service.selectNo(sm.getMadangWriterUid()).getMemPhoto());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return sm;
	}
	
	public Map<String, StudyMadang> selectPreNext(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map<String, StudyMadang> preNext=new HashMap<String, StudyMadang>();
		String sql=prop.getProperty("selectPreNext");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				StudyMadang prev=new StudyMadang();
				prev.setMadangNo(rs.getInt("prev"));
				prev.setMadangTitle(rs.getString("prev_title"));
				preNext.put("prev", prev);
				StudyMadang next=new StudyMadang();
				next.setMadangNo(rs.getInt("next"));
				next.setMadangTitle(rs.getString("next_title"));
				preNext.put("next", next);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return preNext;
	}
	
	public int updateReadCount(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateReadCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int insertMadang(Connection conn, StudyMadang sm) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertMadang");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sm.getMadangWriterUid());
			pstmt.setString(2, sm.getMadangWriterEmail());
			pstmt.setString(3, sm.getMadangWriterName());
			pstmt.setString(4, sm.getMadangTitle());
			pstmt.setString(5, sm.getMadangContent());
			pstmt.setString(6, sm.getMadangRegisterIp());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int selectSeqCurrval(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectSeqCurrval");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return result;
	}
	
	public int checkLike(Connection conn, int madangNo, int memNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("checkLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			pstmt.setInt(2, memNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return result;
	}
	
	public int insertLike(Connection conn, int madangNo, int memNo, String REMOTE_ADDR) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLike");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			pstmt.setInt(2, memNo);
			pstmt.setString(3, REMOTE_ADDR);
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int updateMadangAnswerCount(Connection conn, StudyMadangQuestion smq) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateMadangAnswerCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, smq.getMadangNo());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int insertQuestion(Connection conn, StudyMadangQuestion smq) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertQuestion");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, smq.getMadangNo());
			pstmt.setInt(2, smq.getQuestionWriterUid());
			pstmt.setString(3, smq.getQuestionWriterEmail());
			pstmt.setString(4, smq.getQuestionWriterName());
			pstmt.setString(5, smq.getQuestionContent());
			pstmt.setString(6, smq.getQuestionMainCategory());
			pstmt.setString(7, smq.getQuestionCategory());
			pstmt.setString(8, smq.getQuestionSubCategory());
			pstmt.setString(9, smq.getQuestionRegisterIp());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
}
