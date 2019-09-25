<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.studium.mypage.model.vo.LeaderAdd"%>    
<%@ page import="java.util.List" %>
<%
	List<LeaderAdd> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	
%>    
<table class="memberTable">
			<tr>
				<th>선택</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>휴대폰 번호</th>
				<th>타입</th>
				<th>희망지역</th>
				<th>선호 카테고리</th>
				<th>신청일</th>
			</tr>
			<%for(LeaderAdd l : list){ %>
			<%
				String category = "";
				if(l.getlCategory2() == null && l.getlCategory3() == null){
					category = l.getlCategory1();
				}
				if(l.getlCategory2() != null && l.getlCategory3() == null){
					category = l.getlCategory1() + ", " + l.getlCategory2();
				}
				if(l.getlCategory2() == null && l.getlCategory3() != null){
					category = l.getlCategory1() + ", " + l.getlCategory3();
				}
				if(l.getlCategory2() != null && l.getlCategory3() != null){
					category = l.getlCategory1() + ", " + l.getlCategory2() + ", " + l.getlCategory3();
				}
				
			%>
			<tr>
				<td>
				<form class="deleteLeaderPS">
				<input type="hidden" name="method" value="deleteLeaderPS">
				<input type="checkbox" name="checkMember" class="checkMember" value="<%=l.getlNo() %>">
				</form>
				<td>
					<%=l.getlName() %>
				</td>
				<td>
					<%=l.getlGender() %>
				</td>
				<td class="pointConfirm"><%=l.getlEmail() %></td>
				<td><%=l.getlPhone() %></td>
				<td><%=l.getlType() %></td>
				<td><%=l.getlArea() %></td>
				<td><%=category%></td>
				<td><%=l.getlEnrolldate() %></td>				
			</tr>
			<%} %>
		</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>		