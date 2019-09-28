package com.studium.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.studium.admin.service.AdminService;
import com.studium.member.model.service.MemberService;
import com.studium.story.model.vo.Story;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/myPage/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String review = request.getParameter("my-review");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int pNo = Integer.parseInt(request.getParameter("no"));
		Story s=new Story();
		s.setMemNo(memNo);
		s.setpNo(pNo);
		s.setStoryContent(review);
		
		MemberService service = new MemberService();
		String memo = service.reviewUpdate(memNo, pNo);
		String memo="넘기는값";
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(memo,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
