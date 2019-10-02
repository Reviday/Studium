package com.studium.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.member.model.vo.MyPurchase;

import common.template.LoginCheck;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/myPage/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		if(!new LoginCheck().doLoginCheck(request, response, 1000)) return;
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		MemberService ms=new MemberService();
		Member m=ms.selectNo(memberNo);
		//구매목록 가지고 오기
		List<MyPurchase>list=ms.selectPurchase(memberNo);
		request.setAttribute("member", m);
		request.setAttribute("purchaseL", list);
		request.getRequestDispatcher("/views/myPage/payment.jsp")
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
