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

import com.studium.madang.model.vo.MadangCmt;
import com.studium.member.model.service.MemberService;

public class MadangCmtDao {
	
private Properties prop=new Properties();
	
	public MadangCmtDao() {
		String path=FreeMadangDao.class.getResource("/sql/madang/madangcmt-query.properties").getPath();
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
	
	public List<MadangCmt> selectCmtList(Connection conn, int madangNo, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MadangCmt> list = new ArrayList<MadangCmt>();
		String sql=prop.getProperty("selectCmtList");
		MemberService service= new MemberService();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, madangNo);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MadangCmt cmt=new MadangCmt();
				cmt.setCmtNo(rs.getInt("cmt_no"));
				cmt.setCmtGroup(rs.getInt("cmt_group"));
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
}
