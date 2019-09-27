package com.studium.madang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.service.ShareMadangService;
import com.studium.madang.model.vo.FreeMadang;
import com.studium.madang.model.vo.ShareMadang;

import common.template.LoginCheck;

/**
 * Servlet implementation class ShareMadangWriterEndServlet
 */
@WebServlet("/madang/share/writeEnd")
public class ShareMadangWriterEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareMadangWriterEndServlet() {
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
		ShareMadang sm=new ShareMadang();
		sm.setMadangTitle(request.getParameter("subject"));
		sm.setMadangWriterUid(Integer.parseInt(request.getParameter("userUid")));
		sm.setMadangWriterEmail(request.getParameter("userEmail"));
		sm.setMadangWriterName(request.getParameter("userName"));
		sm.setMadangRegisterIp(request.getParameter("REMOTE_ADDR"));
		sm.setMadangContent(request.getParameter("smarteditor"));
		
		
		//파일 받기 및 넣기
		
		//이미지 받기 및 넣기
		
		//일단 작성 가능상태를 보기위해, 파일/이미지 기능은 제외처리하고 구동시킨다.
		//정상적으로 insert되면 해당 madangNo가 반환된다.
		int madangNo=new ShareMadangService().insertMadang(sm);
		
		String view="/";
		if(madangNo>0) {
			view="/madang/shareMadangView?madangNo="+madangNo+"&cPage=1";
		} else {
			String msg="게시글 작성에 실패하였습니다.";
			String loc="/madang/shareMadangList";
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
