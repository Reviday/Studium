package com.studium.index.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

/**
 * Servlet implementation class IndexBestServlet
 */
@WebServlet("/indexBest")
public class IndexBestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexBestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String category=request.getParameter("locate");
		System.out.println(category);
		PstudyService service=new PstudyService();
		if(category.equals("N")) {
		List<Pstudy> bestList=service.bestPstudy();
		request.setAttribute("bestList",  bestList);
		request.getRequestDispatcher("/views/common/bestIndex.jsp")
	    .forward(request,response);   
		}else {
		List<Pstudy>categoryList=service.selectcategoryList(category);
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/views/common/bestIndex.jsp")
	    .forward(request,response);   
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
