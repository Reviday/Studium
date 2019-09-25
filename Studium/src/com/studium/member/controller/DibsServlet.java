package com.studium.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.category.model.service.CategoryService;
import com.studium.category.model.vo.Category;
import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.mypage.model.service.MyDibsService;
import com.studium.mypage.model.vo.MyDibs;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

import common.template.PaginationTemplate;

/**
 * Servlet implementation class DibsServlet
 */
@WebServlet("/myPage/dibs")
public class DibsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DibsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		Member m=new MemberService().selectNo(memberNo);
		MyDibsService service=new MyDibsService();
		int totalData=service.selectCountDibs(memberNo); // 총 데이터 개수
		String URLmapping="/myPage/dibs"; // 패턴을 넘겨주기 위한 변수
		PaginationTemplate pt=new PaginationTemplate(request, totalData, URLmapping); // 페이징 처리 
		List<MyDibs> mydibs=service.selectMyDibs(memberNo,pt.getcPage(),pt.getNumPerPage());
		Pstudy p = new Pstudy();
		List<Pstudy> plist=new PstudyService().selectMypstudy();
		List<Fstudy> flist=new FstudyService().selectMyfstudy();
		List<Pstudy> myplist= new ArrayList();
		List<Fstudy> myflist= new ArrayList();
		for(MyDibs my : mydibs) {
			for(Pstudy pl : plist) {
				if(my.getpNo()==pl.getpNo()) {
					myplist.add(pl);
					
				}
			}
		}
		for(MyDibs my : mydibs) {
			for(Fstudy fl : flist) {
				if(my.getfNo()==fl.getfNo()) {
					myflist.add(fl);
					
				}
			}
		}
		request.setAttribute("myplist", myplist);
		request.setAttribute("myflist", myflist);
		List<Category> listM=new CategoryService().selectTitleM();
		request.setAttribute("categoryM", listM);
		request.setAttribute("cPage", pt.getcPage());
		request.setAttribute("pageBar", pt.getPageBar());
		request.setAttribute("numPerPage", pt.getNumPerPage());
		request.setAttribute("member", m);
		request.setAttribute("mydibs", mydibs);
		request.getRequestDispatcher("/views/myPage/dibs.jsp")
		.forward(request,response);	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
