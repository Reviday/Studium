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

import com.studium.admin.model.vo.PayMember;
import com.studium.admin.service.AdminService;
import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

/**
 * Servlet implementation class AdminPayMemberFinderServlet
 */
@WebServlet("/admin/paymemberFinder")
public class AdminPayMemberFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	public static boolean isEmail(String email) {
        boolean b = Pattern.matches(
            "[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+", 
            email.trim());
        if(b == true) {return true;}
        else {return false;}
    }
	
    public AdminPayMemberFinderServlet() {
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
		String method =	request.getParameter("method");
		int cPage;
		try {
			cPage= Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		if(isEmail(memberName) == true) {

			AdminService service=new AdminService();
			int totalData=service.selectCountPayMemberEmail(memberName);
			String URLmapping="/admin/paymemberFinder"; // 패턴을 넘겨주기 위한 변수
			AdminPaginationTemplate pt=new AdminPaginationTemplate(request, totalData, URLmapping, method); // 페이징 처리 
			pt.setQueryString("memberName", memberName);
			List<PayMember> list=service.selectPayMemberEmailList(cPage,pt.getNumPerPage(), memberName);
			
			request.setAttribute("list",list);
			request.setAttribute("cPage", cPage);
			request.setAttribute("pageBar", pt.getPageBar());
			request.setAttribute("numPerPage", pt.getNumPerPage());
			
			List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
			request.setAttribute("elements", elements);
			
			request.getRequestDispatcher("/views/admin/commonPayList.jsp")
					.forward(request,response);
		}else {
			try {
				 cPage= Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}

		AdminService service=new AdminService();
		int totalData=service.selectCountPayMemberName(memberName);
		String URLmapping="/admin/paymemberFinder"; // 패턴을 넘겨주기 위한 변수
		AdminPaginationTemplate pt=new AdminPaginationTemplate(request, totalData, URLmapping, method); // 페이징 처리 
		pt.setQueryString("memberName", memberName);
		List<PayMember> list=service.selectPayMemberNameList(cPage,pt.getNumPerPage(), memberName);
		
		
		request.setAttribute("list",list);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("admin");
		request.setAttribute("elements", elements);
		
		request.getRequestDispatcher("/views/admin/commonPayList.jsp")
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
