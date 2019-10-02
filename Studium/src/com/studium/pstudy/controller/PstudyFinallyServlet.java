package com.studium.pstudy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

/**
 * Servlet implementation class PstudyFinallyServlet
 */
@WebServlet("/pstudy/pstudyFinally")
public class PstudyFinallyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyFinallyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int mno=Integer.parseInt(request.getParameter("mNo"));
		int pno=Integer.parseInt(request.getParameter("pNo"));
		Pstudy p=new PstudyService().selectpStudyVIew(pno); 
		Member m=new MemberService().selectNo(mno);
		int PurchaseResult=new PstudyService().addPurchaseResult(mno,pno);
		int count = new PstudyService().PurchaseCount(pno);
		 int result=new PstudyService().addPerson(pno,count); 

	    String msg=PurchaseResult>0?"결제성공!":"결제실패!";
	      String loc="";
	      if(PurchaseResult>0) {
	    	  loc="/";
	      }else {
	    	  loc="/";
	      }
	      request.setAttribute("msg", msg);
	      request.setAttribute("loc", loc);
	      request.getRequestDispatcher("/views/common/msg.jsp")
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
