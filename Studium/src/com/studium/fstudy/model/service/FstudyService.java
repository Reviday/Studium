package com.studium.fstudy.model.service;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.studium.fstudy.model.dao.FstudyDao;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.vo.Pstudy;

public class FstudyService {
	private FstudyDao dao=new FstudyDao();
	
	
	public int inserFstudy(Fstudy p) {
		Connection conn =getConnection();
		int result=dao.insertFstudy(conn,p);
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
	public Fstudy selectpStudyVIew(int no) {
		Connection conn=getConnection();
		Fstudy p=dao.selectpStudyVIew(conn,no);
		close(conn);
		return p;
	}
	public List<Fstudy> selectFstudy(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Fstudy> list=dao.selectFstudy(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	public int deleteFstudy(int pNo) {
		Connection conn=getConnection();
		int result=dao.deleteFstudy(conn,pNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	
	}
	public List<Fstudy> searchFstudy(String setString,String area,String day,String category,int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Fstudy> list=dao.searchFstudy(conn,setString,area,day,category, cPage, numPerPage);
		close(conn);
		return list;
	}
	public int updateFstudy(Fstudy p) {
		Connection conn=getConnection();
		int result=dao.updateFstudy(conn,p);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public List<Fstudy> bestFstudy(){
		Connection conn=getConnection();
		List<Fstudy> list=dao.bestFstudy(conn);
		close(conn);
		return list;
	}
	public int fstudyDibs(int no,int mNo) {
		Connection conn=getConnection();
		int result=dao.fstudyDibs(conn,no,mNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int fstudyDibsDelete(int no,int mNo) {
		Connection conn=getConnection();
		int result=dao.fstudyDibsDelete(conn,no,mNo);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int selectCountFstudy() {
		Connection conn=getConnection();
		int result=dao.selectCountFstudy(conn);
		close(conn);
		return result;
	}
	public List<Fstudy> selectMyfstudy(){
		Connection conn=getConnection();
		List<Fstudy> list=dao.selectMyfstudy(conn);
		close(conn);
		return list;
	}
	
	public int addPurchaseResult(int mno,int fno) {
		Connection conn=getConnection();
		int result=dao.addPurchaseResult(conn,mno,fno);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int PurchaseCount(int fno) {
		Connection conn=getConnection();
		int result=dao.PurchaseCount(conn,fno);
		close(conn);
		return result;
	}
	public int addPerson(int fno,int count) {
		Connection conn=getConnection();
		int result=dao.addPerson(conn,fno,count);
		if(result>0) {commit(conn);}
		else {rollback(conn);}
		close(conn);
		return result;
	}
	public int selectCountSearch(String area, String day, String category) {
		Connection conn=getConnection();
		int result=dao.selectCountSearch(conn,area,day,category);
		close(conn);
		return result;
	}
}
