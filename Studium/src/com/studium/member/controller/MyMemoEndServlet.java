package com.studium.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.studium.member.model.service.MemberService;
import com.studium.member.model.vo.Member;
import com.studium.member.model.vo.MyMemo;

import common.template.LoginCheck;

/**
 * Servlet implementation class settingEndServlet
 */
@WebServlet("/myPage/myMemoEnd")
public class MyMemoEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMemoEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!new LoginCheck().doLoginCheck(request, response, 1000)) return;
		
		int memberNo=Integer.parseInt(request.getParameter("no"));
		int primary=Integer.parseInt(request.getParameter("primary"));
		
		
		MemberService ms= new MemberService();

		
		//status넘어오면 delete실행 
		if(request.getParameter("status")!=null) {
			ms.deleteMyMemo(primary);
			System.out.println("delte들어감");
		}
		//front id값 넘어오면 insert와 update중 하나 실행
		if(request.getParameter("id")!=null) {
			//마이메모 조회
			List<MyMemo> listMemo= ms.selectMyMemo(memberNo);

			int frontId=Integer.parseInt(request.getParameter("id"));
			int left=Integer.parseInt(request.getParameter("left"));
			int top=Integer.parseInt(request.getParameter("top"));
			String text=request.getParameter("val");

			MyMemo memo=new MyMemo();
			memo.setMemNo(memberNo);
			memo.setMemoFrontId(frontId);
			memo.setMemoLeft(left);
			memo.setMemoTop(top);
			memo.setMemoContents(text);
			
			//프라이머리값 없을 때 프론트에서 -1로 넘김 
			if(Integer.parseInt(request.getParameter("primary"))==-1) {
				ms.insertMyMemo(memo);
				
			}else {
				for(MyMemo mm: listMemo) {
					//내 메모의 frontId 같은 게 있으면  update,
					if(mm.getMemoId()==primary) {
						//프라이머리값으로 메모수정
						ms.updateMyMemo(memo, primary);
					}
				}
			}
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
