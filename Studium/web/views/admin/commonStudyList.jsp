<%@page import="com.studium.pstudy.model.vo.Pstudy"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Pstudy> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<style>
.ingStudy:hover {
	background: #ef6c00 !important;
}

.endStudy:hover {
	background: #ef6c00 !important;
}

.futureStudy:hover {
	background: #ef6c00 !important;
}
</style>
<table class="inqueryTable">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>지역</th>
		<th>날짜</th>
		<th>카테고리</th>
		<th>강사</th>
		<th>인원</th>
		<th>가격</th>
	</tr>
	<%for(Pstudy p : list){ %>
	<tr>
		<td><%=p.getpNo() %></td>
		<td><%=p.getpTitle() %></td>
		<td><%=p.getpArea() %></td>
		<td><%=p.getpDatestart()%>, <%=p.getpTimestart() %>, <br>
		    <%=p.getpDateend() %>, <%=p.getpTimeend() %>, <br>
		    <%=p.getpDay() %></td>
		<td><%=p.getpCategory() %></td>
		<td><%=p.getpName() %></td>
		<td><%=p.getpStudyMember() %>/<%=p.getpStudypserson() %></td>
		<td><%=p.getpPrice() %></td>
	</tr>
	<%} %>
</table>
<%@ include file="/views/common/pagination.jsp"%>

<script>
    	
    	function endStudyList(cPage){
    		var cPage = <%=cPage%>;
    		$.ajax({
     			url: "<%=request.getContextPath()%>/endStudyList",
     			type: "POST",
     			dataType: "html",
     			data: {
     					cPage : cPage,
     					method : "endStudyList"
     					},
     			success: function(data){
     				$(".endStudy").css('background', 'rgba(255,105,30,1)');
     				$(".ingStudy").css('background', 'white');
     				$(".futureStudy").css('background', 'white');
     				$("#ajaxTable").html("");
     				$("#ajaxTable").html(data);
     			}
     		})
    	}
    	
    	function futureStudyList(cPage){
    		var cPage = <%=cPage%>;
    		$.ajax({
     			url: "<%=request.getContextPath()%>/futureStudyList",
     			type: "POST",
     			dataType: "html",
     			data: {
     					cPage : cPage,
     					method : "futureStudyList"
     					},
     			success: function(data){
     				$(".endStudy").css('background', 'white');
     				$(".ingStudy").css('background', 'white');
     				$(".futureStudy").css('background', 'rgba(255,105,30,1)');
     				$("#ajaxTable").html("");
     				$("#ajaxTable").html(data);
     			}
     		})
    	}
    	
    	function ingStudyList(cPage) {
    		var cPage = <%=cPage%>;
    		$.ajax({
     			url: "<%=request.getContextPath()%>/ingStudyList",
     			type: "POST",
     			dataType: "html",
     			data: {
     					cPage : cPage,
     					method : "ingStudyList"
     					},
     			success: function(data){
     				$(".endStudy").css('background', 'white');
     				$(".ingStudy").css('background', 'rgba(255,105,30,1)');
     				$(".futureStudy").css('background', 'white');
     				$("#ajaxTable").html("");
     				$("#ajaxTable").html(data);
     			}
     		})
    	}
    	
    	</script>