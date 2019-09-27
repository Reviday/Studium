package com.studium.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.member.model.vo.MemberLoginLog;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// email과 password 받아오기
		String email=request.getParameter("userEmail");
		String password=request.getParameter("password");
	
		// Member 객체 확인 후 받아오기
		Member m=new MemberService().selectEmail(email, password);	
		String msg="";
		String loc="/";
		String view="";
		
		MemberLoginLog mll=new MemberLoginLog();
		mll.setMllSuccess(m!=null?'Y':'N'); // m이 null이 아니면 로그인 성공
		mll.setMllMemNo(m!=null?m.getMemNo():null); // m의 uid를 가져온다.
		mll.setMllUserEmail(email); // 사용자가 입력한 이메일
		mll.setMllIp(request.getParameter("REMOTE_ADDR")); // 로그인 시도한 ip
		mll.setMllReason(m!=null?"로그인 성공":"아이디/패스워드 불일치"); // 로그인 성공/실패시 이유(더 다양한 사유도 가능할 듯하다)
		mll.setMllUseragent(request.getHeader("User-Agent")); // 로그인한 브라우저의 user agent
		mll.setMllUrl(String.valueOf(request.getRequestURL())); // 로그인한 페이지 주소
		mll.setMllReferer(request.getHeader("referer"));// 이전 페이지 주소
		
		
		//로그인 로그를 남긴다. (리턴값은 필요없음.)
		new MemberService().insertMll(mll);
		
		if(m!=null) {
			//로그인 성공
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);
			session.setMaxInactiveInterval(3600); // 한 시간 세션 유지
			response.sendRedirect(request.getHeader("referer")); // 로그인 후 현재 페이지 유지
		} else {
			//로그인 실패
			msg="아이디나 패스워드가 일치하지 않습니다";
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
