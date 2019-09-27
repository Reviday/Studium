package com.studium.pstudy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class PstudySearchServlet
 */
@WebServlet("/pstudy/search")
public class PstudySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String area=request.getParameter("p_area");
		String day=request.getParameter("p_day");
		String category=request.getParameter("p_category");
		PstudyService service=new PstudyService();
		List<Category> listM=new CategoryService().selectTitleM();
		request.setAttribute("categoryM", listM);
		List<Pstudy>pList=new ArrayList();
		String setString="";
		if(area.equals("all")&&category.equals("all")&&day.equals("all")) {
			setString="allall";
		}
		if((!area.equals("all")) && category.equals("all") && day.equals("all")) {
			setString="nota";
		}
		if((!area.equals("all")) && (!category.equals("all")) && day.equals("all")) {
			setString="notac";
		}
		if(area.equals("all") && (!category.equals("all") && day.equals("all"))) {
			setString="notc";			
		}
		if((!area.equals("all")) && category.equals("all") && (!day.equals("all"))) {
			setString="notad";		
		}
		if(area.equals("all") && category.equals("all") && (!day.equals("all"))) {
			setString="notd";	
		}
		if(area.equals("all") && (!category.equals("all")) && (!day.equals("all"))) {
			setString="notcd";			
		}
		if((!area.equals("all")) && (!category.equals("all")) && (!day.equals("all"))) {
			setString="notacd";
		}
		int totalData=service.selectCountPstudy(); // 총 데이터 개수
		String URLmapping="/pstudy/search"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		pList=new PstudyService().searchPstudy(setString,area, day,category,pt.getcPage(),pt.getNumPerPage());
		request.setAttribute("categoryM", listM);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.setAttribute("pList", pList);
		request.setAttribute("area", area);
		request.setAttribute("day", day);
		request.setAttribute("category",category);
		request.getRequestDispatcher("/views/pstudy/studySearch.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
