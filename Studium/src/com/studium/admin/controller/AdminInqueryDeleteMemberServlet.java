package com.studium.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.studium.admin.service.AdminService;
import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class AdminInqueryDeleteMemberServlet
 */
@WebServlet("/adminDeleteMember")
public class AdminInqueryDeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInqueryDeleteMemberServlet() {
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
		
		String memNo = request.getParameter("memNo");
		int result=new AdminService().deleteMember(memNo);
		
		String grade = request.getParameter("grade");
		String status = request.getParameter("status");
		
		AdminService service = new AdminService();
		int totalData=service.selectCountMemberSearch(grade, status);
		String URLmapping="/adminInquerySearch"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		pt.setQueryString("gradeList", grade);
		pt.setQueryString("statusList", status);
		List<Member> list=service.selectMemberSearchList(pt.getcPage(),pt.getNumPerPage(), grade, status);
		
		JSONObject obj = new JSONObject();
		obj.put("list",list);
		obj.put("cPage", pt.getcPage());
		obj.put("pageBar", pt.getPageBar());
		obj.put("numPerPage", pt.getNumPerPage());
		obj.put("grade", grade);
		obj.put("status", status);
		System.out.println(obj);
		String a = "안받아져";
		response.setContentType("application/x-json; charset=UTF-8");
		
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
		request.setAttribute("elements", elements);
		
		response.getWriter().print(obj);
		response.getWriter().print(a);
//		request.setAttribute("list",list);
//		request.setAttribute("cPage", pt.getcPage());
//		request.setAttribute("pageBar", pt.getPageBar());
//		request.setAttribute("numPerPage", pt.getNumPerPage());
//		request.setAttribute("grade", grade);
//		request.setAttribute("status", status);
//		request.getRequestDispatcher("/views/admin/memberInquery.jsp")
//				.forward(request,response);
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
