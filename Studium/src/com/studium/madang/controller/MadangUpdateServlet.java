package com.studium.madang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.BoastMadangService;
import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.service.ShareMadangService;
import com.studium.madang.model.vo.BoastMadang;
import com.studium.madang.model.vo.FreeMadang;
import com.studium.madang.model.vo.ShareMadang;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.LoginCheck;

/**
 * Servlet implementation class MadangUpdateServlet
 */
@WebServlet("/madang/madangUpdate")
public class MadangUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MadangUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 어느 페이지의 글쓰기인지 확인하고자 받는 변수
		// 글쓰기 페이지는 하나의 서블릿으로 처리
		String locate = request.getParameter("locate");
		int madangNo = Integer.parseInt(request.getParameter("madangNo"));
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
		String view = "/views/madang/madangUpdate.jsp";
		
		// SideMenuElement
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		switch(locate) {
		case "free" :
			FreeMadang fm=new FreeMadangService().selectMadang(madangNo, false);
			request.setAttribute("madang", fm);
			break;
		case "share" : 
			ShareMadang sm=new ShareMadangService().selectMadang(madangNo, false);
			request.setAttribute("madang", sm);
			break;
		case "boast" : 
			BoastMadang bm=new BoastMadangService().selectMadang(madangNo, false);
			request.setAttribute("madang", bm);
			break;
		case "question" : code=1006; break;
		}
		
		request.setAttribute("locate", locate);
		request.setAttribute("elements", elements);
		request.setAttribute("choice", request.getParameter("choice"));
		request.setAttribute("choiceSub", request.getParameter("choiceSub"));
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
