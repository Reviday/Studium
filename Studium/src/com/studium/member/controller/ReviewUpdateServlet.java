package com.studium.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;
import com.studium.story.model.vo.Story;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/myPage/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("update서블릿");
		
		String review = request.getParameter("my-review");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int pNo = Integer.parseInt(request.getParameter("no"));
		int star = Integer.parseInt(request.getParameter("star"));
		
		MemberService service = new MemberService();
		Member memM=service.selectNo(memNo);//학생정보 가져옴
		PstudyService pService= new PstudyService();
		Pstudy p=pService.selectpStudyVIew(pNo);//스터디 정보 가져옴
		Member teacherM=service.selectNo(p.getpStudyTeacherno());//teacher정보 가져옴
		
		Story s=new Story();
		s.setMemNo(memNo);
		s.setpNo(pNo);
		s.setStoryContent(review);
		s.setStoryStar(star);
		
		//리뷰select해서 primary값 가져옴 
		Story selects = service.reviewSelect(memNo, pNo);
		//리뷰업데이트
		int result= -1;
		if(selects!=null) {
			result= service.reviewUpdate(s, selects.getStoryNo());
		}
		else {//업데이트 되는 값 없으면 insert해줌
			s.setpTitle(p.getpTitle());
			s.setStoryStudentpicture(memM.getMemPhoto());
			s.setStoryWrite(memM.getMemName());
			s.setStoryTeachername(teacherM.getMemName());
			s.setStoryTeacherpicture(teacherM.getMemPhoto());
			s.setStorySubject(p.getpCategory());
			result= service.reviewInsert(s);
			
		}
		int totalcount=0;
		int sum=0;
		int totalstar=0;
		List<Story> slist=service.starReview(pNo);
		for(int i=1; i<slist.size()+1; i++) {
			sum+=slist.get(i-1).getStoryStar();
			if(slist.size()==0) {
				totalstar=sum;
				int results=pService.updatePstudyStar(pNo,totalstar);
			}else {
				totalstar=sum/slist.size();
				int results=pService.updatePstudyStar(pNo,totalstar);
			}
		}
		
		
		String memo="넘기는값";
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(memo,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
