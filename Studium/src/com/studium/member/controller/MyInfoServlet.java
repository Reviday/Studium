package com.studium.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet(name="MyInfoServlet", urlPatterns="/myPage/myInfo")

public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("loginMember");
		String password=request.getParameter("password");
		System.out.println(email+"email, password"+password);
	
		// Member 객체 확인 후 받아오기
		Member m=new MemberService().selectEmail(email, password);	
		String msg="";
		String loc="/";
		String view="";
		
		if(m!=null) {
			//비밀번호 확인 성공
			//중분류
			List<Category> listM=new CategoryService().selectTitleM();
			//대분류
			List<Category> listB=new CategoryService().selectTitleB();
			
			request.setAttribute("categoryB", listB);
			request.setAttribute("categoryM", listM);
			request.setAttribute("member", m);
			request.getRequestDispatcher("/views/myPage/myInfo.jsp")
			.forward(request,response);
			
		} else {
			//비밀번호 틀렸을 때
			msg="패스워드가 일치하지 않습니다";
			view="/views/common/msg.jsp";
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
