package com.studium.madang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.studium.madang.model.service.StudyMadangService;
import com.studium.madang.model.vo.StudyMadang;

/**
 * Servlet implementation class StudyMadangLikeUpServlet
 */
@WebServlet("/madang/studyMadangLikeUp")
public class StudyMadangLikeUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyMadangLikeUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int madangNo = Integer.parseInt(request.getParameter("madangNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String REMOTE_ADDR=request.getParameter("REMOTE_ADDR");
		
		int result=new StudyMadangService().insertLike(madangNo, memNo, REMOTE_ADDR);
		
		String msg="";
		StudyMadang sm= new StudyMadang();
		JSONObject obj = new JSONObject();
		if(result<0) { // 이미 추천 하였음.
			msg="이미 추천하였습니다.";
			obj.put("msg",msg);
			obj.put("result", "fail");
		} else if(result>0) { // 추천 성공
			msg="추천하였습니다!";
			// 추천에 성공하였으니, 해당하는 값을 불러와서 페이지에 띄워주어야한다.
			sm=new StudyMadangService().selectMadang(madangNo, true);
			obj.put("msg",msg);
			obj.put("result", "success");
			obj.put("madang", sm);
		} else {
			msg="추천에 실패하였습니다. 다시 시도해주시기 바랍니다.";
			obj.put("msg",msg);
			obj.put("result", "error");
		}
		
		response.setContentType("application/x-json; charset=UTF-8");
		new Gson().toJson(obj,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
