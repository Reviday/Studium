package com.studium.pstudy.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.fstudy.model.vo.Fstudy;
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
	public List<Pstudy> selectPstudy(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Pstudy> list=dao.selectPstudy(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	public int deletePstudy(int pNo) {
		Connection conn=getConnection();
		int result=dao.deletePstudy(conn,pNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	
	}
	public List<Pstudy> searchPstudy(String area,String day,String category){
		Connection conn=getConnection();
		List<Pstudy> list=dao.searchPstudy(conn,area,day,category);
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
	public int pstudyDibs(int no,int mNo) {
		Connection conn=getConnection();
		int result=dao.pstudyDibs(conn,no,mNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int pstudyDibsDelete(int no,int mNo) {
		Connection conn=getConnection();
		int result=dao.pstudyDibsDelete(conn,no,mNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int selectCountPstudy() {
		Connection conn=getConnection();
		int result=dao.selectCountPstudy(conn);
		close(conn);
		return result;
	}


}
