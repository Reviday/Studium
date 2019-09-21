package com.studium.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.admin.service.AdminService;
import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class AdminInqueryMemberSearchServlet
 */
@WebServlet("/adminInquerySearch")
public class AdminInqueryMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInqueryMemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String grade = request.getParameter("gradeList");
		String status = request.getParameter("statusList");
		
		AdminService service=new AdminService();
		int totalData=service.selectCountMemberSearch(grade, status);
		String URLmapping="/adminInquerySearch"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		pt.setQueryString("gradeList", grade);
		pt.setQueryString("statusList", status);
		List<Member> list=service.selectMemberSearchList(pt.getcPage(),pt.getNumPerPage(), grade, status);
		
		
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
		request.setAttribute("elements", elements);
		
		request.setAttribute("list",list);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.setAttribute("grade", grade);
		request.setAttribute("status", status);
		request.getRequestDispatcher("/views/admin/memberInquery.jsp")
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
