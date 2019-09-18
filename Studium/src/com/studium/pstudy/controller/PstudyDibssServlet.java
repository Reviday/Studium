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
 * Servlet implementation class PstudyDibssServlet
 */
@WebServlet("/pstudy/pstudyDibss")
public class PstudyDibssServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyDibssServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		찜하기 서블릿
		int pNo=Integer.parseInt(request.getParameter("pNo"));
		int mNo=Integer.parseInt(request.getParameter("mNo"));
		String  A= request.getParameter("A"); //새로운 값 넣어서 다른값이면 추가 0이면 삭제
		PstudyService service=new PstudyService(); 
		JSONObject obj = new JSONObject();
		if(A.equals("0")){
			// 찜하기 풀기 쿼리
			System.out.println(A+"풀기되나");
			int result=service.pstudyDibsDelete(pNo,mNo);
			String a="0";
			System.out.println(A+"찜하기 풀기");
			obj.put("result",a);
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(A);
			

		}else{
			// 찜하기 쿼리
		
		int result=service.pstudyDibs(pNo,mNo);
		
		System.out.println(result+"짐하기쿼리");
		String b="1";
		obj.put("result",b);
		//request.setAttribute("json", json);
		System.out.println(obj+"찜하기 ");
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(A);
		
		
		}
	
		
		

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
