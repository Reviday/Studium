package com.studium.madang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.FreeMadang;

/**
 * Servlet implementation class FreeMadangListServlet
 */
@WebServlet("/madang/freeMadangList")
public class FreeMadangListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeMadangListServlet() {
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

		/***********************************
		 * 페이징 처리에 필요한 변수 
		 * 1. cPage : 현재 페이지 
		 * 2. numPerPage : 테이블(page)에 출력될 데이터의 수 
		 * 3. totalDate : 현재 총 데이터의 수 
		 * 4. totalPage : 전체 페이지 수 (나머지 올림) 
		 * ----- 페이지바를 구성하는 변수
		 * 5. pageNo : 페이지바에서 페이지 값 출력해주는 변수 
		 * 6. pageEnd : 페이지바에서 페이지값의 끝 번호 
		 * 7. pageBarSize : 페이지바에서 페이지값이 출력되는 갯수 
		 * 8. pageBar : 페이지바를 구성하는 코드를 누적시키는 변수
		 * 
		 * 페이징 처리시 계산공식
		 * 1. totalPage : (int)ceil(totalData / numPerPage) // 무조건 올림처리 
		 * 2. 시작번호 : (cPage-1)*numPerPage+1 
		 * 3. 끝번호 : cPage*numPerPage 
		 * 4. 페이지시작번호 : ((cPage-1)/pageBarSize)*pageBarSize+1;
		 ************************************/

		// 페이지 설정
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 0;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage = 15;
		}
		FreeMadangService service = new FreeMadangService();
		int totalData = service.selectCountList();
		List<FreeMadang> list = new FreeMadangService().selectMadangList(cPage, numPerPage);

		// 페이징 처리 -> 페이지바 만들기
		String pageBar = "";
		int totalPage = (int) Math.ceil((double) totalData / numPerPage);
		int pageBarSize = 10;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		// pageBar 소스코드 작성!
		if (pageNo == 1) {
			pageBar += "<sapn>[이전]</sapn>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/madang/freeMadangList?cPage=" + (pageNo - 1) + "'>[이전]</a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<sapn>" + pageNo + "</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/madang/freeMadangList?cPage=" + pageNo + "'>[" + pageNo + "]</a>";
			}
			pageNo++;
		}

		// [다음]만들기
		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/madang/freeMadangList?cPage=" + pageNo + "'>[다음]</a>";
		}

		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("freeMadangList", list);
		request.setAttribute("numPerPage", numPerPage);

		request.getRequestDispatcher("/views/madang/freeMadangList.jsp").forward(request, response);
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
