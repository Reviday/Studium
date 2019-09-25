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

		String password=request.getParameter("password");

		Member m=new Member();
		m.setMemPassword(password);	
		
		System.out.println(request.getParameter("phone"));
		// 수정한 내용
		if(request.getParameter("phone").equals(null)) {
			System.out.println("여기들어옴");
			String phone=request.getParameter("phone");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			String zipcode=request.getParameter("zipcode");
			String [] inter =request.getParameterValues("inter");
			m.setMemPhone(phone);
			m.setMemZipCode(zipcode);
			m.setMemAddress1(address1);
			m.setMemAddress2(address2);
			if(inter.length==1) {
				m.setMemCategory1(inter[0]);
				m.setMemCategory2(null);
				m.setMemCategory3(null);
			}
			if(inter.length==2){
				m.setMemCategory1(inter[0]);
				m.setMemCategory2(inter[1]);
				m.setMemCategory3(null);
			}
			else{
				m.setMemCategory1(inter[0]);
				m.setMemCategory2(inter[1]);
				m.setMemCategory3(inter[2]);
			}
			
			
		}
	
		
		System.out.println("멤버객체"+m);
		
		MemberService ms=new MemberService();
		//회원정보 수정
		int result=ms.modifyMember(m, id);
		String msg="";
		String loc="/";
		String view="";
		//해당 아이디로  수정된 멤버객체 가지고옴
		m=ms.selectEmail(id, password);
		
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
