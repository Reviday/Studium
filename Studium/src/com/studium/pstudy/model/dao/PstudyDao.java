package com.studium.pstudy.model.dao;
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

import com.studium.member.model.dao.MemberDao;
import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.vo.Pstudy;


public class PstudyDao {
	private Properties prop=new Properties();
	
	public PstudyDao() {
		String path=MemberDao.class.getResource("/sql/pstudy/pstudy-query.properties").getPath();
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
	
	public int pstudyDibs(Connection conn,int mNo,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("pstudyDibs");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			pstmt.setInt(2,mNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int pstudyDibsDelete(Connection conn,int mNo,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("pstudyDibsDelete");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			pstmt.setInt(2,mNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	public int paymentMember(Connection conn , Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("paymentMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,m.getMemPoint());
			pstmt.setInt(2,m.getMemNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public List<Pstudy> bestPstudy(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Pstudy>list=new ArrayList();
		String sql=prop.getProperty("bestPstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Pstudy p=new Pstudy();
				p.setpNo(rs.getInt("p_no"));
				p.setpTitle(rs.getString("p_title"));
				p.setpName(rs.getString("p_name"));
				p.setpArea(rs.getString("p_area"));
				p.setpDay(rs.getString("P_day"));
				p.setpStudypserson(rs.getInt("p_studyperson"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpCategory(rs.getString("p_category"));
				p.setpIntro1(rs.getString("p_intro1"));
				p.setpIntro2(rs.getString("p_intro2"));
				p.setpImgtitle(rs.getString("p_imgtitle"));
				p.setpImg1(rs.getString("p_img1"));
				p.setpImg2(rs.getString("p_img2"));
				p.setpImg3(rs.getString("p_img3"));
				p.setpTimestart(rs.getString("p_timestart"));
				p.setpTimeend(rs.getString("P_timeend"));
				p.setpDatestart(rs.getDate("p_datestart"));
				p.setpDateend(rs.getDate("p_dateend"));
				p.setpLike(rs.getInt("p_like"));
				p.setpTeachername(rs.getString("p_teachername"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Pstudy> searchPstudy(Connection conn,String area,String day,String category){
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		List<Pstudy>list=new ArrayList();
		String sql=prop.getProperty("searchPstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, area);
			pstmt.setString(2, day);
			pstmt.setString(3,category);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Pstudy p=new Pstudy();
				p.setpNo(rs.getInt("p_no"));
				p.setpTitle(rs.getString("p_title"));
				p.setpName(rs.getString("p_name"));
				p.setpArea(rs.getString("p_area"));
				p.setpDay(rs.getString("P_day"));
				p.setpStudypserson(rs.getInt("p_studyperson"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpCategory(rs.getString("p_category"));
				p.setpIntro1(rs.getString("p_intro1"));
				p.setpIntro2(rs.getString("p_intro2"));
				p.setpImgtitle(rs.getString("p_imgtitle"));
				p.setpImg1(rs.getString("p_img1"));
				p.setpImg2(rs.getString("p_img2"));
				p.setpImg3(rs.getString("p_img3"));
				p.setpTimestart(rs.getString("p_timestart"));
				p.setpTimeend(rs.getString("P_timeend"));
				p.setpDatestart(rs.getDate("p_datestart"));
				p.setpDateend(rs.getDate("p_dateend"));
				p.setpLike(rs.getInt("p_like"));
				p.setpTeachername(rs.getString("p_teachername"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	public int updatePstudy(Connection conn,Pstudy p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updatePstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,p.getpTitle());
			pstmt.setString(2, p.getpName());
			pstmt.setString(3, p.getpArea());
			pstmt.setString(4, p.getpDay());
			pstmt.setInt(5, p.getpStudypserson());
			pstmt.setInt(6, p.getpPrice());
			pstmt.setString(7, p.getpCategory());
			pstmt.setString(8, p.getpIntro1());
			pstmt.setString(9, p.getpIntro2());
			pstmt.setString(10, p.getpImgtitle());
			pstmt.setString(11, p.getpImg1());
			pstmt.setString(12, p.getpImg2());
			pstmt.setString(13, p.getpImg3());
			pstmt.setString(14, p.getpTimestart());
			pstmt.setString(15, p.getpTimeend());
			pstmt.setDate(16, p.getpDatestart());
			pstmt.setDate(17, p.getpDateend());
			pstmt.setString(18, p.getpTeachername());
			pstmt.setInt(19, p.getpNo());
            result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public int deletePstudy(Connection conn,int pNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deletePstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}return result;
	}
	
	public Pstudy selectpStudyVIew(Connection conn,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Pstudy p= new Pstudy();
		String sql=prop.getProperty("selectpStudyVIew");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p.setpNo(rs.getInt("p_no"));
				p.setpTitle(rs.getString("p_title"));
				p.setpName(rs.getString("p_name"));
				p.setpArea(rs.getString("p_area"));
				p.setpDay(rs.getString("P_day"));
				p.setpStudypserson(rs.getInt("p_studyperson"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpCategory(rs.getString("p_category"));
				p.setpIntro1(rs.getString("p_intro1"));
				p.setpIntro2(rs.getString("p_intro2"));
				p.setpImgtitle(rs.getString("p_imgtitle"));
				p.setpImg1(rs.getString("p_img1"));
				p.setpImg2(rs.getString("p_img2"));
				p.setpImg3(rs.getString("p_img3"));
				p.setpTimestart(rs.getString("p_timestart"));
				p.setpTimeend(rs.getString("P_timeend"));
				p.setpDatestart(rs.getDate("p_datestart"));
				p.setpDateend(rs.getDate("p_dateend"));
				p.setpLike(rs.getInt("p_like"));
				p.setpTeachername(rs.getString("p_teachername"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return p;
	}
	
	public List<Pstudy> selectPstudy(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Pstudy>list=new ArrayList();
		String sql=prop.getProperty("selectPstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Pstudy p=new Pstudy();
				p.setpNo(rs.getInt("p_no"));
				p.setpTitle(rs.getString("p_title"));
				p.setpName(rs.getString("p_name"));
				p.setpArea(rs.getString("p_area"));
				p.setpDay(rs.getString("P_day"));
				p.setpStudypserson(rs.getInt("p_studyperson"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpCategory(rs.getString("p_category"));
				p.setpIntro1(rs.getString("p_intro1"));
				p.setpIntro2(rs.getString("p_intro2"));
				p.setpImgtitle(rs.getString("p_imgtitle"));
				p.setpImg1(rs.getString("p_img1"));
				p.setpImg2(rs.getString("p_img2"));
				p.setpImg3(rs.getString("p_img3"));
				p.setpTimestart(rs.getString("p_timestart"));
				p.setpTimeend(rs.getString("P_timeend"));
				p.setpDatestart(rs.getDate("p_datestart"));
				p.setpDateend(rs.getDate("p_dateend"));
				p.setpLike(rs.getInt("p_like"));
				p.setpTeachername(rs.getString("p_teachername"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int insertPstudy(Connection conn,Pstudy p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertPstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,p.getpTitle());
			pstmt.setString(2, p.getpName());
			pstmt.setString(3, p.getpArea());
			pstmt.setString(4, p.getpDay());
			pstmt.setInt(5, p.getpStudypserson());
			pstmt.setInt(6, p.getpPrice());
			pstmt.setString(7, p.getpCategory());
			pstmt.setString(8, p.getpIntro1());
			pstmt.setString(9, p.getpIntro2());
			pstmt.setString(10, p.getpImgtitle());
			pstmt.setString(11, p.getpImg1());
			pstmt.setString(12, p.getpImg2());
			pstmt.setString(13, p.getpImg3());
			pstmt.setString(14, p.getpTimestart());
			pstmt.setString(15, p.getpTimeend());
			pstmt.setDate(16, p.getpDatestart());
			pstmt.setDate(17, p.getpDateend());
			pstmt.setInt(18, p.getpLike());
			pstmt.setString(19, p.getpTeachername());
            result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
}
