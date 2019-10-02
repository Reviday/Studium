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

import com.studium.madang.model.service.QuestionMadangCmtService;
import com.studium.madang.model.service.QuestionMadangService;
import com.studium.madang.model.vo.QuestionMadang;
import com.studium.madang.model.vo.QuestionMadangCmt;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.CmtPaginationTemplate;
import common.template.LoginCheck;

/**
 * Servlet implementation class QuestionMadangViewServlet
 */
@WebServlet("/madang/questionMadangView")
public class QuestionMadangViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionMadangViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("madangNo"));
		int cPage = Integer.parseInt(request.getParameter("cPage"));

		// 쿠키값 확인하기
		Cookie[] cookies = request.getCookies();
		String madangCookieVal = "";
		boolean hasRead = false; // 읽었는지 안읽었는지 구분하는 기준

		if (cookies != null) {
			for (Cookie c : cookies) {
				String name = c.getName(); // 키 값
				String value = c.getValue(); // value
				if ("questionMadangCookie".equals(name)) {
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
			Cookie c = new Cookie("questionMadangCookie", madangCookieVal + "|" + no + "|");
			c.setMaxAge(-1); // 브라우저가 close 되거나 logout했을 때
			response.addCookie(c);
		}

		// View에 보여질 글을 가져온다.
		QuestionMadang qm = new QuestionMadangService().selectMadang(no, hasRead);
		// 이전글/다음글의 no와 title을 가져온다.
		Map<String, QuestionMadang> preNext = new QuestionMadangService().selectPreNext(no);

		// Pagination
		QuestionMadangCmtService service = new QuestionMadangCmtService();
		int totalData = service.selectCountList(no); // 총 데이터 개수
		String URLmapping = "/madang/questionMadangView"; // 패턴을 넘겨주기 위한 변수
		CmtPaginationTemplate pt = new CmtPaginationTemplate(request, totalData, URLmapping); // 페이징 처리
		List<QuestionMadangCmt> cmtList = service.selectCmtList(no, pt.getcPage(), pt.getNumPerPage());
		
		// Side Menu
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		String choiceSub = request.getParameter("choiceSub");
		
		String msg="";
		String loc="";
		String view="";
		if (qm != null) {
			view = "/views/madang/questionMadangView.jsp";
			request.setAttribute("qm", qm);
			request.setAttribute("preNext", preNext);
			request.setAttribute("cPage", cPage);
			request.setAttribute("totalData", totalData);
			request.setAttribute("cmtPageBar", pt.getPageBar());
			request.setAttribute("cmtList", cmtList);
		} else {
			msg = "게시글이 존재하지 않습니다.";
			loc = "/madang/questionMadangList";
			view = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
		request.setAttribute("choice", "질문마당");
		request.setAttribute("choiceSub", choiceSub);
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
