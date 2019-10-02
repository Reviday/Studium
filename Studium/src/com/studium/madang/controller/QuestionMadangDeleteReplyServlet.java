package com.studium.madang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.QuestionMadangCmtService;
import com.studium.madang.model.vo.QuestionMadangCmt;

import common.template.LoginCheck;

/**
 * Servlet implementation class QuestionMadangDeleteReplyServlet
 */
@WebServlet("/madang/questionDeleteReply")
public class QuestionMadangDeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionMadangDeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 2차 로그인 체크. 
		if(!new LoginCheck().doLoginCheck(request, response, 1005)) return;
		
		QuestionMadangCmt cmt=new QuestionMadangCmt();
		int madangNo=Integer.parseInt(request.getParameter("madangNo"));
		int cPage=Integer.parseInt(request.getParameter("cPage"));
		cmt.setCmtNo(Integer.parseInt(request.getParameter("cmtNo")));
		cmt.setCmtMadangNo(madangNo);
		cmt.setCmtParent(Integer.parseInt(request.getParameter("cmtParent")));
		cmt.setCmtSort(Integer.parseInt(request.getParameter("cmtSort")));
		cmt.setCmtWriterUid(Integer.parseInt(request.getParameter("memberNo")));
		
		int result=new QuestionMadangCmtService().deleteReply(cmt);
		
		String view="";
		if(result>0) {
			view="/madang/questionMadangView?madangNo="+madangNo+"&cPage="+cPage;
			request.setAttribute("choice", "질문마당");
			request.setAttribute("choiceSub", request.getParameter("choiceSub"));
		} else {
			String msg="댓글 삭제에 실패하였습니다.";
			String loc="/madang/questionMadangView?madangNo="+madangNo+"&cPage="+cPage;
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
