package com.studium.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.studium.member.model.service.MemberService;
import com.studium.story.model.vo.Story;

/**
 * Servlet implementation class selectReview
 */
@WebServlet("/myPage/reviewSelect")
public class ReviewSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		//유료스터디만 후기 받음 
		int pNo = Integer.parseInt(request.getParameter("pNo"));//스터디넘버
		
		System.out.println(memNo);
		System.out.println(pNo);
		MemberService service = new MemberService();
		Story story = service.reviewSelect(memNo, pNo);
		
		String memo="";
		//스터디 후기 값 없으면 공백넣음
		if(story!=null) {
			memo=story.getStoryContent();
		}
		else {
			memo="";
		}
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
