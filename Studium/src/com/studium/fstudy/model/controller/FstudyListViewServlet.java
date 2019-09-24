package com.studium.fstudy.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.FreeMadang;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class PstudyViewServlet
 */
@WebServlet("/fstudyListView")
public class FstudyListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudyListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FstudyService service=new FstudyService();

		//Pagination 
		int totalData=service.selectCountFstudy(); // 총 데이터 개수
		String URLmapping="/fstudyListView"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<Fstudy> fList=service.selectFstudy(pt.getcPage(),pt.getNumPerPage());
		
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		
		List<Fstudy> bestList=service.bestFstudy();
		request.setAttribute("fList", fList);
		request.setAttribute("bestList",  bestList);
		request.getRequestDispatcher("/views/fstudy/fstudy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
