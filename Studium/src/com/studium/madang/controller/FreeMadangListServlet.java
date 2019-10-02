package com.studium.madang.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.BoastMadang;
import com.studium.madang.model.vo.FreeMadang;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.PaginationTemplate;

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
		
		//Pagination 
		FreeMadangService service=new FreeMadangService();
		int totalData=service.selectCountList(); // 총 데이터 개수
		String URLmapping="/madang/freeMadangList"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<FreeMadang> list=service.selectMadangList(pt.getcPage(), pt.getNumPerPage()); // 리스트 받기
		
		//SideMenuElement
		List<SideMenuElement> elements=new SideMenuElementService().selectElements("madang");
		
		// 해당 리스트에 맞는 회원 정보를 가져온다. 
		List<Member> memList=new ArrayList<Member>();
		for(FreeMadang fm : list) {
			fm.getMadangWriterUid();
			
			// 해당 글의 유저 정보를 가져온다.
			Member writer=null;
			if(fm!=null) {
				writer = new MemberService().selectNo(fm.getMadangWriterUid());
			}
			
			//리스트에 추가
			memList.add(writer);
		}
		
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.setAttribute("freeMadangList", list);
		request.setAttribute("memList", memList);
		request.setAttribute("elements", elements);
		request.setAttribute("choice", "자유마당");

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
