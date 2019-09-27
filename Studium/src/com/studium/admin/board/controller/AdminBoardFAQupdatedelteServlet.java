package com.studium.admin.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.admin.model.vo.FAQ;
import com.studium.admin.service.AdminBoardService;
import com.studium.member.model.vo.Member;

/**
 * Servlet implementation class AdminBoardFAQupdatedelteServlet
 */
@WebServlet("/updatedelete")
public class AdminBoardFAQupdatedelteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardFAQupdatedelteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null && loginMember.getMemCode() == 'M') {
			String faqNo = request.getParameter("faqNo");
			
			AdminBoardService service = new AdminBoardService();
			
			FAQ f = service.selectFAQdeleteupdateList(faqNo);
			
			request.setAttribute("faq", f);
			
			request.getRequestDispatcher("/views/adminBoard/updatedeleteFAQ.jsp").forward(request, response);

		}else {
			String msg = "로그인이 필요합니다.";
			String loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
