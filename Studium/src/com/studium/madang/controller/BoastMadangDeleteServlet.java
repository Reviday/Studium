package com.studium.madang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.BoastMadangService;
import com.studium.madang.model.vo.BoastMadang;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.LoginCheck;

/**
 * Servlet implementation class BoastMadangDeleteServlet
 */
@WebServlet("/madang/boastMadangDelete")
public class BoastMadangDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoastMadangDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
if(!new LoginCheck().doLoginCheck(request, response, 1003)) return;
		
		BoastMadang bm=new BoastMadang();
		System.out.println(request.getParameter("madangNo"));
		bm.setMadangNo(Integer.parseInt(request.getParameter("madangNo")));
		bm.setMadangWriterUid(Integer.parseInt(request.getParameter("memNo")));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		
		// 
		int result=new BoastMadangService().deleteMadang(bm);
		
		// SideMenuElement
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		
		request.setAttribute("elements", elements);
		request.setAttribute("cPage", cPage);
		String view="/";
		if(result>0) {
			view="/madang/boastMadangList?cPage="+cPage;
		} else if(result<0) {
			String msg="권한이 없습니다.";
			String loc="/madang/boastMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		} else {
			String msg="게시글 삭제에 실패하였습니다.";
			String loc="/madang/boastMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
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
