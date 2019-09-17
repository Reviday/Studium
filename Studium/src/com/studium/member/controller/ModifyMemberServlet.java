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
 * Servlet implementation class MypageServlet
 */
@WebServlet(name="ModifyMemberServlet", urlPatterns="/myPage/modifyMember")

public class ModifyMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("loginMember");
		String phone=request.getParameter("phone");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String zipcode=request.getParameter("zipcode");
		String password=request.getParameter("password");
	
		// 수정한 내용
		Member m=new Member();
		m.setMemPhone(phone);
		m.setMemAddress1(zipcode);
		m.setMemAddress1(address1);
		m.setMemAddress1(address2);
		m.setMemPassword(password);
		System.out.println("우편번호"+zipcode);
		
		int result=new MemberService().modifyMember(m,id);
		String msg="";
		String loc="/";
		String view="";
		
		if(result>0) {
			//회원정보수정성공
			request.setAttribute("member", m);
			request.getRequestDispatcher("/views/myPage/myInfo.jsp")
			.forward(request,response);
			
		} else {
			//회원정보수정 실패
			msg="회원 정보 수정이 실패하였습니다.";
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
