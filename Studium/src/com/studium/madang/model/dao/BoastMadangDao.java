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

import com.studium.madang.model.vo.BoastMadang;
import com.studium.member.model.service.MemberService;

public class BoastMadangDao {

	private Properties prop=new Properties();
	
	public BoastMadangDao() {
		String path=BoastMadangDao.class.getResource("/sql/madang/boastmadang-query.properties").getPath();
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
	
	public List<BoastMadang> selectMadangList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoastMadang> list=new ArrayList<BoastMadang>();
		String sql=prop.getProperty("selectMadangList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoastMadang bm=new BoastMadang();
				bm.setMadangNo(rs.getInt("madang_no"));
				bm.setMadangParent(rs.getInt("madang_parent"));
				bm.setMadangOrder(rs.getInt("madang_order"));
				bm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				bm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				bm.setMadangWriterName(rs.getString("madang_writer_name"));
				bm.setMadangTitle(rs.getString("madang_title"));
				bm.setMadangContent(rs.getString("madang_content"));
				bm.setMadangMainCategory(rs.getString("madang_main_category"));
				bm.setMadangCategory(rs.getString("madang_category"));
				bm.setMadangSubCategory(rs.getString("madang_sub_category"));
				bm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				bm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				bm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				bm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				bm.setMadangRecCount(rs.getInt("madang_rec_count"));
				bm.setMadangRepCount(rs.getInt("madang_rep_count"));
				bm.setMadangReadCount(rs.getInt("madang_read_count"));
				bm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				bm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				list.add(bm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public List<BoastMadang> selectMadangList(Connection conn, String choiceSub, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoastMadang> list=new ArrayList<BoastMadang>();
		String sql=prop.getProperty("selectMadangListC");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, choiceSub);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoastMadang bm=new BoastMadang();
				bm.setMadangNo(rs.getInt("madang_no"));
				bm.setMadangParent(rs.getInt("madang_parent"));
				bm.setMadangOrder(rs.getInt("madang_order"));
				bm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				bm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				bm.setMadangWriterName(rs.getString("madang_writer_name"));
				bm.setMadangTitle(rs.getString("madang_title"));
				bm.setMadangContent(rs.getString("madang_content"));
				bm.setMadangMainCategory(rs.getString("madang_main_category"));
				bm.setMadangCategory(rs.getString("madang_category"));
				bm.setMadangSubCategory(rs.getString("madang_sub_category"));
				bm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				bm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				bm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				bm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				bm.setMadangRecCount(rs.getInt("madang_rec_count"));
				bm.setMadangRepCount(rs.getInt("madang_rep_count"));
				bm.setMadangReadCount(rs.getInt("madang_read_count"));
				bm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				bm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				list.add(bm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public BoastMadang selectMadang(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoastMadang bm=null;
		String sql=prop.getProperty("selectMadang");
		MemberService service= new MemberService();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bm=new BoastMadang();
				bm.setMadangNo(rs.getInt("madang_no"));
				bm.setMadangParent(rs.getInt("madang_parent"));
				bm.setMadangOrder(rs.getInt("madang_order"));
				bm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				bm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				bm.setMadangWriterName(rs.getString("madang_writer_name"));
				bm.setMadangTitle(rs.getString("madang_title"));
				bm.setMadangContent(rs.getString("madang_content"));
				bm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				bm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				bm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				bm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				bm.setMadangRecCount(rs.getInt("madang_rec_count"));
				bm.setMadangRepCount(rs.getInt("madang_rep_count"));
				bm.setMadangReadCount(rs.getInt("madang_read_count"));
				bm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				bm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				bm.setProfilePath(service.selectNo(bm.getMadangWriterUid()).getMemPhoto());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return bm;
	}
	
	public Map<String, BoastMadang> selectPreNext(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map<String, BoastMadang> preNext=new HashMap<String, BoastMadang>();
		String sql=prop.getProperty("selectPreNext");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				BoastMadang prev=new BoastMadang();
				prev.setMadangNo(rs.getInt("prev"));
				prev.setMadangTitle(rs.getString("prev_title"));
				preNext.put("prev", prev);
				BoastMadang next=new BoastMadang();
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
	
	public int insertMadang(Connection conn, BoastMadang bm) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertMadang");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bm.getMadangWriterUid());
			pstmt.setString(2, bm.getMadangWriterEmail());
			pstmt.setString(3, bm.getMadangWriterName());
			pstmt.setString(4, bm.getMadangTitle());
			pstmt.setString(5, bm.getMadangContent());
			pstmt.setString(6, bm.getMadangRegisterIp());
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
}
