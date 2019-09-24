package com.studium.pstudy.controller;

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
import com.studium.pstudy.model.service.PstudyService;
import com.studium.pstudy.model.vo.Pstudy;

import common.policy.StudiumFileRenamePolicy;

/**
 * Servlet implementation class PstudyUpdateServlet
 */
@WebServlet("/pstudy/studyUpdate")
public class PstudyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PstudyUpdateServlet() {
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
		 String saveDir=root+"\\upload\\pstudy"; 
		//String saveDir=root+"upload"+File.separator+"pstudy"; 
//		
//		String saveDir="C:"+File.separator+"Users"+File.separator+"User"+File.separator+"git"+File.separator+"Studium"
//				+File.separator+"Studium"+File.separator+"web"+File.separator+"upload"+File.separator+"pstudy";
		
		int maxSize=1024*1024*1024; //1GB
		  File isDir = new File(saveDir);
		    if(!isDir.isDirectory()){

		    	isDir.mkdir();

		    }
		    System.out.println(saveDir);

		    MultipartRequest mr =new MultipartRequest(
					request,
					saveDir,
					maxSize,
					"UTF-8",
					new StudiumFileRenamePolicy() 
					);
		
		
		int no =Integer.parseInt(mr.getParameter("p_no"));
		 String title=mr.getParameter("p_title");
		 String name=mr.getParameter("p_name");
		 String area=mr.getParameter("p_area");
		 String day=mr.getParameter("p_day");
		 int price=Integer.parseInt(mr.getParameter("p_price"));
		 int stupyperson=Integer.parseInt(mr.getParameter("p_stupyperson"));
		 String category=mr.getParameter("p_category");
		 String intro1=mr.getParameter("p_intro1");
		 String intro2=mr.getParameter("p_intro2");
		 String imgtitle=mr.getFilesystemName("p_imgtitle");
			String ori_p_imgtitle=mr.getParameter("ori_p_imgtitle");//파일 삭제용
			File f=mr.getFile("up_file");//새로들어온 파일 
			if(f!=null&&f.length()>0) {
				File deleteFile=new File(saveDir+"\\"+ori_p_imgtitle);
				boolean result=deleteFile.delete();
				System.out.println(result);
			}else {
				imgtitle=ori_p_imgtitle;
			}
		 String img1=mr.getFilesystemName("p_img1");
		 String img2=mr.getFilesystemName("p_img2");
		 String img3=mr.getFilesystemName("p_img3");
		 System.out.println("text: " + mr.getParameter("p_timeend"));
		 String timestart=mr.getParameter("p_timestart");
		 String timeend=mr.getParameter("p_timeend");
				 Date datestart;
		datestart = Date.valueOf((mr.getParameter("p_datestart")));
		Date endstart;
		endstart = Date.valueOf(mr.getParameter("p_dateend"));
		String teachername=mr.getParameter("p_teachername");
		

	      PstudyService service=new PstudyService();
	      
	      Pstudy p= new Pstudy();
	      p.setpNo(no);
	      p.setpTitle(title);
	      p.setpName(name);
	      p.setpArea(area);
	      p.setpDay(day);
	      p.setpPrice(price);
	      p.setpStudypserson(stupyperson);
	      p.setpCategory(category);
	      p.setpIntro1(intro1);
	      p.setpIntro2(intro2);
	      p.setpImgtitle(imgtitle);
	      p.setpImg1(img1);
	      p.setpImg2(img2);
	      p.setpImg3(img3);
	      p.setpTimestart(timestart);
	      p.setpTimeend(timeend);
	      p.setpDatestart(datestart);
	      p.setpDateend(endstart);
	      p.setpTeachername(teachername);
	     
	   
	      int result=service.updatePstudy(p);
	      
	      String msg=result>0?"변경성공!":"변경실패!";
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
