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
 * Servlet implementation class ShareMadangAddCommentServlet
 */
@WebServlet("/madang/shareAddComment")
public class ShareMadangAddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareMadangAddCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		new LoginCheck(request, response, 1003);
		
		ShareMadangCmt cmt=new ShareMadangCmt();
		int madangNo=Integer.parseInt(request.getParameter("madangNo"));
		int cPage=Integer.parseInt(request.getParameter("cPage"));
		cmt.setCmtMadangNo(madangNo);
		cmt.setCmtWriterUid(Integer.parseInt(request.getParameter("memberNo")));
		cmt.setCmtWriter(request.getParameter("memEmail"));
		cmt.setCmtWriterName(request.getParameter("memName"));
		cmt.setCmtContent(request.getParameter("content"));
		cmt.setCmtRegisterIp(request.getParameter("REMOTE_ADDR"));
		
		int result=new ShareMadangCmtService().insertComment(cmt);
		
		String view="";
		if(result>0) {
			view="/madang/shareMadangView?madangNo="+madangNo+"&cPage="+cPage;
		} else {
			String msg="댓글 작성에 실패하였습니다.";
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
