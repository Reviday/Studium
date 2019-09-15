package com.studium.pstudy.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.dao.PstudyDao;
import com.studium.pstudy.model.vo.Pstudy;


public class PstudyService {
	
	private PstudyDao dao=new PstudyDao();
	
	
	public int inserPstudy(Pstudy p) {
		Connection conn =getConnection();
		int result=dao.insertPstudy(conn,p);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
		
	}
	public int paymentMember(Member m) {
		Connection conn=getConnection();
		int result=dao.paymentMember(conn,m);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public Pstudy selectpStudyVIew(int no) {
		Connection conn=getConnection();
		Pstudy p=dao.selectpStudyVIew(conn,no);
		close(conn);
		return p;
	}
	public List<Pstudy> selectPstudy(){
		Connection conn=getConnection();
		List<Pstudy> list=dao.selectPstudy(conn);
		close(conn);
		return list;
		
	}
	public int deletePstudy(int pNo) {
		Connection conn=getConnection();
		int result=dao.deletePstudy(conn,pNo);
		close(conn);
		return result;
	
	}
	public List<Pstudy> searchPstudy(String area,String day){
		Connection conn=getConnection();
		List<Pstudy> list=dao.searchPstudy(conn,area,day);
		close(conn);
		return list;
	}
	public int updatePstudy(Pstudy p) {
		Connection conn=getConnection();
		int result=dao.updatePstudy(conn,p);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public List<Pstudy> bestPstudy(){
		Connection conn=getConnection();
		List<Pstudy> list=dao.bestPstudy(conn);
		close(conn);
		return list;
	}
}
