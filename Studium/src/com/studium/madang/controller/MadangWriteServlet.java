package com.studium.madang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.LoginCheck;

/**
 * Servlet implementation class MadangWriteServlet
 */
@WebServlet("/madang/madangWrite")
public class MadangWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MadangWriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 어느 페이지의 글쓰기인지 확인하고자 받는 변수
		// 글쓰기 페이지는 하나의 서블릿으로 처리
		String locate = request.getParameter("locate");
		int code=0;
		switch(locate) {
		case "study" : code=1002; break;
		case "free" : code=1003; break;
		case "share" : code=1004; break;
		case "boast" : code=1005; break;
		case "question" : code=1006; break;
		}
		// 2차 로그인 체크. 
		if(!new LoginCheck().doLoginCheck(request, response, code)) return;
		String view = "/views/madang/madangWrite.jsp";
		
		// SideMenuElement
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		
	
		request.setAttribute("locate", locate);
		request.setAttribute("elements", elements);
		request.setAttribute("choice", request.getParameter("choice"));
		request.setAttribute("choiceSub", request.getParameter("choiceSub"));
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
