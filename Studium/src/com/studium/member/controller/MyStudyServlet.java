package com.studium.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.member.model.vo.MyPurchase;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/myPage/myStudy")
public class MyStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyStudyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		MemberService ms=new MemberService();
		Member m=ms.selectNo(memberNo);
		
		//신청or구매 목록 가지고 오기
		List<MyPurchase>myPur_list=ms.selectAllPurchase(memberNo);

		List<Pstudy> plist=new PstudyService().selectMypstudy();
		List<Fstudy> flist=new FstudyService().selectMyfstudy();
		List<Pstudy> myplist= new ArrayList();
		List<Fstudy> myflist= new ArrayList();
		
		
		for(MyPurchase my : myPur_list) {
			for(Pstudy pl : plist) {
				if(my.getpNo()==pl.getpNo()) {
					myplist.add(pl);
					
				}
			}
		}
		for(MyPurchase my : myPur_list) {
			for(Fstudy fl : flist) {
				if(my.getfNo()==fl.getfNo()) {
					myflist.add(fl);
					
				}
			}
		}
		request.setAttribute("myplist", myplist);
		request.setAttribute("myflist", myflist);
		
		request.setAttribute("member", m);
		request.getRequestDispatcher("/views/myPage/myStudy.jsp")
		.forward(request,response);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
