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
import common.template.LoginCheck;
import common.template.PaginationTemplate;

/**
 * Servlet implementation class StudyMadangViewServlet
 */
@WebServlet("/madang/studyMadangView")
public class StudyMadangViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyMadangViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 공부마당의 게시글은 모두가 볼 수 있다.
		int no = Integer.parseInt(request.getParameter("madangNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));
		String show = request.getParameter("show");
			
		// 쿠키값 확인하기
		Cookie[] cookies = request.getCookies();
		String madangCookieVal = "";
		boolean hasRead = false; // 읽었는지 안읽었는지 구분하는 기준

		if (cookies != null) {
			for (Cookie c : cookies) {
				String name = c.getName(); // 키 값
				String value = c.getValue(); // value
				if ("studyMadangCookie".equals(name)) {
					madangCookieVal = value; // 이전 값 보관
					if (value.contains("|" + no + "|")) {
						hasRead = true;
						break;
					}
				}
			}
		}

		// 안 읽었을 때 조회수를 추가하고
		// cookie에 현재 boardNo 기록
		if (!hasRead) {
			Cookie c = new Cookie("studyMadangCookie", madangCookieVal + "|" + no + "|");
			c.setMaxAge(-1); // 브라우저가 close 되거나 logout했을 때
			response.addCookie(c);
		}

		// View에 보여질 글을 가져온다.
		StudyMadangService service=new StudyMadangService();
		StudyMadang sm =service.selectMadang(no, hasRead);
		
		// 해당 글에 달려있는 풀이들을 페이지네이션 처리하여 가져온다.
		int totalData=service.selectCountList(); // 총 데이터 개수
		String URLmapping="/madang/studyMadangView"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<StudyMadangQuestion> qList=service.selectQuestionList(no, pt.getcPage(), pt.getNumPerPage());
		
		// 이전글/다음글의 no와 title을 가져온다.
		Map<String, StudyMadang> preNext = service.selectPreNext(no);

		// Cmt Pagination
		StudyMadangCmtService cmtService = new StudyMadangCmtService();
		int cmtTotalData = cmtService.selectCountList(no); // 총 데이터 개수
		String cmtURLmapping = "/madang/StudyMadangView"; // 패턴을 넘겨주기 위한 변수
		CmtPaginationTemplate cpt = new CmtPaginationTemplate(request, cmtTotalData, cmtURLmapping); // 페이징 처리
		List<StudyMadangCmt> cmtList = cmtService.selectCmtList(no, cpt.getcPage(), cpt.getNumPerPage());
		
		// Side Menu
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		String choiceSub = request.getParameter("choiceSub");
		
		String msg="";
		String loc="";
		String view="/madang/studyMadangList";
		if (sm != null) {
			view = "/views/madang/studyMadangView.jsp";
			if(show!=null&&show.equals("true")) {
				view+="#answer-filter-area";
			}
			request.setAttribute("sm", sm);
			request.setAttribute("preNext", preNext);
			request.setAttribute("cPage", cPage);
			request.setAttribute("totalData", totalData);
			request.setAttribute("cmtPageBar", cpt.getPageBar());
			request.setAttribute("cmtList", cmtList);
			request.setAttribute("qList", qList);
			request.setAttribute("show", show!=null?show:"false");
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
