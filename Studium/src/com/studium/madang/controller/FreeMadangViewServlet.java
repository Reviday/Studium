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

import com.studium.madang.model.service.FreeMadangCmtService;
import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.FreeMadang;
import com.studium.madang.model.vo.FreeMadangCmt;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.CmtPaginationTemplate;
import common.template.LoginCheck;
import common.template.PaginationTemplate;

/**
 * Servlet implementation class FreeMadangViewServlet
 */
@WebServlet("/madang/freeMadangView")
public class FreeMadangViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeMadangViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 자유마당이므로 모든 회원,비회원에게 열람권이 부여된다.
		// 때문에 파라미터로 받을 인수는 글번호와 cPage 뿐이다.
		int no=Integer.parseInt(request.getParameter("madangNo"));
		int cPage=Integer.parseInt(request.getParameter("cPage"));
		
		//쿠키값 확인하기
		Cookie[] cookies=request.getCookies();
		String madangCookieVal="";
		boolean hasRead=false; //읽었는지 안읽었는지 구분하는 기준
		
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name=c.getName(); // 키 값
				String value=c.getValue(); // value
				if("freeMadangCookie".equals(name)) {
					madangCookieVal=value; //이전 값 보관
					if(value.contains("|"+no+"|")) {
						hasRead=true;
						break;
					}
				}
			}
		}
		
		//안 읽었을 때 조회수를 추가하고
		//cookie에 현재 boardNo 기록
		if(!hasRead) {
			Cookie c=new Cookie("freeMadangCookie", madangCookieVal+"|"+no+"|");
			c.setMaxAge(-1); // 브라우저가 close 되거나 logout했을 때
			response.addCookie(c);
		}
		
		// View에 보여질 글을 가져온다.
		FreeMadang fm=new FreeMadangService().selectMadang(no, hasRead);
		// 이전글/다음글의 no와 title을 가져온다.
		Map<String, FreeMadang> preNext=new FreeMadangService().selectPreNext(no);
		
		//Pagination 
		FreeMadangCmtService service=new FreeMadangCmtService();
		int totalData=service.selectCountList(no); // 총 데이터 개수
		String URLmapping="/madang/freeMadangView"; // 패턴을 넘겨주기 위한 변수
		CmtPaginationTemplate pt=new CmtPaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<FreeMadangCmt> cmtList=service.selectCmtList(no, pt.getcPage(), pt.getNumPerPage());
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("madang");
		
		String view="";
		if(fm!=null)
		{
			view="/views/madang/freeMadangView.jsp";
			request.setAttribute("fm", fm);
			request.setAttribute("preNext", preNext);
			request.setAttribute("cPage", cPage);
			request.setAttribute("totalData", totalData);
			request.setAttribute("cmtPageBar", pt.getPageBar());
			request.setAttribute("cmtList", cmtList);
		}
		else
		{
			String msg="게시글이 존재하지 않습니다.";
			String loc="/madang/freeMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		request.setAttribute("choice", "자유마당");
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
