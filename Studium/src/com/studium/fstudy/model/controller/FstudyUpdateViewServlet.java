package com.studium.fstudy.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;
import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;

/**
 * Servlet implementation class PstudyUpdateViewServlet
 */
@WebServlet("/fstudy/fstudyUpdate")
public class FstudyUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudyUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("fNo"));
		Fstudy f=new FstudyService().selectpStudyVIew(no);
		List<Category> listM=new CategoryService().selectTitleM();
		request.setAttribute("categoryM", listM);
		request.setAttribute("fstudy", f);
		request.getRequestDispatcher("/views/fstudy/studyUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
