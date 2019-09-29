package com.studium.madang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.vo.StudyMadangQuestion;

/**
 * Servlet implementation class StudyMadangInsertQuestionServlet
 */
@WebServlet("/madang/insertQuestion")
public class StudyMadangInsertQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyMadangInsertQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		StudyMadangQuestion smq=new StudyMadangQuestion();
		smq.setQuestionContent(request.getParameter("id_content"));
		smq.setMadangNo(Integer.parseInt(request.getParameter("madangNo")));
		smq.setQuestionWriterUid(Integer.parseInt(request.getParameter("memNo")));
		smq.setQuestionWriterEmail(request.getParameter("memEmail"));
		smq.setQuestionWriterName(request.getParameter("memName"));
		smq.setQuestionRegisterIp(request.getParameter("REMOTE_ADDR"));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
