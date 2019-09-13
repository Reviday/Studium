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

import com.studium.madang.model.vo.FreeMadang;
import com.studium.madang.model.vo.ShareMadang;

public class ShareMadangDao {

private Properties prop=new Properties();
	
	public ShareMadangDao() {
		String path=FreeMadangDao.class.getResource("/sql/madang/sharemadang-query.properties").getPath();
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
	
	public List<ShareMadang> selectMadangList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ShareMadang> list=new ArrayList<ShareMadang>();
		String sql=prop.getProperty("selectMadangList");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ShareMadang sm=new ShareMadang();
				sm.setMadangNo(rs.getInt("madang_no"));
				sm.setMadangParent(rs.getInt("madang_parent"));
				sm.setMadangOrder(rs.getInt("madang_order"));
				sm.setMadangWriterEmail(rs.getString("madang_writer_email"));
				sm.setMadangWriterName(rs.getString("madang_writer_name"));
				sm.setMadangTitle(rs.getString("madang_title"));
				sm.setMadangContent(rs.getString("madang_content"));
				sm.setMadangRegisterDatetime(rs.getTimestamp("madang_register_datetime"));
				sm.setMadangRegisterIp(rs.getString("madang_register_ip"));
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
}
