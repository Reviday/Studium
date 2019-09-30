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

import com.studium.madang.model.vo.ShareMadang;
import com.studium.member.model.service.MemberService;

public class ShareMadangDao {

	private Properties prop=new Properties();
	
	public ShareMadangDao() {
		String path=ShareMadangDao.class.getResource("/sql/madang/sharemadang-query.properties").getPath();
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
	
	public int selectCountList(Connection conn,String choiceSub) {
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
	
	public List<ShareMadang> selectMadangList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ShareMadang> list=new ArrayList<ShareMadang>();
		String sql=prop.getProperty("selectMadangList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ShareMadang sm=new ShareMadang();
				sm.setMadangNo(rs.getInt("madang_no"));
				sm.setMadangParent(rs.getInt("madang_parent"));
				sm.setMadangOrder(rs.getInt("madang_order"));
				sm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				sm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				sm.setMadangWriterName(rs.getString("madang_writer_name"));
				sm.setMadangTitle(rs.getString("madang_title"));
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
				sm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				sm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				list.add(sm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public List<ShareMadang> selectMadangList(Connection conn, String mCategory, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ShareMadang> list=new ArrayList<ShareMadang>();
		String sql=prop.getProperty("selectMadangListC");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mCategory);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ShareMadang sm=new ShareMadang();
				sm.setMadangNo(rs.getInt("madang_no"));
				sm.setMadangParent(rs.getInt("madang_parent"));
				sm.setMadangOrder(rs.getInt("madang_order"));
				sm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				sm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				sm.setMadangWriterName(rs.getString("madang_writer_name"));
				sm.setMadangTitle(rs.getString("madang_title"));
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
				sm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				sm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				list.add(sm);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	public ShareMadang selectMadang(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ShareMadang sm=null;
		String sql=prop.getProperty("selectMadang");
		MemberService service= new MemberService();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sm=new ShareMadang();
				sm.setMadangNo(rs.getInt("madang_no"));
				sm.setMadangParent(rs.getInt("madang_parent"));
				sm.setMadangOrder(rs.getInt("madang_order"));
				sm.setMadangWriterUid(rs.getInt("madang_writer_uid"));
				sm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				sm.setMadangWriterName(rs.getString("madang_writer_name"));
				sm.setMadangTitle(rs.getString("madang_title"));
				sm.setMadangContent(rs.getString("madang_content"));
				sm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				sm.setMadangRegisterIp(rs.getString("madang_register_ip"));
				sm.setMadangUpdatedDatetime(rs.getTimestamp("madang_updated_datetime"));
				sm.setMadangUpdatedIp(rs.getString("madang_updated_ip"));
				sm.setMadangRecCount(rs.getInt("madang_rec_count"));
				sm.setMadangRepCount(rs.getInt("madang_rep_count"));
				sm.setMadangReadCount(rs.getInt("madang_read_count"));
				sm.setMadangForkCount(rs.getInt("madang_fork_count"));
				sm.setMadangFilePresence(rs.getString("madang_file_presence").charAt(0));
				sm.setMadangImgPresence(rs.getString("madang_img_presence").charAt(0));
				sm.setProfilePath(service.selectNo(sm.getMadangWriterUid()).getMemPhoto());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return sm;
	}
	
	public Map<String, ShareMadang> selectPreNext(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map<String, ShareMadang> preNext=new HashMap<String, ShareMadang>();
		String sql=prop.getProperty("selectPreNext");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ShareMadang prev=new ShareMadang();
				prev.setMadangNo(rs.getInt("prev"));
				prev.setMadangTitle(rs.getString("prev_title"));
				preNext.put("prev", prev);
				ShareMadang next=new ShareMadang();
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
	
	public int insertMadang(Connection conn, ShareMadang sm) {
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
			close(pstmt);
		} return result;
	}
}
