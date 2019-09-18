package com.studium.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.admin.model.vo.QandA;
import com.studium.admin.service.AdminService;
import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.FreeMadang;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class AdminQandAListServlet
 */
@WebServlet("/AdminQandAList")
public class AdminQandAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQandAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원에 대한 페이지 설정
				
		AdminService service=new AdminService();
		int totalData=service.selectCountQandA();
		String URLmapping="/AdminQandAList"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<QandA> list=service.selectQandAList(pt.getcPage(),pt.getNumPerPage());
		request.setAttribute("list",list);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		
		
		request.getRequestDispatcher("/views/admin/Q&AList.jsp")
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
