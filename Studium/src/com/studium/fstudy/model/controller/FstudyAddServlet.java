package com.studium.fstudy.model.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.studium.fstudy.model.service.FstudyService;
import com.studium.fstudy.model.vo.Fstudy;

import common.policy.StudiumFileRenamePolicy;

/**
 * Servlet implementation class PstudyAddServlet
 */
@WebServlet("/fstudy/studyAdd")
public class FstudyAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FstudyAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			
			request.setAttribute("msg", "공지사항 작성오류![form:enctype 관리자에게 문의하세요]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String root=getServletContext().getRealPath("/");
		 String saveDir=root+"\\upload\\fstudy"; 
		//String saveDir=root+"upload"+File.separator+"pstudy"; 
//		
//		String saveDir="C:"+File.separator+"Users"+File.separator+"User"+File.separator+"git"+File.separator+"Studium"
//				+File.separator+"Studium"+File.separator+"web"+File.separator+"upload"+File.separator+"pstudy";
		
		int maxSize=1024*1024*1024; //1GB
		  File isDir = new File(saveDir);
		    if(!isDir.isDirectory()){

		    	isDir.mkdir();

		    }
		    MultipartRequest mr =new MultipartRequest(
					request,
					saveDir,
					maxSize,
					"UTF-8",
					new StudiumFileRenamePolicy() 
					);
		
		
		 Fstudy p= new Fstudy();
		 String title=mr.getParameter("p_title");
		 String name=mr.getParameter("p_name");
		 String area=mr.getParameter("p_area");
		 String day=mr.getParameter("p_day");
		 int stupyperson=Integer.parseInt(mr.getParameter("p_stupyperson"));
		 String category=mr.getParameter("p_category");
		 String intro1=mr.getParameter("p_intro1");
		 String intro2=mr.getParameter("p_intro2");
		 String imgtitle=mr.getFilesystemName("p_imgtitle");
		 String img1=mr.getFilesystemName("p_img1");
		 String img2=mr.getFilesystemName("p_img2");
		 String img3=mr.getFilesystemName("p_img3");
		 String timestart=mr.getParameter("p_timestart");
		 String timeend=mr.getParameter("p_timeend");
				 Date datestart;
		datestart = Date.valueOf((mr.getParameter("p_datestart")));
		Date endstart;
		endstart = Date.valueOf(mr.getParameter("p_dateend"));
		String teachername=mr.getParameter("p_teachername");
		int like=Integer.parseInt(mr.getParameter("star-input"));
		int teacherno=Integer.parseInt(mr.getParameter("f_teacherno"));

	      FstudyService service=new FstudyService();
	      
	     
	      p.setfTitle(title);
	      p.setfName(name);
	      p.setfArea(area);
	      p.setfDay(day);
	      p.setfStudypserson(stupyperson);
	      p.setfCategory(category);
	      p.setfIntro1(intro1);
	      p.setfIntro2(intro2);
	      p.setfImgtitle(imgtitle);
	      p.setfImg1(img1);
	      p.setfImg2(img2);
	      p.setfImg3(img3);
	      p.setfTimestart(timestart);
	      p.setfTimeend(timeend);
	      p.setfDatestart(datestart);
	      p.setfDateend(endstart);
	      p.setfReadername(teachername);
	      p.setfLike(like);
	      p.setfTeacherno(teacherno);
	     
	   
	      int result=service.inserFstudy(p);
	      
	      String msg=result>0?"등록성공!":"등록실패!";
	      String loc="";
	      if(result>0) {
	    	  loc="/";
	      }else {
	    	  loc="/";
	      }
	      request.setAttribute("msg", msg);
	      request.setAttribute("loc", loc);
	      request.getRequestDispatcher("/views/common/msg.jsp")
	      .forward(request,response);   
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
