package com.studium.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.studium.member.model.vo.Member;
import static common.template.JDBCTemplate.close;

public class MemberDao {
	
	private Properties prop=new Properties();

	public MemberDao() {
		String path=MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
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
	public Member selectNo(Connection conn, int no){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectNo");
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				m=new Member();
				m.setMemNo(rs.getInt("mem_no"));
				m.setMemUserEmail(rs.getString("mem_email"));
				m.setMemPassword(rs.getString("mem_password"));
				m.setMemCode(rs.getString("mem_code").charAt(0));
				m.setMemName(rs.getString("mem_name"));
				m.setMemBirth(rs.getDate("mem_birth"));
				m.setMemPhone(rs.getString("mem_phone"));
				m.setMemGender(rs.getString("mem_gender").charAt(0));
				m.setMemPoint(rs.getInt("mem_point"));
				m.setMemCategory1(rs.getString("mem_category1"));
				m.setMemCategory2(rs.getString("mem_category2"));
				m.setMemCategory3(rs.getString("mem_category3"));
				m.setMemZipCode(rs.getString("mem_zipcode"));
				m.setMemAddress1(rs.getString("mem_address1"));
				m.setMemAddress2(rs.getString("mem_address2"));
				m.setMemReceiveEmail(rs.getString("mem_receive_email").charAt(0));
				m.setMemUseNote(rs.getString("mem_use_note").charAt(0));
				m.setMemReceiveSms(rs.getString("mem_receive_sms").charAt(0));
				m.setMemOpenProfile(rs.getString("mem_open_profile").charAt(0));
				m.setMemDenied(rs.getString("mem_denied").charAt(0));
				m.setMemEmailCert(rs.getString("mem_email_cert").charAt(0));
				m.setMemEnrollDatetime(rs.getTimestamp("mem_enroll_datetime"));
				m.setMemEnrollIp(rs.getString("mem_enroll_ip"));
				m.setMemLastloginDatetime(rs.getTimestamp("mem_lastlogin_datetime"));
				m.setMemLastloginIp(rs.getString("mem_lastlogin_ip"));
				m.setMemProfileContent(rs.getString("mem_profile_content"));
				m.setMemAdminmemo(rs.getString("mem_adminmemo"));
				m.setMemIcon(rs.getString("mem_icon"));
				m.setMemPhoto(rs.getString("mem_photo"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return m;
	}
		
	public Member selectEmail(Connection conn, String email, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectEmail");
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				m=new Member();
				m.setMemNo(rs.getInt("mem_no"));
				m.setMemUserEmail(rs.getString("mem_email"));
				m.setMemPassword(rs.getString("mem_password"));
				m.setMemCode(rs.getString("mem_code").charAt(0));
				m.setMemName(rs.getString("mem_name"));
				m.setMemBirth(rs.getDate("mem_birth"));
				m.setMemPhone(rs.getString("mem_phone"));
				m.setMemGender(rs.getString("mem_gender").charAt(0));
				m.setMemPoint(rs.getInt("mem_point"));
				m.setMemCategory1(rs.getString("mem_category1"));
				m.setMemCategory2(rs.getString("mem_category2"));
				m.setMemCategory3(rs.getString("mem_category3"));
				m.setMemZipCode(rs.getString("mem_zipcode"));
				m.setMemAddress1(rs.getString("mem_address1"));
				m.setMemAddress2(rs.getString("mem_address2"));
				m.setMemReceiveEmail(rs.getString("mem_receive_email").charAt(0));
				m.setMemUseNote(rs.getString("mem_use_note").charAt(0));
				m.setMemReceiveSms(rs.getString("mem_receive_sms").charAt(0));
				m.setMemOpenProfile(rs.getString("mem_open_profile").charAt(0));
				m.setMemDenied(rs.getString("mem_denied").charAt(0));
				m.setMemEmailCert(rs.getString("mem_email_cert").charAt(0));
				m.setMemEnrollDatetime(rs.getTimestamp("mem_enroll_datetime"));
				m.setMemEnrollIp(rs.getString("mem_enroll_ip"));
				m.setMemLastloginDatetime(rs.getTimestamp("mem_lastlogin_datetime"));
				m.setMemLastloginIp(rs.getString("mem_lastlogin_ip"));
				m.setMemProfileContent(rs.getString("mem_profile_content"));
				m.setMemAdminmemo(rs.getString("mem_adminmemo"));
				m.setMemIcon(rs.getString("mem_icon"));
				m.setMemPhoto(rs.getString("mem_photo"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return m;
	}
	
	public Member checkEmail(Connection conn, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("checkEmail");
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				m=new Member();
				m.setMemNo(rs.getInt("mem_no"));
				m.setMemUserEmail(rs.getString("mem_email"));
				m.setMemPassword(rs.getString("mem_password"));
				m.setMemCode(rs.getString("mem_code").charAt(0));
				m.setMemName(rs.getString("mem_name"));
				m.setMemBirth(rs.getDate("mem_birth"));
				m.setMemPhone(rs.getString("mem_phone"));
				m.setMemGender(rs.getString("mem_gender").charAt(0));
				m.setMemPoint(rs.getInt("mem_point"));
				m.setMemCategory1(rs.getString("mem_category1"));
				m.setMemCategory2(rs.getString("mem_category2"));
				m.setMemCategory3(rs.getString("mem_category3"));
				m.setMemZipCode(rs.getString("mem_zipcode"));
				m.setMemAddress1(rs.getString("mem_address1"));
				m.setMemAddress2(rs.getString("mem_address2"));
				m.setMemReceiveEmail(rs.getString("mem_receive_email").charAt(0));
				m.setMemUseNote(rs.getString("mem_use_note").charAt(0));
				m.setMemReceiveSms(rs.getString("mem_receive_sms").charAt(0));
				m.setMemOpenProfile(rs.getString("mem_open_profile").charAt(0));
				m.setMemDenied(rs.getString("mem_denied").charAt(0));
				m.setMemEmailCert(rs.getString("mem_email_cert").charAt(0));
				m.setMemEnrollDatetime(rs.getTimestamp("mem_enroll_datetime"));
				m.setMemEnrollIp(rs.getString("mem_enroll_ip"));
				m.setMemLastloginDatetime(rs.getTimestamp("mem_lastlogin_datetime"));
				m.setMemLastloginIp(rs.getString("mem_lastlogin_ip"));
				m.setMemProfileContent(rs.getString("mem_profile_content"));
				m.setMemAdminmemo(rs.getString("mem_adminmemo"));
				m.setMemIcon(rs.getString("mem_icon"));
				m.setMemPhoto(rs.getString("mem_photo"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return m;
	}
	
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql= prop.getProperty("insertMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemUserEmail());
			pstmt.setString(2, m.getMemPassword());
			pstmt.setString(3, m.getMemName());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
		
	}
}
