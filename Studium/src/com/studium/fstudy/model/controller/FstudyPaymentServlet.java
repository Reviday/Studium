package com.studium.fstudy.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.service.PstudyService;

/**
 * Servlet implementation class PstudyPaymentServlet
 */
@WebServlet("/fstudy/fsutdyPayment")
public class FstudyPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudyPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int fno=Integer.parseInt(request.getParameter("fNo"));
		int mno=Integer.parseInt(request.getParameter("mNo"));
		
		Fstudy f=new FstudyService().selectpStudyVIew(fno); 
		Member m=new MemberService().selectNo(mno);
		int PurchaseResult=new FstudyService().addPurchaseResult(mno,fno);
		int count = new FstudyService().PurchaseCount(fno);
		System.out.println(count);
		 int result=new FstudyService().addPerson(fno,count); 
		

		
		String msg=result>0?" 신청성공!":"신청실패!";
	      String loc="";
	      if(result>0) {
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
