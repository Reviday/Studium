package com.studium.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.studium.admin.model.vo.PointShow;
import com.studium.admin.service.AdminService;

/**
 * Servlet implementation class AdminPointPageShowServlet
 */
@WebServlet("/PointPageShow")
public class AdminPointPageShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPointPageShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNo = request.getParameter("no");
		
		AdminService service = new AdminService();
		
		List<PointShow> pointShow = service.pointShow(memNo);
		JSONArray jarr=new JSONArray();
		for(PointShow p : pointShow) {
			JSONObject j=new JSONObject();
			j.put("no",p.getMemId());
			j.put("name", p.getMemName());
			j.put("email", p.getMemEmail());
			j.put("point", p.getPoint());
			j.put("pointstatus", p.getPointStatus());
			j.put("enrolldate", p.getPointEnrollDate());
			jarr.add(j);
		}
		
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(jarr);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
