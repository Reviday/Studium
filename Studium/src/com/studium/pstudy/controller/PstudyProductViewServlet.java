package com.studium.pstudy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.mypage.model.service.MyDibsService;
import com.studium.mypage.model.vo.MyDibs;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;
import com.studium.story.model.service.StoryService;
import com.studium.story.model.vo.Story;

/**
 * Servlet implementation class PstudyProductViewServlet
 */
@WebServlet("/pstudy/pstudyProduct")
public class PstudyProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no =Integer.parseInt(request.getParameter("pNo"));
		int mNo=Integer.parseInt(request.getParameter("mNo"));
		int totalData=new StoryService().selectTotalnumberList(); 
		List<Story> slist=new StoryService().selectPstudyStory(no);
		Pstudy p=new PstudyService().selectpStudyVIew(no);
		if(mNo!=0) {
				if(slist.size()!=0) {
			 MyDibs md=new MyDibsService().selectDibs(mNo,no); 
				request.setAttribute("pstudy", p);
				request.setAttribute("slist", slist);
				request.setAttribute("md", md); 
				request.setAttribute("totaldata",totalData);
				request.getRequestDispatcher("/views/pstudy/studyProduct.jsp").forward(request, response);
			}else {
				 MyDibs md=new MyDibsService().selectDibs(mNo,no); 
					request.setAttribute("pstudy", p);
					request.setAttribute("md", md); 
					request.setAttribute("totaldata",totalData);
					request.setAttribute("slist", slist);
					request.getRequestDispatcher("/views/pstudy/studyProduct.jsp").forward(request, response);
			}
		}else {
			if(slist.size()!=0) {
			request.setAttribute("pstudy", p);
			request.setAttribute("slist", slist);
			request.setAttribute("totaldata",totalData);
			request.getRequestDispatcher("/views/pstudy/studyProduct.jsp").forward(request, response);
			}else {
				request.setAttribute("pstudy", p);
				request.setAttribute("slist", slist);
				request.setAttribute("totaldata",totalData);
				request.getRequestDispatcher("/views/pstudy/studyProduct.jsp").forward(request, response);	
			}
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
