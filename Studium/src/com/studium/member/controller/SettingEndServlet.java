package com.studium.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.member.model.service.MemberService;

/**
 * Servlet implementation class settingEndServlet
 */
@WebServlet("/myPage/settingEnd")
public class SettingEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SettingEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=Integer.parseInt(request.getParameter("no"));
		String recieveEmail=request.getParameter("recieveEmail");
		String useNote=request.getParameter("useNote");
		String receiveSms=request.getParameter("receiveSms");
		String openProfile=request.getParameter("openProfile");
		
		MemberService ms=new MemberService();
		String setName="";
		int result=0;
		if(recieveEmail!=null) {
			setName="recieveEmail";
			result=ms.updateSetting(setName, no);
		}if(useNote!=null) {
			setName="useNote";
			result=ms.updateSetting(setName, no);
		}if(receiveSms!=null) {
			setName="receiveSms";
			result=ms.updateSetting(setName, no);
		}if(openProfile!=null) {
			setName="openProfile";
			result=ms.updateSetting(setName, no);
		}
		if(result>0) {
			
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
