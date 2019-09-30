package com.studium.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.mypage.model.service.LeaderAddService;
import com.studium.mypage.model.vo.LeaderAdd;

/**
 * Servlet implementation class AddLeaderFormServlet
 */
@WebServlet("/insertLeaderForm")
public class AddLeaderFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLeaderFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String area=request.getParameter("area");
		String type=request.getParameter("leaderType");
		String inter =request.getParameter("inter");
		String message=request.getParameter("message");
		
		LeaderAdd l= new LeaderAdd();
		l.setlName(name);
		l.setlGender(gender);
		l.setlEmail(email);
		l.setlPhone(phone);
		l.setlArea(area);
		l.setlType(type);
		l.setlCategory1(inter);
		l.setlCategory2(null);
		l.setlCategory3(null);
		l.setlMessage(message);
		LeaderAddService service=new LeaderAddService();
		int result=service.addLeader(l);
		String msg;
		String view;
		String loc;
		if(result>0) {
			//신청 성공
			msg="리더 신청이 성공하였습니다.";
			view="/views/common/msg.jsp";
			loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
			
		} else {
			//신청 실패
			msg="리더 신청이 실패하였습니다.";
			view="/views/common/msg.jsp";
			loc="/views/Q&A/leaderIntro.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
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
