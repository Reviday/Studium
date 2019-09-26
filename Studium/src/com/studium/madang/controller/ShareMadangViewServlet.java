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
import javax.servlet.http.HttpSession;

import com.studium.madang.model.service.FreeMadangCmtService;
import com.studium.madang.model.service.ShareMadangService;
import com.studium.madang.model.vo.FreeMadangCmt;
import com.studium.madang.model.vo.ShareMadang;
import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.CmtPaginationTemplate;

/**
 * Servlet implementation class ShareMadangViewServlet
 */
@WebServlet("/madang/shareMadangView")
public class ShareMadangViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShareMadangViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 공유마당의 게시글은 회원들만 볼 수 있다.(리스트를 보는건 회원/비회원 모두 가능.)
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		
		String view = "";
		String msg = "";
		String loc = "";
		if(m==null) {
			msg="회원만 이용가능합니다.";
			loc="/madang/shareMadangList?choiceSub"+request.getParameter("choiceSub");
			view = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response); 
			return;
		} 
		
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
				if ("shareMadangCookie".equals(name)) {
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
			Cookie c = new Cookie("shareMadangCookie", madangCookieVal + "|" + no + "|");
			c.setMaxAge(-1); // 브라우저가 close 되거나 logout했을 때
			response.addCookie(c);
		}

		// View에 보여질 글을 가져온다.
		ShareMadang sm = new ShareMadangService().selectMadang(no, hasRead);
		// 이전글/다음글의 no와 title을 가져온다.
		Map<String, ShareMadang> preNext = new ShareMadangService().selectPreNext(no);

		// Pagination
		FreeMadangCmtService service = new FreeMadangCmtService();
		int totalData = service.selectCountList(no); // 총 데이터 개수
		String URLmapping = "/madnag/shareMadangView"; // 패턴을 넘겨주기 위한 변수
		CmtPaginationTemplate pt = new CmtPaginationTemplate(request, totalData, URLmapping); // 페이징 처리
		List<FreeMadangCmt> cmtList = service.selectCmtList(no, pt.getcPage(), pt.getNumPerPage());
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");

		System.out.println("사이즈 : " + cmtList.size());
		for (FreeMadangCmt cmt : cmtList) {
			System.out.println(cmt);
		}

		if (sm != null) {
			view = "/views/madang/shareMadangView.jsp";
			request.setAttribute("sm", sm);
			request.setAttribute("preNext", preNext);
			request.setAttribute("cPage", cPage);
			request.setAttribute("totalData", totalData);
			request.setAttribute("cmtPageBar", pt.getPageBar());
			request.setAttribute("cmtList", cmtList);
		} else {
			msg = "게시글이 존재하지 않습니다.";
			loc = "/madang/shareMadangList";
			view = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
		request.setAttribute("choice", "share");
		request.setAttribute("elements", elements);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
