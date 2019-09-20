package com.studium.fstudy.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;

/**
 * Servlet implementation class PstudyViewServlet
 */
@WebServlet("/fstudyListView")
public class FstudyListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudyListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FstudyService service=new FstudyService();
		List<Fstudy> fList=service.selectFstudy();
		List<Fstudy> bestList=service.bestFstudy();
		request.setAttribute("fList", fList);
		request.setAttribute("bestList",  bestList);
		request.getRequestDispatcher("/views/fstudy/fstudy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
