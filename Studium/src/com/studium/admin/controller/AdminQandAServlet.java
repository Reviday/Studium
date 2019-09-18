package com.studium.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.admin.model.vo.QandA;
import com.studium.admin.service.AdminService;

/**
 * Servlet implementation class AdminQandAServlet
 */
@WebServlet("/qandA")
public class AdminQandAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQandAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		
		AdminService service = new AdminService();
		int result = service.insertQandA(content, email);
		
		String loc="";
		if(result>0) {
			loc="/views/Q&A/Q&A.jsp";
		}else {
			loc="/views/Q&A/Q&A.jsp";
		}
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/Q&A/Q&A.jsp")
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
