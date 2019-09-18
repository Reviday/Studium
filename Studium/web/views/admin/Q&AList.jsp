<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.QandA"  %>    
<%
	List<QandA> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>    
    <%@ include file="/views/common/header.jsp" %> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Q&AList.css">
  <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>  
    <section>
        <div class="leftmenu">
            <ul>
                <li>
                    <a href="">인쿼리</a>  
                </li>
                <li>
                    <a href="">적립금 관리</a>
                </li>
                <li>
                    <a href="">게시글 관리</a>
                </li>
                <li class="qandaList">
                    <a href="<%=request.getContextPath()%>/AdminQandAList">1:1문의 관리</a>
                </li>
            </ul>
        </div>

        <div class="qanda">
            <div>
                1:1문의 관리
            </div>
            <input type="checkbox" name="" id="alldelete">
            <input type="submit" value="삭제" id="deletebtn">
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
					<td><input type="checkbox" name="" id=""></td>
					<td><%=m.getEmail() %></td>
					<td><%=m.getContent() %></td>
					<td><%=m.getEnrollDate() %></td>
					<td><%=m.getPastDate() %></td>
					<td><%=m.getcNo() %></td>
				</tr>
			<%} %>
            </table>
           <%@ include file="/views/common/pagination.jsp"%>
			
        </div>
    </section>
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>