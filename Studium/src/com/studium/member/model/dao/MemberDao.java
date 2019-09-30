package com.studium.member.model.dao;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

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

import com.studium.member.model.vo.Member;
import com.studium.member.model.vo.MemberLoginLog;
import com.studium.member.model.vo.MyMemo;
import com.studium.member.model.vo.MyPurchase;
import com.studium.story.model.vo.Story;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
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

	public Member selectNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectNo");
		Member m = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				m = new Member();
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
				m.setMemStatus(rs.getString("mem_status").charAt(0));
				m.setMemWithdrawalDate(rs.getTimestamp("mem_withdrawal_date"));
				m.setMemDeniedDate(rs.getTimestamp("mem_denied_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member selectEmail(Connection conn, String email, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectEmail");
		Member m = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				m = new Member();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public Member checkEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("checkEmail");
		Member m = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m = new Member();
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemUserEmail());
			pstmt.setString(2, m.getMemPassword());
			pstmt.setString(3, m.getMemName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int modifyMember(Connection conn, Member m, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("modifyMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemPhone());
			pstmt.setString(2, m.getMemZipCode());
			pstmt.setString(3, m.getMemAddress1());
			pstmt.setString(4, m.getMemAddress2());
			pstmt.setString(5, m.getMemCategory1());
			pstmt.setString(6, m.getMemCategory2());
			pstmt.setString(7, m.getMemCategory3());
			pstmt.setString(8, m.getMemPassword());
			pstmt.setString(9, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int addMemberInfo(Connection conn, Member m, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("addMemberInfo");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, m.getMemBirth());
			pstmt.setString(2, String.valueOf(m.getMemGender()));
			pstmt.setString(3, m.getMemPhone());
			pstmt.setString(4, m.getMemZipCode());
			pstmt.setString(5, m.getMemAddress1());
			pstmt.setString(6, m.getMemAddress2());
			pstmt.setString(7, m.getMemCategory1());
			pstmt.setString(8, m.getMemCategory2());
			pstmt.setString(9, m.getMemCategory3());
			pstmt.setInt(10, no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;

	}

	public int changeMyPhoto(Connection conn, String filePath, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("changeMyPhoto");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, filePath);// mem_photo
			pstmt.setInt(2, no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}
		return result;

	}

	// 구매한 데이터들만 가져옴 p_study로 join, fstudy값 x
	public List<MyPurchase> selectPurchase(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectPurchase");
		List<MyPurchase> list = new ArrayList<MyPurchase>();
		MyPurchase mp = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				mp = new MyPurchase();
				mp.setPurId(rs.getInt("pur_id"));
				mp.setMemNo(rs.getInt("mem_no"));
				mp.setpNo(rs.getInt("p_no"));
				mp.setpTitle(rs.getString("p_title"));
				mp.setPurchaseDate(rs.getDate("purchase_date"));
				mp.setPurchaseCancelStatus(rs.getString("purchase_status").charAt(0));
				mp.setCancelDate(rs.getDate("cancel_date"));
				mp.setPurchaseStatus(rs.getString("purchase_status").charAt(0));
				mp.setSubmitFile(rs.getString("submit_file").charAt(0));

				list.add(mp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 구매+신청목록
	public List<MyPurchase> selectAllPurchase(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectAllPurchase");
		System.out.println(sql);
		List<MyPurchase> list = new ArrayList<MyPurchase>();
		MyPurchase mp = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 테이블 변경을 고려하여 인수를 열 이름으로 사용
				mp = new MyPurchase();
				mp.setPurId(rs.getInt("pur_id"));
				mp.setMemNo(rs.getInt("mem_no"));
				mp.setfNo(rs.getInt("f_no"));
				mp.setpNo(rs.getInt("p_no"));
				mp.setPurchaseDate(rs.getDate("purchase_date"));
				mp.setPurchaseCancelStatus(rs.getString("purchase_status").charAt(0));
				mp.setCancelDate(rs.getDate("cancel_date"));
				mp.setPurchaseStatus(rs.getString("purchase_status").charAt(0));
				mp.setSubmitFile(rs.getString("submit_file").charAt(0));

				list.add(mp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 내 메모 전체조회
	public List<MyMemo> selectMyMemo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMyMemo");
		List<MyMemo> list = new ArrayList<MyMemo>();
		MyMemo mm = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mm = new MyMemo();
				mm.setMemoId(rs.getInt("memo_id"));
				mm.setMemNo(rs.getInt("mem_no"));
				mm.setMemoFrontId(rs.getInt("memo_front_id"));
				mm.setMemoContents(rs.getString("memo_contents"));
				mm.setMemoLeft(rs.getInt("memo_left"));
				mm.setMemoTop(rs.getInt("memo_top"));
				mm.setMemoDeleteStatus(rs.getString("memo_delete_status").charAt(0));
				list.add(mm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateMyMemo(Connection conn, MyMemo memo, int primary) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMyMemo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memo.getMemoFrontId());
			pstmt.setInt(2, memo.getMemoLeft());
			pstmt.setInt(3, memo.getMemoTop());
			pstmt.setString(4, memo.getMemoContents());
			pstmt.setInt(5, primary);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertMyMemo(Connection conn,MyMemo memo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMyMemo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memo.getMemNo());
			pstmt.setInt(2, memo.getMemoFrontId());
			pstmt.setString(3, memo.getMemoContents());
			pstmt.setInt(4, memo.getMemoLeft());
			pstmt.setInt(5, memo.getMemoTop());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	public int deleteMyMemo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMyMemo");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public int updateSetting(Connection conn, String settingName, String type, int no) {
//		String setString = "";
		PreparedStatement pstmt = null;
		int result = 0;
//
//		if (settingName.equals("receiveEmail")) {
//			setString = "receiveEmail";
//		}
//		if (settingName.equals("useNote")) {
//			setString = "useNote";
//		}
//		if (settingName.equals("receiveSms")) {
//			setString = "receiveSms";
//		}
//		if (settingName.equals("openProfile")) {
//			setString = "openProfile";
//		}

		String sql = prop.getProperty(settingName);
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, type);
			pstmt.setInt(2, no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int insertMll(Connection conn, MemberLoginLog mll) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertMll");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, String.valueOf(mll.getMllSuccess()));
			pstmt.setInt(2, mll.getMllMemNo());
			pstmt.setString(3, mll.getMllUserEmail());
			pstmt.setString(4, mll.getMllIp());
			pstmt.setString(5, mll.getMllReason());
			pstmt.setString(6, mll.getMllUseragent());
			pstmt.setString(7, mll.getMllUrl());
			pstmt.setString(8, mll.getMllReferer());
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			//로그인 로그 남기는 용도
		} finally {
			close(pstmt);
		} return result;
	}
	public Story reviewSelect(Connection conn, int memNo, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("reviewSelect");
		Story s=null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, pNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				s = new Story();
				s.setStoryNo(rs.getInt("STORY_NO"));
				s.setMemNo(rs.getInt("MEM_NO"));
				s.setpNo(rs.getInt("P_NO"));
				s.setStoryStudentpicture(rs.getString("STORY_STUDENT_PICTURE"));
				s.setStoryWrite(rs.getString("STORY_WRITE"));
				s.setStoryContent(rs.getString("STORY_CONTENT"));
				s.setStoryTime(rs.getTimestamp("STORY_TIME"));
				s.setStoryTeachername(rs.getString("STORY_TEACHER_NAME"));
				s.setStoryTeacherpicture(rs.getString("STORY_TEACHER_PICTUER"));
				s.setStoryStar(rs.getInt("STORY_STAR"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return s;
	}
	public int reviewInsert(Connection conn, Story s) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("reviewInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getMemNo());
			pstmt.setInt(2, s.getpNo());
			pstmt.setString(3, s.getpTitle());
			pstmt.setString(4, s.getStoryStudentpicture());
			pstmt.setString(5, s.getStoryWrite());
			pstmt.setString(6, s.getStoryContent());
			pstmt.setString(7, s.getStoryTeachername());
			pstmt.setString(8, s.getStoryTeacherpicture());
			pstmt.setString(9, s.getStorySubject());
			pstmt.setInt(10, s.getStoryStar());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int reviewUpdate(Connection conn, Story story, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("reviewUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, story.getStoryContent());
			pstmt.setInt(2, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
