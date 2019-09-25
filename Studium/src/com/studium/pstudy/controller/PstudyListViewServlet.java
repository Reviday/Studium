package com.studium.pstudy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class PstudyViewServlet
 */
@WebServlet("/pstudyListView")
public class PstudyListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PstudyService service=new PstudyService();
		
		int totalData=service.selectCountPstudy(); // 총 데이터 개수
		String URLmapping="/pstudyListView"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<Pstudy> pList=service.selectPstudy(pt.getcPage(),pt.getNumPerPage());
		List<Category> listM=new CategoryService().selectTitleM();
		request.setAttribute("categoryM", listM);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		List<Pstudy> bestList=service.bestPstudy();
		request.setAttribute("pList", pList);
		request.setAttribute("bestList",  bestList);
		request.getRequestDispatcher("/views/pstudy/pstudy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
