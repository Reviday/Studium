package com.studium.pstudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.studium.pstudy.model.service.PstudyService;

/**
 * Servlet implementation class PstudyDibsServlet
 */
@WebServlet("/pstudy/pstudyDibs")
public class PstudyDibsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyDibsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("여기오냐");
		int pNo=Integer.parseInt(request.getParameter("pNo"));
		int mNo=Integer.parseInt(request.getParameter("mNo"));
		PstudyService service=new PstudyService(); 
		System.out.println(pNo);
		System.out.println(mNo);
		int result=service.pstudyDibs(pNo,mNo);
		int count =0;
		
		System.out.println(result);
		JSONObject obj = new JSONObject();
		obj.put("result",result);
		//request.setAttribute("json", json);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);

		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
