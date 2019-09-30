package com.studium.admin.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.admin.controller.AdminPaginationTemplate;
import com.studium.admin.service.AdminBoardService;
import com.studium.member.model.vo.Member;
import com.studium.story.model.vo.Story;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

/**
 * Servlet implementation class AdminBoardStorySearchServlet
 */
@WebServlet("/AdminStorySearch")
public class AdminBoardStorySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBoardStorySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null && loginMember.getMemCode() == 'M') {
		
		String pName = request.getParameter("memberName");
		String method = request.getParameter("method");
		int cPage;
		try {
		 cPage= Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		AdminBoardService service=new AdminBoardService();
		int totalData=service.selectCountStorySearch(pName);
		String URLmapping="/AdminStorySearch"; // 패턴을 넘겨주기 위한 변수
		AdminPaginationTemplate pt=new AdminPaginationTemplate(request, totalData, URLmapping, method); // 페이징 처리 
		List<Story> list=service.selectStorySearchList(cPage,pt.getNumPerPage(), pName);
		
		
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("adminboard");
		request.setAttribute("elements", elements);
		
		request.setAttribute("list",list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.getRequestDispatcher("/views/adminBoard/commonStory.jsp")
				.forward(request,response);
		}else {
			String msg = "로그인이 필요합니다.";
			String loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
