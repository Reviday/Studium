package com.studium.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;

import common.template.LoginCheck;

/**
 * Servlet implementation class AddmyInfoEnteredServlet
 */
@WebServlet("/myPage/addmyInfoEntered")
public class AddmyInfoEnteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddmyInfoEnteredServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿들어옴");
		if(!new LoginCheck().doLoginCheck(request, response, 1000)) return;
		int no=Integer.parseInt(request.getParameter("no"));
		//생일 멤버객체에서 sql로 해놔서 parse방법이 다름
		String birthDay=request.getParameter("birthday");
		java.sql.Date d = java.sql.Date.valueOf(birthDay);

		
		String gender=request.getParameter("gender");
		String phone=request.getParameter("phone");
		
		String zipcode=request.getParameter("zipcode");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String [] inter =request.getParameterValues("inter");
		System.out.println("배열의 길이"+inter.length);
		
		// 수정한 내용
		Member m=new Member();
		m.setMemBirth(d);
		m.setMemGender(gender.charAt(0));
		m.setMemPhone(phone);
		m.setMemZipCode(zipcode);
		m.setMemAddress1(address1);
		m.setMemAddress2(address2);
		if(inter.length<2) {
			System.out.println("여기들어감1");
			m.setMemCategory1(inter[0]);
			m.setMemCategory2(null);
			m.setMemCategory3(null);
		}
		if(inter.length==2){
			System.out.println("여기들어감2");
			m.setMemCategory1(inter[0]);
			m.setMemCategory2(inter[1]);
			m.setMemCategory3(null);
		}
		if(inter.length==3){
			System.out.println("여기들어감3");
			m.setMemCategory1(inter[0]);
			m.setMemCategory2(inter[1]);
			m.setMemCategory3(inter[2]);
		}
		
		MemberService ms=new MemberService();
		//회원정보 수정
		int result=ms.addMemberInfo(m, no);
		String msg="";
		String loc="/";
		String view="";
		//해당 아이디로  수정된 멤버객체 가지고옴
		if(result>0) {
			//회원정보수정성공
			m=ms.selectNo(no);
			System.out.println("회원수정성공");
			
			List<Category> listM=new CategoryService().selectTitleM();
			//대분류
			List<Category> listB=new CategoryService().selectTitleB();
			
			request.setAttribute("categoryB", listB);
			request.setAttribute("categoryM", listM);
			System.out.println(m);
			request.setAttribute("member", m);
			//리스트쏴주기
			request.getRequestDispatcher("/views/myPage/myInfo.jsp")
			.forward(request,response);
			
		} else {
			//회원정보수정 실패
			msg="회원 정보 수정이 실패하였습니다.";
			view="/views/common/msg.jsp";
			loc="/views/myPage/addMyInfo.jsp";
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
