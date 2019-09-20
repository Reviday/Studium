package com.studium.fstudy.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.mypage.model.service.MyDibsService;
import com.studium.mypage.model.vo.MyDibs;

/**
 * Servlet implementation class PstudyProductViewServlet
 */
@WebServlet("/fstudy/fstudyProduct")
public class FstudyProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudyProductViewServlet() {
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
		
		Fstudy f=new FstudyService().selectpStudyVIew(no);
		if(mNo!=0) {
			 MyDibs md=new MyDibsService().selectFstudyDibs(mNo,no); 
				request.setAttribute("fstudy", f);
				request.setAttribute("md", md); 
				request.getRequestDispatcher("/views/fstudy/studyProduct.jsp").forward(request, response);
		}else {
			request.setAttribute("fstudy", f);
			request.getRequestDispatcher("/views/fstudy/studyProduct.jsp").forward(request, response);
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
