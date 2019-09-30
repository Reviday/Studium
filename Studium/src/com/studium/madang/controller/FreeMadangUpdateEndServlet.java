package com.studium.madang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.FreeMadang;

import common.template.LoginCheck;

/**
 * Servlet implementation class FreeMadangUpdateEndServlet
 */
@WebServlet("/madang/free/updateEnd")
public class FreeMadangUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeMadangUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 2차 로그인 체크. 
		if(!new LoginCheck().doLoginCheck(request, response, 1003)) return;
		FreeMadang fm=new FreeMadang();
		fm.setMadangTitle(request.getParameter("subject"));
		fm.setMadangWriterUid(Integer.parseInt(request.getParameter("userUid")));
		fm.setMadangWriterEmail(request.getParameter("userEmail"));
		fm.setMadangWriterName(request.getParameter("userName"));
		fm.setMadangRegisterIp(request.getParameter("REMOTE_ADDR"));
		fm.setMadangContent(request.getParameter("smarteditor"));
		
		
		//파일 받기 및 넣기
		
		//이미지 받기 및 넣기
		
		//일단 작성 가능상태를 보기위해, 파일/이미지 기능은 제외처리하고 구동시킨다.
		//정상적으로 insert되면 해당 madangNo가 반환된다.
		int result=new FreeMadangService()//.UpdateMadang(fm);
		
		String view="/";
		if(result>0) {
			view="/madang/freeMadangView?madangNo="+madangNo+"&cPage=1";
		} else {
			String msg="게시글 수정에 실패하였습니다.";
			String loc="/madang/freeMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		request.setAttribute("choice", request.getParameter("choice"));
		request.setAttribute("choiceSub", request.getParameter("choiceSub"));
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
