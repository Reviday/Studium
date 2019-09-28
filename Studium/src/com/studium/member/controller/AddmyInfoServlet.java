package com.studium.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;

import common.template.LoginCheck;


/**
 * Servlet implementation class AddmyInfo
 */
@WebServlet("/myPage/addMyInfo")
public class AddmyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddmyInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!new LoginCheck().doLoginCheck(request, response, 1000)) return;
		
		//중분류
		List<Category> listM=new CategoryService().selectTitleM();
		//대분류
		List<Category> listB=new CategoryService().selectTitleB();

		System.out.println(listM);
		System.out.println(listB);
		
		request.setAttribute("categoryM", listM);
		request.setAttribute("categoryB", listB);
		request.getRequestDispatcher("/views/myPage/addMyInfo.jsp")
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
