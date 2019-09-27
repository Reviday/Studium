package common.template;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.studium.member.model.vo.Member;

public class LoginCheck {
	
	public LoginCheck(HttpServletRequest request, HttpServletResponse response, int code) {
		//MadangPage에 최적화 되어있음.
		//로그인이 필요한 페이지이지만, 어떤 이유로 인해 세션이 끊어져
		//로그인이 해제되었는데도 불구하고 로그인이 필요한 페이지에 머무를 경우
		//에러가 발생할 여지가 있는데, 이를 해결하기 위한 class로 
		//code에 따라서 이동될 페이지가 나뉜다.
		//다른 페이지에서도 사용하고자 한다면 CODE CASE를 추가할 것.
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		
		String view = "";
		String msg = "";
		String loc = "";
		if(m==null) {
			msg="[LoginError:CODE"+code+"] 잘못된 경로입니다.";
			switch(code) {
			case 1001 : loc="/madang/introMadang"; break;
			case 1002 : loc="/madang/studyMadangList"; break;
			case 1003 : loc="/madang/freeMadangList"; break;
			case 1004 : loc="/madang/shareMadangList"; break;
			case 1005 : loc="/madang/boastMadangList"; break;
			case 1006 : loc="/madang/questionMadangList"; break;
			}
			
			//SideBar의 선택 요소를 유지시키기 위한 쿼리스트링
			if(request.getParameter("choice")!=null) {
				loc+="?choice"+request.getParameter("choice");
				//choice가 없으면 Sub도 없음.
				if(request.getParameter("choiceSub")!=null) {
					loc+="&choiceSub"+request.getParameter("choiceSub");
				}
			}
			
			
			view = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
//			try {
//				request.getRequestDispatcher(view).forward(request, response);
//			} catch (ServletException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} 
			return;
		} 
	}
}
