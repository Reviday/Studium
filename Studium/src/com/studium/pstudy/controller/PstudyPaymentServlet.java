package com.studium.pstudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

/**
 * Servlet implementation class PstudyPaymentServlet
 */
@WebServlet("/pstudy/psutdyPayment")
public class PstudyPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pNo=Integer.parseInt(request.getParameter("pNo"));
		int mNo=Integer.parseInt(request.getParameter("mNo"));
		int mPoint=Integer.parseInt(request.getParameter("mPoint"));
		
		Member m =new Member();
		m.setMemNo(mNo);
		m.setMemPoint(mPoint);
		int result=new PstudyService().paymentMember(m);
		
		String msg=result>0?"결제성공!":"결제실패!";
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
