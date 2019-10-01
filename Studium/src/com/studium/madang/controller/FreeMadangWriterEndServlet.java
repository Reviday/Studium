package com.studium.madang.controller;

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
import com.studium.madang.model.service.FreeMadangService;
import com.studium.madang.model.vo.FreeMadang;
import com.studium.madang.model.vo.FreeMadangFile;

import common.policy.StudiumFileRenamePolicy;
import common.template.LoginCheck;

/**
 * Servlet implementation class MadangWriterEndServlet
 */
@WebServlet("/madang/free/writeEnd")
public class FreeMadangWriterEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeMadangWriterEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 2차 로그인 체크. 
		if(!new LoginCheck().doLoginCheck(request, response, 1004)) return;
		
		//파일 받기 및 넣기
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 접근입니다. 관리자에게 문의하십시오.");
			request.setAttribute("loc", "/madang/freeMadangList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}

		//파일 업로드
		String root=getServletContext().getRealPath("/");
		String saveDir=root+"upload\\madang\\free"; 
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
		
		FreeMadang fm=new FreeMadang();
		fm.setMadangTitle(mr.getParameter("subject"));
		fm.setMadangWriterUid(Integer.parseInt(mr.getParameter("userUid")));
		fm.setMadangWriterEmail(mr.getParameter("userEmail"));
		fm.setMadangWriterName(mr.getParameter("userName"));
		fm.setMadangRegisterIp(mr.getParameter("REMOTE_ADDR"));
		fm.setMadangContent(mr.getParameter("smarteditor"));
		
		//일단 작성 가능상태를 보기위해, 파일/이미지 기능은 제외처리하고 구동시킨다.
		//정상적으로 insert되면 해당 madangNo가 반환된다.
		int madangNo=new FreeMadangService().insertMadang(fm);
		
		Enumeration<String> e= mr.getFileNames();
	    if(e.hasMoreElements()) {
	        String name=(String)e.nextElement();
	        //name파라미터에는 file의 이름이 들어있따.
	        //그 이름을 주면 실제 값이 (업로드 할 file)을 가져온다.
	        String originFile=mr.getOriginalFileName(name);
	        if(originFile!=null) {
	        	//만약 업로드 폴더에 똑같은 파일이 잇으면 현재 올리는 파일 이름은 바뀐다.
		        //그래서 시스템에 있는 이름을 알려준다.
		        String systemFile=mr.getFilesystemName(name);
		        
		        //전송된 파일의 타입 - MIME 타입
		        String fileType=mr.getContentType(name);
		        
		        //문자열 "파일 이름"이 name에 들어온 상태
		        //문자열 파일 이름을통해 실제 파일 객체를 가져온다.
		        
		        File file=mr.getFile(name); //java.io
		        
		        long size=0;
		        if(file!=null) {
		        	size=file.length();
		        }
		        
		        FreeMadangFile fmf=new FreeMadangFile();
		        fmf.setMadangNo(madangNo);
		        fmf.setMemberNo(fm.getMadangWriterUid());
		        fmf.setFmfOriginalFilename(originFile);
		        fmf.setFmfRenameFilename(systemFile);
		        fmf.setFmfFilesize(size);
		        fmf.setFmfType(fileType);
		        fmf.setFmfIp(fm.getMadangRegisterIp());
		        int result=new FreeMadangService().insertFile(fmf);
		        if(result==0) {
		        	request.setAttribute("msg", "파일 저장에 실패하였습니다.");
					request.setAttribute("loc", "/madang/freeMadangList");
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
					return;
		        }
	        }
	    }
	      
		//이미지 받기 및 넣기
		//태그로 저장되기때문에 필요없을지도.
		
		String view="/";
		if(madangNo>0) {
			view="/madang/freeMadangView?madangNo="+madangNo+"&cPage=1";
			request.setAttribute("choice", request.getParameter("chocie"));
			request.setAttribute("choiceSub", "");
		} else {
			String msg="게시글 작성에 실패하였습니다.";
			String loc="/madang/freeMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
