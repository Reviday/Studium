package com.studium.madang.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.StudyMadangService;
import com.studium.madang.model.vo.StudyMadang;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class StudyMadangListServlet
 */
@WebServlet("/madang/studyMadangList")
public class StudyMadangListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudyMadangListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 검색조건 판별
		String choiceSub = request.getParameter("choiceSub");
		
		//Pagination 
		StudyMadangService service=new StudyMadangService();
		int totalData=0;
		if(choiceSub==null) totalData=service.selectCountList(); // 총 데이터 개수
		else totalData=service.selectCountList(choiceSub);
		String URLmapping="/madang/studyMadangList"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		
		List<StudyMadang> list=new ArrayList<StudyMadang>();
		if(choiceSub==null) {
			// 카테고리 분기 없이 전체 리스트
			list=service.selectMadangList(pt.getcPage(), pt.getNumPerPage()); // 리스트 받기
		} else {
			// 카테고리를 포함하여 리스트를 받아온다.
			list=service.selectMadangList(choiceSub, pt.getcPage(), pt.getNumPerPage()); // 리스트 받기
		}
		
		// SideMenuElement
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		
		request.setAttribute("list", list);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.setAttribute("elements", elements);
		request.setAttribute("choice", "공부마당");
		request.setAttribute("choiceSub", choiceSub);

		request.getRequestDispatcher("/views/madang/studyMadangList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
