package com.studium.fstudy.model.dao;
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

import com.studium.fstudy.model.vo.Fstudy;
import com.studium.member.model.dao.MemberDao;
import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.vo.Pstudy;
public class FstudyDao {
private Properties prop=new Properties();
	
	public FstudyDao() {
		String path=MemberDao.class.getResource("/sql/fstudy/fstudy-query.properties").getPath();
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

	public int fstudyDibs(Connection conn,int mNo,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("fstudyDibs");
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
	public int fstudyDibsDelete(Connection conn,int mNo,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("fstudyDibsDelete");
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
	public int selectCountFstudy(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result=0;
		String sql =prop.getProperty("selectCountFstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//result=rs.getInt("cnt");
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
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
	public List<Fstudy> bestFstudy(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Fstudy>list=new ArrayList();
		String sql=prop.getProperty("bestFstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Fstudy p=new Fstudy();
				p.setfNo(rs.getInt("f_no"));
				p.setfTitle(rs.getString("f_title"));
				p.setfName(rs.getString("f_name"));
				p.setfArea(rs.getString("f_area"));
				p.setfDay(rs.getString("f_day"));
				p.setfStudypserson(rs.getInt("F_STUDYPERSON"));
				p.setfCategory(rs.getString("f_category"));
				p.setfIntro1(rs.getString("f_intro1"));
				p.setfIntro2(rs.getString("f_intro2"));
				p.setfImgtitle(rs.getString("f_imgtitle"));
				p.setfImg1(rs.getString("f_img1"));
				p.setfImg2(rs.getString("f_img2"));
				p.setfImg3(rs.getString("f_img3"));
				p.setfTimestart(rs.getString("f_timestart"));
				p.setfTimeend(rs.getString("f_timeend"));
				p.setfDatestart(rs.getDate("f_datestart"));
				p.setfDateend(rs.getDate("f_dateend"));
				p.setfLike(rs.getInt("f_like"));
				p.setfReadername(rs.getString("f_readername"));
				p.setfStudyMember(rs.getInt("f_studyMember"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Fstudy> searchFstudy(Connection conn,String area,String day,String category){
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		List<Fstudy>list=new ArrayList();
		String sql=prop.getProperty("searchFstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, area);
			pstmt.setString(2, day);
			pstmt.setString(3, category);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Fstudy p=new Fstudy();
				p.setfNo(rs.getInt("f_no"));
				p.setfTitle(rs.getString("f_title"));
				p.setfName(rs.getString("f_name"));
				p.setfArea(rs.getString("f_area"));
				p.setfDay(rs.getString("f_day"));
				p.setfStudypserson(rs.getInt("f_studyperson"));
				p.setfCategory(rs.getString("f_category"));
				p.setfIntro1(rs.getString("f_intro1"));
				p.setfIntro2(rs.getString("f_intro2"));
				p.setfImgtitle(rs.getString("f_imgtitle"));
				p.setfImg1(rs.getString("f_img1"));
				p.setfImg2(rs.getString("f_img2"));
				p.setfImg3(rs.getString("f_img3"));
				p.setfTimestart(rs.getString("f_timestart"));
				p.setfTimeend(rs.getString("f_timeend"));
				p.setfDatestart(rs.getDate("f_datestart"));
				p.setfDateend(rs.getDate("f_dateend"));
				p.setfLike(rs.getInt("f_like"));
				p.setfReadername(rs.getString("f_readername"));
				p.setfStudyMember(rs.getInt("f_studyMember"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	public int updateFstudy(Connection conn,Fstudy p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("updateFstudy");
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,p.getfTitle());
			pstmt.setString(2, p.getfName());
			pstmt.setString(3, p.getfArea());
			pstmt.setString(4, p.getfDay());
			pstmt.setInt(5, p.getfStudypserson());
			pstmt.setString(6, p.getfCategory());
			pstmt.setString(7, p.getfIntro1());
			pstmt.setString(8, p.getfIntro2());
			pstmt.setString(9, p.getfImgtitle());
			pstmt.setString(10, p.getfImg1());
			pstmt.setString(11, p.getfImg2());
			pstmt.setString(12, p.getfImg3());
			pstmt.setString(13, p.getfTimestart());
			pstmt.setString(14, p.getfTimeend());
			pstmt.setDate(15, p.getfDatestart());
			pstmt.setDate(16, p.getfDateend());
			pstmt.setString(17, p.getfReadername());
			pstmt.setInt(18, p.getfNo());
            result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public int deleteFstudy(Connection conn,int pNo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("deleteFstudy");
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
	
	public Fstudy selectpStudyVIew(Connection conn,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Fstudy p= new Fstudy();
		String sql=prop.getProperty("selectFStudyVIew");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				p.setfNo(rs.getInt("f_no"));
				p.setfTitle(rs.getString("f_title"));
				p.setfName(rs.getString("f_name"));
				p.setfArea(rs.getString("f_area"));
				p.setfDay(rs.getString("f_day"));
				p.setfStudypserson(rs.getInt("f_studyperson"));
				p.setfCategory(rs.getString("f_category"));
				p.setfIntro1(rs.getString("f_intro1"));
				p.setfIntro2(rs.getString("f_intro2"));
				p.setfImgtitle(rs.getString("f_imgtitle"));
				p.setfImg1(rs.getString("f_img1"));
				p.setfImg2(rs.getString("f_img2"));
				p.setfImg3(rs.getString("f_img3"));
				p.setfTimestart(rs.getString("f_timestart"));
				p.setfTimeend(rs.getString("f_timeend"));
				p.setfDatestart(rs.getDate("f_datestart"));
				p.setfDateend(rs.getDate("f_dateend"));
				p.setfLike(rs.getInt("f_like"));
				p.setfReadername(rs.getString("f_readername"));
				p.setfStudyMember(rs.getInt("f_studyMember"));
			
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return p;
	}
	
	public List<Fstudy> selectFstudy(Connection conn,int cPage,int numPerPage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Fstudy>list=new ArrayList();
		String sql=prop.getProperty("selectFstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Fstudy p=new Fstudy();
				p.setfNo(rs.getInt("f_no"));
				p.setfTitle(rs.getString("f_title"));
				p.setfName(rs.getString("f_name"));
				p.setfArea(rs.getString("f_area"));
				p.setfDay(rs.getString("f_day"));
				p.setfStudypserson(rs.getInt("f_studyperson"));
				p.setfCategory(rs.getString("f_category"));
				p.setfIntro1(rs.getString("f_intro1"));
				p.setfIntro2(rs.getString("f_intro2"));
				p.setfImgtitle(rs.getString("f_imgtitle"));
				p.setfImg1(rs.getString("f_img1"));
				p.setfImg2(rs.getString("f_img2"));
				p.setfImg3(rs.getString("f_img3"));
				p.setfTimestart(rs.getString("f_timestart"));
				p.setfTimeend(rs.getString("f_timeend"));
				p.setfDatestart(rs.getDate("f_datestart"));
				p.setfDateend(rs.getDate("f_dateend"));
				p.setfLike(rs.getInt("f_like"));
				p.setfReadername(rs.getString("f_readername"));
				p.setfStudyMember(rs.getInt("f_studyMember"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int insertFstudy(Connection conn,Fstudy p) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertFstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,p.getfTitle());
			pstmt.setString(2, p.getfName());
			pstmt.setString(3, p.getfArea());
			pstmt.setString(4, p.getfDay());
			pstmt.setInt(5, p.getfStudypserson());
			pstmt.setString(6, p.getfCategory());
			pstmt.setString(7, p.getfIntro1());
			pstmt.setString(8, p.getfIntro2());
			pstmt.setString(9, p.getfImgtitle());
			pstmt.setString(10, p.getfImg1());
			pstmt.setString(11, p.getfImg2());
			pstmt.setString(12, p.getfImg3());
			pstmt.setString(13, p.getfTimestart());
			pstmt.setString(14, p.getfTimeend());
			pstmt.setDate(15, p.getfDatestart());
			pstmt.setDate(16, p.getfDateend());
			pstmt.setInt(17, p.getfLike());
			pstmt.setString(18, p.getfReadername());
            result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public List<Fstudy> selectMyfstudy(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Fstudy>list=new ArrayList();
		String sql=prop.getProperty("selectMyfstudy");
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Fstudy p=new Fstudy();
				p.setfNo(rs.getInt("f_no"));
				p.setfTitle(rs.getString("f_title"));
				p.setfName(rs.getString("f_name"));
				p.setfArea(rs.getString("f_area"));
				p.setfDay(rs.getString("f_day"));
				p.setfStudypserson(rs.getInt("f_studyperson"));
				p.setfCategory(rs.getString("f_category"));
				p.setfIntro1(rs.getString("f_intro1"));
				p.setfIntro2(rs.getString("f_intro2"));
				p.setfImgtitle(rs.getString("f_imgtitle"));
				p.setfImg1(rs.getString("f_img1"));
				p.setfImg2(rs.getString("f_img2"));
				p.setfImg3(rs.getString("f_img3"));
				p.setfTimestart(rs.getString("f_timestart"));
				p.setfTimeend(rs.getString("f_timeend"));
				p.setfDatestart(rs.getDate("f_datestart"));
				p.setfDateend(rs.getDate("f_dateend"));
				p.setfLike(rs.getInt("f_like"));
				p.setfReadername(rs.getString("f_readername"));
				p.setfStudyMember(rs.getInt("f_studyMember"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	public int addPurchaseResult(Connection conn,int fno,int mno) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql =prop.getProperty("addPurchaseResult");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			pstmt.setInt(2, mno);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int PurchaseCount(Connection conn,int fno) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result=0;
		String sql =prop.getProperty("PurchaseCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	public int addPerson(Connection conn,int fno,int count) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("addPerson");
		try {
			pstmt=conn.prepareCall(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, fno);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
