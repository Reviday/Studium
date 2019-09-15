package com.studium.madang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.FreeMadangService;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class FreeMadangListServlet
 */
@WebServlet("/madang/freeMadangList")
public class FreeMadangListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeMadangListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		FreeMadangService serivce=new FreeMadangService();

		PaginationTemplate pt=new PaginationTemplate(
						request.getAttribute("cPage"),
						request.getAttribute("numPerPage"),
						serivce.selectCountList()
				);
		
		
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("freeMadangList", serivce.selectMadangList(pt.getcPage(), pt.getNumPerPage()));
		request.setAttribute("numPerPage", pt.getNumPerPage());

		request.getRequestDispatcher("/views/madang/freeMadangList.jsp").forward(request, response);
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
