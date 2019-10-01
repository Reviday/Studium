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
import java.util.List;
import java.util.Properties;

import com.studium.madang.model.vo.BoastMadangCmt;
import com.studium.member.model.service.MemberService;

public class BoastMadangCmtDao {
	
	private Properties prop=new Properties();
	
	public BoastMadangCmtDao() {
		String path=FreeMadangDao.class.getResource("/sql/madang/boastmadangcmt-query.properties").getPath();
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
	
	public int selectCountList(Connection conn, int madangNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String sql=prop.getProperty("selectCountList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
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
	
	public List<BoastMadangCmt> selectCmtList(Connection conn, int madangNo, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoastMadangCmt> list = new ArrayList<BoastMadangCmt>();
		String sql=prop.getProperty("selectCmtList");
		MemberService service= new MemberService();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoastMadangCmt cmt=new BoastMadangCmt();
				cmt.setCmtNo(rs.getInt("cmt_no"));
				cmt.setCmtParent(rs.getInt("cmt_parent"));
				cmt.setCmtSort(rs.getInt("cmt_sort"));
				cmt.setCmtMadangNo(rs.getInt("cmt_madang_no"));
				cmt.setCmtContent(rs.getString("cmt_content"));
				cmt.setCmtReply(rs.getString("cmt_reply").charAt(0));
				cmt.setCmtWriterUid(rs.getInt("cmt_writer_uid"));
				cmt.setCmtWriter(rs.getString("cmt_writer"));
				cmt.setCmtWriterName(rs.getString("cmt_writer_name"));
				cmt.setCmtRegisterDatetime(rs.getTimestamp("cmt_register_datetime"));
				cmt.setCmtUpdatedDatetime(rs.getTimestamp("cmt_updated_datetime"));
				cmt.setCmtRegisterIp(rs.getString("cmt_register_ip"));
				cmt.setCmtUpdatedIp(rs.getString("cmt_updated_ip"));
				cmt.setStatus(rs.getString("cmt_status").charAt(0));
				cmt.setCmtBlame(rs.getInt("cmt_blame"));
				cmt.setCmtBlameAdmin(rs.getString("cmt_blame_admin").charAt(0));
				cmt.setProfilePath(service.selectNo(cmt.getCmtWriterUid()).getMemPhoto());
				list.add(cmt);
			}
		} catch(SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(rs);
			close(pstmt);
		} return list;
	}
	
	
	public int insertComment(Connection conn, BoastMadangCmt cmt) {
		PreparedStatement pstmt=null;
		int result=0;
		String insertsql=prop.getProperty("insertComment");
		
		try {
			pstmt=conn.prepareStatement(insertsql);
			pstmt.setInt(1, cmt.getCmtMadangNo());
			pstmt.setString(2, cmt.getCmtContent());
			pstmt.setInt(3, cmt.getCmtWriterUid());
			pstmt.setString(4, cmt.getCmtWriter());
			pstmt.setString(5, cmt.getCmtWriterName());
			pstmt.setString(6, cmt.getCmtRegisterIp());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int insertReply(Connection conn, BoastMadangCmt cmt) {
		PreparedStatement pstmt=null;
		int result=0;
		// 대댓글을 추가하기 위한 SQL문
		String sql=prop.getProperty("insertReply");
		
		try {
			// 기존 대댓글의 SORT값을 UPDATE 시킨 이후, 대댓글을 추가한다.
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cmt.getCmtParent());
			pstmt.setInt(2, cmt.getCmtMadangNo());
			pstmt.setString(3, cmt.getCmtContent());
			pstmt.setInt(4, cmt.getCmtWriterUid());
			pstmt.setString(5, cmt.getCmtWriter());
			pstmt.setString(6, cmt.getCmtWriterName());
			pstmt.setString(7, cmt.getCmtRegisterIp());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int updateReplySort(Connection conn, BoastMadangCmt cmt) {
		PreparedStatement pstmt=null;
		int result=0;
		// 대댓글 추가시, 기존의 댓글들의 SORT 값을 증가시키기 위한 UPDATE 문
		String sql=prop.getProperty("updateReplySort");
		
		try {
			// 대댓글을 INSERT 하기 전에, 기존에 존재하는 대댓글의 SORT값을 증가시킨다
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cmt.getCmtParent());
			
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(pstmt);
		} return result;
	}
	
	
	public int updateCmtReply(Connection conn, BoastMadangCmt cmt) {
		PreparedStatement pstmt=null;
		int result=0;
		// 대댓글 추가시, 해당 댓글에 cmt_reply을 'Y'로 세팅한다.(기존에 'Y'값이어도 상관없다.);
		String sql=prop.getProperty("updateCmtReply");
		
		try {
			// 대댓글을 INSERT 하기 전에, 기존에 존재하는 대댓글의 SORT값을 증가시킨다
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cmt.getCmtParent());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace(); 
		} finally {
			close(pstmt);
		} return result;
	}
}
