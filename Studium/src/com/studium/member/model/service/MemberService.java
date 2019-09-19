package com.studium.member.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;

import com.studium.member.model.dao.MemberDao;
import com.studium.member.model.vo.Member;

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
}
