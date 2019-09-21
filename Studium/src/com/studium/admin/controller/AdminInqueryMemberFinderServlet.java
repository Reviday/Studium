package com.studium.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

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
 * Servlet implementation class AdminInqueryMemberFinderServlet
 */
@WebServlet("/admin/memberFinder")
public class AdminInqueryMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static boolean isEmail(String email) {
        boolean b = Pattern.matches(
            "[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", 
            email.trim());
        if(b == true) {return true;}
        else {return false;}
    }
	
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInqueryMemberFinderServlet() {
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
		
		String memberName = request.getParameter("memberName");
		
		if(isEmail(memberName) == true) {
			AdminService service=new AdminService();
			int totalData=service.selectCountMemberEmail(memberName);
			String URLmapping="/admin/memberFinder"; // 패턴을 넘겨주기 위한 변수
			PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
			List<Member> list=service.selectMemberEmailList(pt.getcPage(),pt.getNumPerPage(), memberName);
			
			
			request.setAttribute("list",list);
			request.setAttribute("cPage", pt.getcPage());
			request.setAttribute("pageBar", pt.getPageBar());
			request.setAttribute("numPerPage", pt.getNumPerPage());
			
			List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
			request.setAttribute("elements", elements);
			
			request.getRequestDispatcher("/views/admin/memberInquery.jsp")
					.forward(request,response);
		}else {
		
		AdminService service=new AdminService();
		int totalData=service.selectCountMemberName(memberName);
		String URLmapping="/admin/memberFinder"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<Member> list=service.selectMemberNameList(pt.getcPage(),pt.getNumPerPage(), memberName);
		
		
		request.setAttribute("list",list);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
		request.setAttribute("elements", elements);
		
		request.getRequestDispatcher("/views/admin/memberInquery.jsp")
				.forward(request,response);
			}
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


