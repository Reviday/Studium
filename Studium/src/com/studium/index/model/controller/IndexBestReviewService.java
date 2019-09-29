package com.studium.index.model.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.index.model.service.IndexService;
import com.studium.mypage.model.vo.MyDibs;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;
import com.studium.story.model.vo.Story;

/**
 * Servlet implementation class IndexBestReviewService
 */
@WebServlet("/indexreview")
public class IndexBestReviewService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexBestReviewService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IndexService serivce = new IndexService();
		List<Story> slist=serivce.selectReview();
		List<Pstudy> plist=new PstudyService().selectMypstudy();
		List<Pstudy> myplist= new ArrayList();
		for(Story s : slist) {
			for(Pstudy pl : plist) {
				if(s.getpNo()==pl.getpNo()) {
					myplist.add(pl);
				}
			}
		}
		request.setAttribute("myplist", myplist);
		request.setAttribute("slist", slist);
		request.getRequestDispatcher("/views/common/bestreivew.jsp")
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
