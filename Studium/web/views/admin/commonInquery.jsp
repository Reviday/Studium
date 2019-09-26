<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member" %>
<%
	List<Member> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = (String) request.getAttribute("grade");
	String status = (String) request.getAttribute("status");
	request.setAttribute("setGrade", grade);
	request.setAttribute("setStatus", status);
%> 
<table class="inqueryTable">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>가입일시</th>
					<th>등급</th>
					<th>상태</th>
					<th>회원수정</th>
					<th>회원탈퇴</th>
				</tr>
				<%for(Member m : list){ %>
				<tr>
					<td><%=m.getMemNo() %></td>
					<td><%=m.getMemName() %></td>
					<td><span class="momoClick"><%=m.getMemUserEmail() %></span>
						<div class="adminMemo">
							<form class="memoUpdate">
								<textarea name="memo" class="memotextarea" cols="30" rows="10"
									placeholder="회원에 대한 메모를 작성하세요."
									value=<%=m.getMemAdminmemo() != null ? m.getMemAdminmemo() : "" %>><%=m.getMemAdminmemo()%></textarea>
								<input type="hidden" name="memNo" value="<%=m.getMemNo() %>">
							</form>
							<button type="submit" onclick="memoUpdate();">수정</button>
						</div></td>
					<td><%=m.getMemEnrollDatetime() %></td>
					<form action="<%=request.getContextPath()%>/adminUpdateMember" class="statusUpdate"
						onsubmit="return update_validate();">
						<input type="hidden" value="<%=m.getMemNo() %>" name="memUpdateNo"
							class="memUpdateNo">
						<td><select name="memberGradeList" class="memberGradeList">
								<option value="M" <%='M' == m.getMemCode() ? "selected" : "" %>>관리자</option>
								<option value="T" <%='T' == m.getMemCode() ? "selected" : "" %>>강사</option>
								<option value="R" <%='R' == m.getMemCode() ? "selected" : "" %>>정회원</option>
								<option value="A" <%='A' == m.getMemCode() ? "selected" : "" %>>준회원</option>
						</select></td>
						<td><select name="memberStatusList" class="memberStatusList">
								<option value="N"
									<%='N' == m.getMemDenied() ? "selected" : "" %>>정상</option>
								<option value="Y"
									<%='Y' == m.getMemDenied() ? "selected" : "" %>>일시정지</option>
								<option value="P"
									<%='P' == m.getMemDenied() ? "selected" : "" %>>영구정지</option>
						</select></td>
						<input type="hidden" value="statusUpdate" name="method">
					</form>
						<td><input type="submit" value="수정" class="memberUpdate" onclick="statusUpdate();">
						</td>
					<td>
						<form action="<%=request.getContextPath()%>/adminDeleteMember" class="deleteMember"
						 onsubmit="return delete_validate();"> 
						 <input type="hidden" value="<%=m.getMemNo() %>" name="memNo"
						class="memNo"> 
						<input type="hidden" value="deleteMember" name="method">
						</form>
						<input type="button" value="탈퇴" class="deleteSubmit" onclick="deleteMember();"> 
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


