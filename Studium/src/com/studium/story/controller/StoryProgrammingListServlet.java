package com.studium.story.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.story.model.service.StoryService;
import com.studium.story.model.vo.Story;

/**
 * Servlet implementation class StoryList2Servlet
 */
@WebServlet("/story2")
public class StoryProgrammingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoryProgrammingListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		StoryService service =new StoryService();
    	List<Story> slist = new ArrayList<Story>();
    	slist=service.selectProgrammingList();
    	
    	
    	int totalData=service.selectTotalnumberList(); 
		request.setAttribute("totaldata",totalData);
    	int ForeignlanguagetotalData=service.selectForeignlanguagenumberList();
		request.setAttribute("Foreignlanguagetotaldata",ForeignlanguagetotalData);
		int ProgrammingtotalData=service.selectProgrammingnumberList(); 
		request.setAttribute("Programmingtotaldata",ProgrammingtotalData);
    	int PublicofficertotalData=service.selectPublicofficernumberList(); 
		request.setAttribute("Publicofficertotaldata",PublicofficertotalData);
    	int CertificatetotalData=service.selectCertificatenumberList(); 
		request.setAttribute("Certificatetotaldata",CertificatetotalData);
    	int EmploymenttotalData=service.selectEmploymentnumberList(); 
		request.setAttribute("Employmenttotaldata",EmploymenttotalData);
		request.setAttribute("slist",slist);
		
		request.getRequestDispatcher("/views/story/storyProgrammingReview.jsp")
	      .forward(request,response);  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
