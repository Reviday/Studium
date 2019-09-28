package com.studium.member.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.member.model.dao.MemberDao;
import com.studium.member.model.vo.Member;
import com.studium.member.model.vo.MemberLoginLog;
import com.studium.member.model.vo.MyMemo;
import com.studium.member.model.vo.MyPurchase;
import com.studium.story.model.vo.Story;

public class MemberService {
	
	private MemberDao dao=new MemberDao();
	
	public Member selectNo(int no) {
		Connection conn=getConnection();
		Member m=dao.selectNo(conn, no);
		close(conn);
		return m;
		
	}
	public Member selectEmail(String email, String password) {
		Connection conn=getConnection();
		Member m=dao.selectEmail(conn, email, password);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		//이메일 중복을 확인하기 위한 작업
		Member mck=dao.checkEmail(conn, m.getMemUserEmail());
		int result=-1;
		
		// mck가 null이 아니라면 동일한 이메일이 존재하는 것
		if(mck==null) {
			// 회원가입 진행
			result=dao.insertMember(conn, m);
			if(result>0) commit(conn);
			else rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int modifyMember(Member m, String id) {
		Connection conn=getConnection();
		int result=dao.modifyMember(conn, m,id);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int addMemberInfo(Member m,int no) {
		Connection conn=getConnection();
		int result=dao.addMemberInfo(conn, m,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	
	}
	public int changeMyPhoto(String filePath,int no) {
		Connection conn=getConnection();
		int result=dao.changeMyPhoto(conn, filePath, no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<MyPurchase> selectPurchase(int no) {
		Connection conn=getConnection();
		List <MyPurchase> list=dao.selectPurchase(conn, no);
		close(conn);
		return list;
		
	}
	public List<MyPurchase> selectAllPurchase(int no) {
		Connection conn=getConnection();
		List <MyPurchase> list=dao.selectAllPurchase(conn, no);
		close(conn);
		return list;
		
	}
	public List<MyMemo> selectMyMemo(int no) {
		Connection conn=getConnection();
		List <MyMemo> list=dao.selectMyMemo(conn, no);
		close(conn);
		return list;
		
	}
	public int updateMyMemo(MyMemo memo, int primary) {
		Connection conn=getConnection();
		int result=dao.updateMyMemo(conn, memo, primary);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public int insertMyMemo(MyMemo memo) {
		Connection conn=getConnection();
		int result=dao.insertMyMemo(conn, memo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteMyMemo(int no) {
		Connection conn=getConnection();
		int result=dao.deleteMyMemo(conn, no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	public int updateSetting(String settingName, String type, int no) {
		Connection conn=getConnection();
		int result=dao.updateSetting(conn, settingName,type, no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public void insertMll(MemberLoginLog mll) {
		Connection conn=getConnection();
		int result=dao.insertMll(conn, mll);
		if(result>0) commit(conn);
		else rollback(conn);
	}
	public Story reviewSelect(int memNo, int no) {
		Connection conn=getConnection();
		Story s=dao.reviewSelect(conn, memNo, no);
		close(conn);
		return s;
	}
	public int reviewInsert(Story s) {
		Connection conn=getConnection();
		int result=dao.reviewInsert(conn, s);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int reviewUpdate(Story story, int no) {
		Connection conn=getConnection();
		int result=dao.reviewUpdate(conn, story, no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}

