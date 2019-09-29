<%@page import="com.studium.pstudy.model.vo.Pstudy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member"%>
<%
	List<Pstudy> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">


<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/StudyList.css">
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>

<section class="inquerySection row">

	<div class="col-xs-4 col-sm-3 col-md-3 col-lg-2"
		style="padding-left: 0">
		<%@ include file="/views/admin/adminSideMenuBar.jsp"%>
	</div>
	<div class="col-lg-1"></div>
	<div class="inquery col-xs-6 col-sm-6 col-md-7 col-lg-9">
		<div class="inquery-header">
			<!--헤더div-->
			<div>
				<!--왼쪽 상단에 위치함-->
				스터디 정보
			</div>
			<button class="endStudy" onclick="endStudyList();">종 료</button>
			<button class="ingStudy" onclick="ingStudyList();">진 행</button>
			<button class="futureStudy" onclick="futureStudyList();">예 정</button>
		</div>
		<div id="ajaxTable">
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
		</div>
	
	</div>
</section>

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
    </script>


<%@ include file="/views/common/footer.jsp"%>
</body>

</html>
>
