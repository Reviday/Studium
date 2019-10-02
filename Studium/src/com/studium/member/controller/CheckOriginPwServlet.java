package com.studium.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;

/**
 * Servlet implementation class CheckOriginPwServlet
 */
@WebServlet(name="CheckOriginPwServlet", urlPatterns="/myPage/checkOriginPw")
public class CheckOriginPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOriginPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int no=Integer.parseInt(request.getParameter("no"));
		String pwd= request.getParameter("password");
		System.out.println(no+pwd);
		MemberService ms= new MemberService();
		Member m=ms.selectNo(no);
		boolean flag=false;
		if(pwd.equals(m.getMemPassword())) {
			flag=false;
			System.out.println("flag="+flag);
		}else {
			flag=true;
		}
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(flag,response.getWriter());
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
