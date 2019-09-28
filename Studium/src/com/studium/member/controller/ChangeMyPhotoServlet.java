package com.studium.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;

import common.policy.StudiumFileRenamePolicy;
import common.template.LoginCheck;

/**
 * Servlet implementation class ChangeMyPhotoServlet
 */
@WebServlet("/myPage/changeMyPhoto")
public class ChangeMyPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMyPhotoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!new LoginCheck().doLoginCheck(request, response, 1000)) return;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "사진 변경 오류");
			request.setAttribute("loc", "/views/myPage/myInfo.jsp");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}

		
		String root=getServletContext().getRealPath("/");
//		String s=request.getContextPath();/////
		String saveDir=root+"\\upload\\myPage"; 
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
		
		 
		 int no=Integer.parseInt(mr.getParameter("no"));
		 
		 //ajax로 사진받음
		 Enumeration<String> e= mr.getFileNames();
		 String fileName="";
	      if(e.hasMoreElements()) {
	         fileName=mr.getFilesystemName(e.nextElement());
	      }
//		 System.out.println("내 사진이름"+fileName);
//		 System.out.println("원래사진이름"+mr.getOriginalFileName(fileName));
		 
		 
		 MemberService ms=new MemberService();
	     int result=ms.changeMyPhoto(fileName,no);
	    

		//해당 아이디로  수정된 멤버객체 가지고옴
	     Member m= new Member();
	     String msg="";
	     String loc="/";
	     String view="";
	      if(result>0) {
				//회원사진변경완료
//	 	     m=ms.selectNo(no);
//				request.setAttribute("member", m);
//				request.getRequestDispatcher("/views/myPage/myInfo.jsp")
//				.forward(request,response);
				
			} else {
				msg="사진 등록이 실패하였습니다.";
				view="/views/common/msg.jsp";
				loc="/views/myPage/myInfoCheckPw.jsp";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher(view).forward(request, response);
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
