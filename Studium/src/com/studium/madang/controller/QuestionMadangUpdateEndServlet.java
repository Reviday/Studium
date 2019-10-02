package com.studium.madang.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.studium.madang.model.service.QuestionMadangService;
import com.studium.madang.model.vo.QuestionMadang;
import com.studium.madang.model.vo.QuestionMadangFile;
import com.studium.util.model.service.SideMenuElementService;
import com.studium.util.model.vo.SideMenuElement;

import common.policy.StudiumFileRenamePolicy;
import common.template.LoginCheck;

/**
 * Servlet implementation class QuestionMadangUpdateEndServlet
 */
@WebServlet("/madang/question/updateEnd")
public class QuestionMadangUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionMadangUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 2차 로그인 체크. 
		if(!new LoginCheck().doLoginCheck(request, response, 1003)) return;
		
		//파일 받기 및 넣기
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "잘못된 접근입니다. 관리자에게 문의하십시오.");
			request.setAttribute("loc", "/madang/questionMadangList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		//파일 업로드
		String root=getServletContext().getRealPath("/");
		String saveDir=root+"upload\\madang\\question"; 
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
		
		QuestionMadang qm=new QuestionMadang();
		qm.setMadangNo(Integer.parseInt(mr.getParameter("madangNo")));
		qm.setMadangTitle(mr.getParameter("subject"));
		qm.setMadangWriterUid(Integer.parseInt(mr.getParameter("userUid")));
		qm.setMadangWriterEmail(mr.getParameter("userEmail"));
		qm.setMadangWriterName(mr.getParameter("userName"));
		qm.setMadangRegisterIp(mr.getParameter("REMOTE_ADDR"));
		qm.setMadangContent(mr.getParameter("smarteditor"));
		int cPage=Integer.parseInt(mr.getParameter("cPage"));
		
		//카테고리 받기
		qm.setMadangMainCategory(mr.getParameter("choiceSub"));
		qm.setMadangCategory(mr.getParameter("inter"));
		String[] subArray=new String[3];
		for(int i=0; i<subArray.length; i++) {
			subArray[i]=mr.getParameter("subCategory"+(i+1));
		}
		
		String subCategory="";
		for(int i=0; i<subArray.length; i++) {
			if(subArray[i].length()>0 && subCategory.length()<1) {
				subCategory+=subArray[i];
			} else if (subArray[i].length()>0 && subCategory.length()>0) {
				subCategory+=", "+subArray[i];
			}
		}
		if(subCategory.length()>0) {
			qm.setMadangSubCategory(subCategory);
		}
		
		//파일 받기 및 넣기
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
		        
		        QuestionMadangFile qmf=new QuestionMadangFile();
		        qmf.setMadangNo(qm.getMadangNo());
		        qmf.setMemberNo(qm.getMadangWriterUid());
		        qmf.setQmfOriginalFilename(originFile);
		        qmf.setQmfRenameFilename(systemFile);
		        qmf.setQmfFilesize(size);
		        qmf.setQmfType(fileType);
		        qmf.setQmfIp(qm.getMadangRegisterIp());
		        int result=new QuestionMadangService().insertFile(qmf);
		        if(result==0) {
		        	request.setAttribute("msg", "파일 저장에 실패하였습니다.");
					request.setAttribute("loc", "/madang/questionMadangList");
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
					return;
		        }
	        }
	    }
		//파일 유/무 처리 해줘야함.
	    //파일/이미지 체크는 시간상 제외.
		//fm.setMadangFilePresence('Y');
		qm.setMadangFilePresence('N');
		
		//이미지 받기 및 넣기
		qm.setMadangImgPresence('N');
		
		
		// SideMenuElement
		List<SideMenuElement> elements = new SideMenuElementService().selectElements("madang");
		
		//일단 작성 가능상태를 보기위해, 파일/이미지 기능은 제외처리하고 구동시킨다.
		//정상적으로 insert되면 해당 madangNo가 반환된다.
		int result=new QuestionMadangService().updateMadang(qm);
		
		String view="/";
		if(result>0) {
			view="/madang/questionMadangView?madangNo="+qm.getMadangNo()+"&cPage="+cPage+
					"&choice="+mr.getParameter("choice")+"&choiceSub="+mr.getParameter("choiceSub");
		} else if(result<0) {
			String msg="권한이 없습니다.";
			String loc="/madang/questionMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		} else {
			String msg="게시글 수정에 실패하였습니다.";
			String loc="/madang/questionMadangList";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		request.setAttribute("elements", elements);
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
