package com.studium.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.admin.service.AdminService;
import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class AdminInqueryUpdateMemberServlet
 */
@WebServlet("/adminUpdateMember")
public class AdminInqueryUpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInqueryUpdateMemberServlet() {
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
		
		String grade = request.getParameter("memberGradeList");
		String status = request.getParameter("memberStatusList");
		String memNo = request.getParameter("memUpdateNo");
		String method = request.getParameter("method");
		int cPage;
		try {
			cPage= Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}	
		
		AdminService service = new AdminService();

		int result = service.updateMember(memNo, grade, status); 
		
		int totalData=service.selectCountMemberSearch("allGrade", "allStatus");
		String URLmapping="/adminUpdateMember"; // 패턴을 넘겨주기 위한 변수
		AdminPaginationTemplate pt=new AdminPaginationTemplate(request, totalData, URLmapping, method); // 페이징 처리 
		List<Member> list=service.selectMemberList(cPage,pt.getNumPerPage());
		
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
		request.setAttribute("elements", elements);
		
		
		request.setAttribute("list",list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.getRequestDispatcher("/views/admin/commonInquery.jsp")
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
