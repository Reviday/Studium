<%@page import="com.studium.fstudy.model.vo.Fstudy"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Fstudy> list=(List)request.getAttribute("list");
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
	</tr>
	<%for(Fstudy f : list){ %>
	<tr>
		<td><%=f.getfNo() %></td>
		<td><%=f.getfTitle() %></td>
		<td><%=f.getfArea() %></td>
		<td><%=f.getfDatestart()%>, <%=f.getfTimestart() %>, <br>
		    <%=f.getfDateend() %>, <%=f.getfTimeend() %>, <br>
		    <%=f.getfDay() %></td>
		<td><%=f.getfCategory() %></td>
		<td><%=f.getfName() %></td>
		<td><%=f.getfStudyMember() %>/<%=f.getfStudypserson() %></td>
	</tr>
	<%} %>
</table>
<%@ include file="/views/common/pagination.jsp"%>

<script>
    	
    	function endStudyList(cPage){
    		var cPage = <%=cPage%>;
    		$.ajax({
     			url: "<%=request.getContextPath()%>/endFreeStudyList",
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
     			url: "<%=request.getContextPath()%>/futureFreeStudyList",
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
     			url: "<%=request.getContextPath()%>/ingFreeStudyList",
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