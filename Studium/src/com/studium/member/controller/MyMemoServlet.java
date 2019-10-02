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
import com.studium.member.model.vo.MyMemo;

import common.template.LoginCheck;

/**
 * Servlet implementation class MyMemoServlet
 */
@WebServlet("/myPage/myMemo")
public class MyMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMemoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!new LoginCheck().doLoginCheck(request, response, 1000)) return;
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		MemberService ms= new MemberService();
		Member m=ms.selectNo(memberNo);
		//마이메모 조회해오기 
		List<MyMemo> listMemo= ms.selectMyMemo(memberNo);
		if(listMemo.size()<=0) {
		}
		request.setAttribute("member", m);
		request.setAttribute("memoList", listMemo);
		request.getRequestDispatcher("/views/myPage/myMemo.jsp")
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
