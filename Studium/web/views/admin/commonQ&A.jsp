<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.QandA"  %>
<%
	List<QandA> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<div>
            1:1문의 관리
        </div>
        <form method="post" id="deleteQnA">
            <input type="checkbox" name="allcheck" id="alldelete">
        	<button type="button" id="deletebtn" onclick="deleteQnA();">삭제</button>
            <table class="qandaTable">
                <tr>
                    <th>선택</th>
                    <th>이메일</th>
                    <th>내용</th>
                    <th>날짜</th>
                    <th>지난 날짜</th>
                    <th>글번호</th>
                </tr>
                <%for(QandA m : list){ %>
                <tr>
                    <td><input type="checkbox" name="checkQ&A" class="checkBoard" value="<%=m.getcNo() %>"></td>
                    <td class="QnAmo"><%=m.getEmail() %></td>
                    <td class="QnAmo"><%=m.getFullContent() %></td>
                    <td class="QnAmo"><%=m.getEnrollDate() %></td>
                    <td class="QnAmo"><%=m.getPastDate() %></td>
                    <td class="QnAmo"><%=m.getcNo() %></td>
                </tr>
                <%} %>
            </table>
        </form>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>