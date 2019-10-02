package com.studium.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.MyMemo;

/**
 * Servlet implementation class MyMemoNewServlet
 */
@WebServlet("/myPage/myMemoNew")
public class MyMemoNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMemoNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//마이메모 조회

		int memberNo=Integer.parseInt(request.getParameter("no"));
		int frontId=Integer.parseInt(request.getParameter("id"));
		int left=Integer.parseInt(request.getParameter("left"));
		int top=Integer.parseInt(request.getParameter("top"));

		MemberService ms= new MemberService();
		MyMemo memo=new MyMemo();
		memo.setMemNo(memberNo);
		memo.setMemoFrontId(frontId);
		memo.setMemoLeft(left);
		memo.setMemoTop(top);
		//메모 만들기 
		int result=ms.insertMyMemo(memo);

		//방금 만든 메모의 primary값 조회해옴 
		int primary=ms.selectPrimaryKey(memberNo, frontId, left, top);
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(primary,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
