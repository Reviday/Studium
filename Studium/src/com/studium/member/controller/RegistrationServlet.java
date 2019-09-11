package com.studium.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet(name="RegisterServlet", urlPatterns="/registration")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=(String)request.getParameter("name");
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("pwd");
		
		Member m=new Member(email, password, name);
		int result=new MemberService().insertMember(m);
		String msg="";
		String loc="/";
		String path="/views/common/msg.jsp";
		
		if(result>0) {
			msg="스터디움의 회원이 되신 것을 환영합니다!/이제 로그인이 가능합니다!";
//			msg="스터디움의 회원이 되신 것을 환영합니다!'+'\n'+'이제 로그인이 가능합니다!";
		} else if(result<0) {
			msg="이미 회원가입된 이메일 입니다.";
		} else {
			msg="회원가입에 실패하였습니다. 다시 시도해주시기 바랍니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
