package com.studium.madang.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.StudyMadangCmtService;
import com.studium.madang.model.service.StudyMadangService;
import com.studium.madang.model.vo.StudyMadang;
import com.studium.madang.model.vo.StudyMadangCmt;
import com.studium.madang.model.vo.StudyMadangQuestion;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.CmtPaginationTemplate;

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
		smq.setQuestionContent(request.getParameter("content"));
		int no = Integer.parseInt(request.getParameter("madangNo"));
		smq.setMadangNo(no);
		smq.setQuestionWriterUid(Integer.parseInt(request.getParameter("memNo")));
		smq.setQuestionWriterEmail(request.getParameter("memEmail"));
		smq.setQuestionWriterName(request.getParameter("memName"));
		smq.setQuestionMainCategory(request.getParameter("mCategory"));
		smq.setQuestionCategory(request.getParameter("category"));
		smq.setQuestionSubCategory(request.getParameter("sCategory"));
		smq.setQuestionRegisterIp(request.getParameter("REMOTE_ADDR"));
		int cPage=Integer.parseInt(request.getParameter("cPage"));
		
		int result=new StudyMadangService().insertQuestion(smq);
		
		// View에 보여질 글을 가져온다.
		StudyMadang sm = new StudyMadangService().selectMadang(no, true);
		
		// 이전글/다음글의 no와 title을 가져온다.
		Map<String, StudyMadang> preNext = new StudyMadangService().selectPreNext(no);

		// Pagination
		StudyMadangCmtService service = new StudyMadangCmtService();
		int totalData = service.selectCountList(no); // 총 데이터 개수
		String URLmapping = "/madang/StudyMadangView"; // 패턴을 넘겨주기 위한 변수
		CmtPaginationTemplate pt = new CmtPaginationTemplate(request, totalData, URLmapping); // 페이징 처리
		List<StudyMadangCmt> cmtList = service.selectCmtList(no, pt.getcPage(), pt.getNumPerPage());
		
		// Side Menu
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		String choiceSub = request.getParameter("choiceSub");
		
		String msg="";
		String loc="";
		String view="/madang/studyMadangList";
		if (sm != null) {
			view = "/views/madang/studyMadangView.jsp";
			request.setAttribute("sm", sm);
			request.setAttribute("preNext", preNext);
			request.setAttribute("cPage", cPage);
			request.setAttribute("totalData", totalData);
			request.setAttribute("cmtPageBar", pt.getPageBar());
			request.setAttribute("cmtList", cmtList);
			request.setAttribute("show", "false");
		} else {
			msg = "게시글이 존재하지 않습니다.";
			loc = "/madang/studyMadangList";
			view = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
		request.setAttribute("choice", "공부마당");
		request.setAttribute("choiceSub", choiceSub!=null?choiceSub:"");
		request.setAttribute("elements", elements);
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
