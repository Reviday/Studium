package com.studium.admin.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.admin.model.dao.AdminDao;
import com.studium.admin.model.vo.CanclePayMember;
import com.studium.admin.model.vo.PayMember;
import com.studium.admin.model.vo.PointShow;
import com.studium.admin.model.vo.QandA;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.member.model.vo.Member;
import com.studium.mypage.model.vo.LeaderAdd;
import com.studium.pstudy.model.vo.Pstudy;

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
	
	public int selectCountLoginLog() {
		Connection conn=getConnection();
		int result=dao.selectCountLoginLog(conn);
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
	
	public int selectCountPayMemberName(String memberName) {
		Connection conn=getConnection();
		int result=dao.selectCountPayMemberName(conn, memberName);
		close(conn);
		return result;
	}
	
	public int selectCountCanclePayMemberEmail(String memberName) {
		Connection conn=getConnection();
		int result=dao.selectCountCanclePayMemberEmail(conn, memberName);
		close(conn);
		return result;
	}
	
	public int selectCountCanclePayMemberName(String memberName) {
		Connection conn=getConnection();
		int result=dao.selectCountCanclePayMemberName(conn, memberName);
		close(conn);
		return result;
	}
	
	public int selectCountPayMemberEmail(String memberName) {
		Connection conn=getConnection();
		int result=dao.selectCountPayMemberEmail(conn, memberName);
		close(conn);
		return result;
	}
	
	public int selectCountMemberSearch(String grade, String status) {
		Connection conn=getConnection();
		int result=dao.selectCountMemberSearch(conn, grade, status);
		close(conn);
		return result;
	}
	
	public int selectCountPayMember() {
		Connection conn=getConnection();
		int result=dao.selectCountPayMember(conn);
		close(conn);
		return result;
	}
	
	public int selectCountStudy() {
		Connection conn=getConnection();
		int result=dao.selectCountPayMember(conn);
		close(conn);
		return result;
	}
	
	public int selectCountFreeStudy() {
		Connection conn=getConnection();
		int result=dao.selectCountFreeStudy(conn);
		close(conn);
		return result;
	}
	
	public int selectCountFutureFreeStudyList() {
		Connection conn=getConnection();
		int result=dao.selectCountFutureFreeStudyList(conn);
		close(conn);
		return result;
	}
	
	
	public int selectCountCanclePayMember() {
		Connection conn=getConnection();
		int result=dao.selectCountCanclePayMember(conn);
		close(conn);
		return result;
	}
	
	public int selectCountPointMember() {
		Connection conn=getConnection();
		int result=dao.selectCountPointMember(conn);
		close(conn);
		return result;
	}
	
	public int selectCountLeader() {
		Connection conn=getConnection();
		int result=dao.selectCountLeader(conn);
		close(conn);
		return result;
	}
	
	public int selectCountEndStudyList() {
		Connection conn=getConnection();
		int result=dao.selectCountEndStudyList(conn);
		close(conn);
		return result;
	}
	
	public int selectCountEndFreeStudyList() {
		Connection conn=getConnection();
		int result=dao.selectCountEndFreeStudyList(conn);
		close(conn);
		return result;
	}
	
	public int selectCountFutureStudyList() {
		Connection conn=getConnection();
		int result=dao.selectCountFutureStudyList(conn);
		close(conn);
		return result;
	}
	
	public List<Fstudy> selectFutureFreeStudyList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Fstudy> list=dao.selectFutureFreeStudyList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Fstudy> selectEndFreeStudyList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Fstudy> list=dao.selectEndFreeStudyList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Fstudy> selectFreeStudyPlayList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Fstudy> list=dao.selectFreeStudyPlayList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Pstudy> selectFutureStudyList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Pstudy> list=dao.selectFutureStudyList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Pstudy> selectEndStudyList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Pstudy> list=dao.selectEndStudyList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<LeaderAdd> selectLeaderPSList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<LeaderAdd> list=dao.selectLeaderPSList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<QandA> selectQandAList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<QandA> list=dao.selectQandAList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Pstudy> selectStudyPlayList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Pstudy> list=dao.selectStudyPlayList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<CanclePayMember> selectCanclePayMemberList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<CanclePayMember> list=dao.selectCanclePayMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public List<PayMember> selectPayMemberList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<PayMember> list=dao.selectPayMemberList(conn,cPage,numPerPage);
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
	
	public List<PayMember> selectPayMemberNameList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<PayMember> list=dao.selectPayMemberNameList(conn,cPage,numPerPage, memberName);
		close(conn);
		return list;
	}
	
	public List<Member> selectMemberEmailList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberEmailList(conn,cPage,numPerPage, memberName);
		close(conn);
		return list;
	}
	
	public List<CanclePayMember> selectCanclePayMemberEmailList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<CanclePayMember> list=dao.selectCanclePayMemberEmailList(conn,cPage,numPerPage, memberName);
		close(conn);
		return list;
	}
	
	public List<CanclePayMember> selectCanclePayMemberNameList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<CanclePayMember> list=dao.selectCanclePayMemberNameList(conn,cPage,numPerPage, memberName);
		close(conn);
		return list;
	}
	
	public List<PayMember> selectPayMemberEmailList(int cPage, int numPerPage, String memberName){
		Connection conn=getConnection();
		List<PayMember> list=dao.selectPayMemberEmailList(conn,cPage,numPerPage, memberName);
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
	
	public int deletePS(String[] leaderNo) {
		Connection conn = getConnection();
		int result = dao.deletePS(conn, leaderNo);
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
	
	public int deletePayMember(String memNo) {
		Connection conn = getConnection();
		int result = dao.deletePayMember(conn, memNo);
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
	
	public int updateMemo(String memNo, String memo) {
		Connection conn = getConnection();
		int result = dao.updateMemo(conn, memNo, memo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	
	public String showMemo(String memNo) {
		Connection conn = getConnection();
		String memo = dao.showMemo(conn, memNo);
		close(conn);
		return memo;
	}
	
	public String memoPS(String memNo) {
		Connection conn = getConnection();
		String memo = dao.memoPS(conn, memNo);
		close(conn);
		return memo;
	}
	
}
