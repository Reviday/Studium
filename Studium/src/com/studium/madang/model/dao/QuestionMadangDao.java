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

import com.studium.madang.model.vo.QuestionMadang;
import com.studium.madang.model.vo.QuestionMadangFile;
import com.studium.member.model.service.MemberService;

public class QuestionMadangDao {
private Properties prop=new Properties();
	
	public QuestionMadangDao() {
		String path=QuestionMadangDao.class.getResource("/sql/madang/questionmadang-query.properties").getPath();
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
	
	public int selectCountList(Connection conn, String choiceSub) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountListC");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, choiceSub);
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
	
	public List<QuestionMadang> selectMadangList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QuestionMadang> list=new ArrayList<QuestionMadang>();
		String sql=prop.getProperty("selectMadangList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QuestionMadang qm=new QuestionMadang();
				qm.setMadangNo(rs.getInt("madang_no"));
				qm.setMadangParent(rs.getInt("madang_parent"));
				qm.setMadangOrder(rs.getInt("madang_order"));
				qm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				qm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				qm.setMadangWriterName(rs.getString("madang_writer_name"));
				qm.setMadangTitle(rs.getString("madang_title"));
				qm.setMadangContent(rs.getString("madang_content"));
				qm.setMadangMainCategory(rs.getString("madang_main_category"));
				qm.setMadangCategory(rs.getString("madang_category"));
				qm.setMadangSubCategory(rs.getString("madang_sub_category"));
				qm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				qm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				qm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				qm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				qm.setMadangRecCount(rs.getInt("madang_rec_count"));
				qm.setMadangRepCount(rs.getInt("madang_rep_count"));
				qm.setMadangReadCount(rs.getInt("madang_read_count"));
				qm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				qm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				list.add(qm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public List<QuestionMadang> selectMadangList(Connection conn, String choiceSub, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QuestionMadang> list=new ArrayList<QuestionMadang>();
		String sql=prop.getProperty("selectMadangListC");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, choiceSub);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QuestionMadang qm=new QuestionMadang();
				qm.setMadangNo(rs.getInt("madang_no"));
				qm.setMadangParent(rs.getInt("madang_parent"));
				qm.setMadangOrder(rs.getInt("madang_order"));
				qm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				qm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				qm.setMadangWriterName(rs.getString("madang_writer_name"));
				qm.setMadangTitle(rs.getString("madang_title"));
				qm.setMadangContent(rs.getString("madang_content"));
				qm.setMadangMainCategory(rs.getString("madang_main_category"));
				qm.setMadangCategory(rs.getString("madang_category"));
				qm.setMadangSubCategory(rs.getString("madang_sub_category"));
				qm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				qm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				qm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				qm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				qm.setMadangRecCount(rs.getInt("madang_rec_count"));
				qm.setMadangRepCount(rs.getInt("madang_rep_count"));
				qm.setMadangReadCount(rs.getInt("madang_read_count"));
				qm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				qm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				list.add(qm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public QuestionMadang selectMadang(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		QuestionMadang qm=null;
		String sql=prop.getProperty("selectMadang");
		MemberService service= new MemberService();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qm=new QuestionMadang();
				qm.setMadangNo(rs.getInt("madang_no"));
				qm.setMadangParent(rs.getInt("madang_parent"));
				qm.setMadangOrder(rs.getInt("madang_order"));
				qm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				qm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				qm.setMadangWriterName(rs.getString("madang_writer_name"));
				qm.setMadangTitle(rs.getString("madang_title"));
				qm.setMadangContent(rs.getString("madang_content"));
				qm.setMadangMainCategory(rs.getString("madang_main_category"));
				qm.setMadangCategory(rs.getString("madang_category"));
				qm.setMadangSubCategory(rs.getString("madang_sub_category"));
				qm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				qm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				qm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				qm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				qm.setMadangRecCount(rs.getInt("madang_rec_count"));
				qm.setMadangRepCount(rs.getInt("madang_rep_count"));
				qm.setMadangReadCount(rs.getInt("madang_read_count"));
				qm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				qm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				qm.setProfilePath(service.selectNo(qm.getMadangWriterUid()).getMemPhoto());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return qm;
	}
	
	public Map<String, QuestionMadang> selectPreNext(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map<String, QuestionMadang> preNext=new HashMap<String, QuestionMadang>();
		String sql=prop.getProperty("selectPreNext");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				QuestionMadang prev=new QuestionMadang();
				prev.setMadangNo(rs.getInt("prev"));
				prev.setMadangTitle(rs.getString("prev_title"));
				preNext.put("prev", prev);
				QuestionMadang next=new QuestionMadang();
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
	
	public int insertMadang(Connection conn, QuestionMadang qm) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertMadang");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qm.getMadangWriterUid());
			pstmt.setString(2, qm.getMadangWriterEmail());
			pstmt.setString(3, qm.getMadangWriterName());
			pstmt.setString(4, qm.getMadangTitle());
			pstmt.setString(5, qm.getMadangContent());
			pstmt.setString(6, qm.getMadangMainCategory());
			pstmt.setString(7, qm.getMadangCategory());
			pstmt.setString(8, qm.getMadangSubCategory());
			pstmt.setString(9, qm.getMadangRegisterIp());
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
			close(pstmt);
		} return result;
	}
	
	public int checkWriter(Connection conn, QuestionMadang qm) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("checkWriter");
			
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qm.getMadangNo());
			pstmt.setInt(2, qm.getMadangWriterUid());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int updateMadang(Connection conn, QuestionMadang qm) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateMadang");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, qm.getMadangTitle());
			pstmt.setString(2, qm.getMadangContent());
			pstmt.setString(3, qm.getMadangUpdatedIp());
			pstmt.setString(4, String.valueOf(qm.getMadangFilePresence()));
			pstmt.setString(5, String.valueOf(qm.getMadangImgPresence()));
			pstmt.setInt(6, qm.getMadangNo());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int deleteMadang(Connection conn, QuestionMadang qm) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteMadang");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qm.getMadangNo());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int insertFile(Connection conn, QuestionMadangFile qmf) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertFile");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qmf.getMadangNo());
			pstmt.setInt(2, qmf.getMemberNo());
			pstmt.setString(3, qmf.getQmfOriginalFilename());
			pstmt.setString(4, qmf.getQmfRenameFilename());
			pstmt.setLong(5, qmf.getQmfFilesize());
			pstmt.setString(6, qmf.getQmfType());
			pstmt.setString(7, qmf.getQmfIp());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int updateMadangRepCount(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateMadangRepCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			pstmt.setInt(2, madangNo);
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
}
