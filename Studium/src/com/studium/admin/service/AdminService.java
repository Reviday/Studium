package com.studium.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.admin.model.dao.AdminDao;
import com.studium.admin.model.vo.PointShow;
import com.studium.admin.model.vo.QandA;
import com.studium.member.model.vo.Member;

public class AdminService {

	
	private AdminDao dao = new AdminDao();
	
	public int insertQandA(String content, String email) {
		
		Connection conn=getConnection();
		int result=dao.insertQandA(conn,content, email);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;	
		
	}
	
	public int selectCountQandA() {
		Connection conn=getConnection();
		int result=dao.selectCountQandA(conn);
		close(conn);
		return result;
	}
	
	public int selectCountMember() {
		Connection conn=getConnection();
		int result=dao.selectCountMember(conn);
		close(conn);
		return result;
	}
	
	public int selectCountMemberName(String memberName) {
		Connection conn=getConnection();
		int result=dao.selectCountMemberName(conn, memberName);
		close(conn);
		return result;
	}
	
	public int selectCountMemberEmail(String memberName) {
		Connection conn=getConnection();
		int result=dao.selectCountMemberEmail(conn, memberName);
		close(conn);
		return result;
	}
	
	public int selectCountMemberSearch(String grade, String status) {
		Connection conn=getConnection();
		int result=dao.selectCountMemberSearch(conn, grade, status);
		close(conn);
		return result;
	}
	
	public int selectCountPointMember() {
		Connection conn=getConnection();
		int result=dao.selectCountPointMember(conn);
		close(conn);
		return result;
	}
	
	public List<QandA> selectQandAList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<QandA> list=dao.selectQandAList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberPointList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberPointList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberSearchList(int cPage, int numPerPage, String grade, String status) {
		Connection conn = getConnection();
		List<Member> list = dao.selectMemberSearchList(conn, cPage, numPerPage, grade, status);
		close(conn);
		return list;
	}
	
	public int updateMember(String memNo, String grade, String status) {
		Connection conn = getConnection();
		int result = dao.updateMember(conn, memNo, grade, status);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;	
	}
	
	public List<Member> selectMemberNameList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberNameList(conn,cPage,numPerPage, memberName);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberEmailList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberEmailList(conn,cPage,numPerPage, memberName);
		close(conn);
		return list;
	}
	
	public int deleteQnAList(String[] deList) {
		Connection conn = getConnection();
		int result = dao.deleteQnAList(conn, deList);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;	 
	}
	
	public int deleteMember(String memNo) {
		Connection conn = getConnection();
		int result = dao.deleteMember(conn, memNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;	 
	}
	
	public List<Integer> memberPoint(String[] memberNo) {
		Connection conn = getConnection();
		List<Integer> result = dao.memberPoint(conn, memberNo);
		close(conn);
		return result;
	}
	
	public int memberPointUp(String[] memberNo, List<Integer> memberPoint) {
		Connection conn = getConnection();
		int result = dao.memberPointUp(conn, memberNo, memberPoint);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;	
	}
	
	public void pointUpContent(String point, String[] memberNo, String[] memName, String[] memEmail) {
		Connection conn = getConnection();
		int result = dao.pointUpContent(conn, point, memberNo, memName, memEmail);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);	
	}
	
	public void pointDownContent(String point, String[] memberNo, String[] memName, String[] memEmail) {
		Connection conn = getConnection();
		int result = dao.pointDownContent(conn, point, memberNo, memName, memEmail);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);	
	} 
	
	public List<PointShow> pointShow(String memNo) {
		Connection conn=getConnection();
		List<PointShow> list=dao.pointShow(conn, memNo);
		close(conn);
		return list;
	}
	
}
