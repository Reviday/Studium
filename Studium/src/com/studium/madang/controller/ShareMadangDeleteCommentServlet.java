package com.studium.madang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.ShareMadangCmtService;
import com.studium.madang.model.vo.ShareMadangCmt;

import common.template.LoginCheck;

/**
 * Servlet implementation class ShareMadangDeleteCommentServlet
 */
@WebServlet("/madang/shareDeleteComment")
public class ShareMadangDeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareMadangDeleteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 2차 로그인 체크. 
		if(!new LoginCheck().doLoginCheck(request, response, 1004)) return;
		
		ShareMadangCmt cmt=new ShareMadangCmt();
		int madangNo=Integer.parseInt(request.getParameter("madangNo"));
		int cPage=Integer.parseInt(request.getParameter("cPage"));
		cmt.setCmtNo(Integer.parseInt(request.getParameter("cmtNo")));
		cmt.setCmtMadangNo(madangNo);
		cmt.setCmtWriterUid(Integer.parseInt(request.getParameter("memberNo")));
		
		int result=new ShareMadangCmtService().deleteComment(cmt);
		
		String view="";
		if(result>0) {
			view="/madang/shareMadangView?madangNo="+madangNo+"&cPage="+cPage;
			request.setAttribute("choice", "공유마당");
			request.setAttribute("choiceSub", request.getParameter("choiceSub"));
		} else {
			String msg="댓글 삭제에 실패하였습니다.";
			String loc="/madang/shareMadangView?madangNo="+madangNo+"&cPage="+cPage;
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
