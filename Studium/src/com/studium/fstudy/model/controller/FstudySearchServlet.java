package com.studium.fstudy.model.controller;

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
import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class PstudySearchServlet
 */
@WebServlet("/fstudy/search")
public class FstudySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudySearchServlet() {
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
		String category= request.getParameter("p_category");
		List<Category> listM=new CategoryService().selectTitleM();
		request.setAttribute("categoryM", listM);
		String URLmapping="/fstudy/search"; // 패턴을 넘겨주기 위한 변수
		int totalData=new FstudyService().selectCountSearch(area, day,category); // 총 데이터 개수
		List<Fstudy>fList=new ArrayList();
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
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		pt.setQueryString("p_area", area);
		pt.setQueryString("p_category", category);
		pt.setQueryString("p_day", day);
		fList=new FstudyService().searchFstudy(setString,area, day,category,pt.getcPage(),pt.getNumPerPage());
		request.setAttribute("categoryM", listM);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.setAttribute("fList", fList);
		request.setAttribute("area", area);
		request.setAttribute("day", day);
		request.setAttribute("category",category);
		request.setAttribute("fList", fList);
		request.setAttribute("area", area);
		request.setAttribute("day", day);
		request.setAttribute("category",category);
		request.getRequestDispatcher("/views/fstudy/studySearch.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
