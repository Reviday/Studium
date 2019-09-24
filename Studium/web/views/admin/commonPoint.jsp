<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member"%>
<%
	List<Member> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = "";
	String status = "";
%>    
<table class="memberTable">
			<tr>
				<th>선택</th>
				<th>이름</th>
				<th>이메일</th>
				<th>등급</th>
				<th>상태</th>
				<th>포인트</th>
				<th>포인트 내역확인</th>
			</tr>
			<%for(Member m : list){ %>
			<%
            	if(m.getMemCode() == 'T'){grade = "강사";} 
            	if(m.getMemCode() == 'R'){grade = "정회원";}
            	if(m.getMemCode() == 'A'){grade = "준회원";}
            	if(m.getMemDenied() == 'N'){status = "정상";}
            	if(m.getMemDenied() == 'Y'){status = "일시정지";}
            	if(m.getMemDenied() == 'P'){status = "영구정지";}
            	%>
			<tr>
				<td><input type="checkbox" name="checkMember"
					class="checkMember" value="<%=m.getMemNo() %>"
					form="pointUp"> <input type="checkbox" name="checkMember1"
					class="checkMember1" value="<%=m.getMemNo() %>"
					form="pointDown"></td>
				<td>
					<%=m.getMemName() %>
					<input type="hidden" value="<%=m.getMemName() %>" name="memName" form="pointUp">
					<input type="hidden" value="<%=m.getMemName() %>" name="memName1" form="pointDown">	
				</td>
				<td>
					<%=m.getMemUserEmail() %>
					<input type="hidden" value="<%=m.getMemUserEmail() %>" name="memEmail" form="pointUp">
					<input type="hidden" value="<%=m.getMemUserEmail() %>" name="memEmail1" form="pointDown">
				</td>
				<td><%=grade %></td>
				<td><%=status %></td>
				<td><%=m.getMemPoint() %></td>
				<td class="trNo" style="display:none;"><%=m.getMemNo() %></td>
				<td>
					<input type="button" value="내역 확인" class="pointConfirm" id="<%=m.getMemNo() %>"> 
				</td>
			</tr>

			<%} %>
		</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>