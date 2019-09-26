package com.studium.pstudy.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class PstudystudyPayServlet
 */
@WebServlet("/studyPay")
public class PstudystudyPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudystudyPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno=Integer.parseInt(request.getParameter("pno"));
		int mno=Integer.parseInt(request.getParameter("mno"));
		
		Pstudy newp=new PstudyService().selectpStudyVIew(pno); 
		Member newm=new MemberService().selectNo(mno);
		int resultPay=newp.getpPrice()-newm.getMemPoint();
		request.setAttribute("newp", newp);
	 request.setAttribute("resultPay", resultPay); 
		request.setAttribute("newm", newm);
		request.getRequestDispatcher("/views/pstudy/payview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
