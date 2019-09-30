<%@page import="com.studium.member.model.vo.MemberLoginLog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.PayMember"%>
<%
	List<MemberLoginLog> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage"); 
%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">


<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/LoginLog.css">
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
				로그인 로그
			</div>
			<div>
				<!--오른쪽 상단에 위치하는 검색기능-->
				<form class="nameFinder">
					<input type="text" placeholder="검색" name="memberName" id="findName">
					<input type="hidden" value="nameFinder" name="method">
				</form>
				<input type="submit" value="" class="submitPicture"
					onclick="nameFinder();">
			</div>
		</div>
		<div id="ajaxTable">
			<table class="inqueryTable">
				<tr>
					<th>번호</th>
					<th>로그인 여부</th>
					<th>회원 번호</th>
					<th>이메일</th>
					<th>로그인 시간</th>
					<th>IP</th>
					<th>이유</th>
				</tr>
				<%for(MemberLoginLog m : list) {%>
				<tr>
					<td><%=m.getMllNo() %></td>
					<td><%=m.getMllSuccess() %></td>
					<td><%=m.getMllMemNo() %></td>
					<td><%=m.getMllUserEmail() %></td>
					<td><%=m.getMllDatetime() %></td>
					<td><%=m.getMllIp() %></td>
					<td><%=m.getMllReason() %></td>
				</tr>
				<%} %>
			</table>
			<%@ include file="/views/common/pagination.jsp"%>
		</div>

	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>

<script>


function nameFinder(cPage) {
	if(!$("#findName").val().trim()){
		alert("검색할 이메일을 입력하세요.");
	}else{
	var params = jQuery(".nameFinder").serialize();
	params+='&cPage='+cPage;
	$.ajax({
		url: "<%=request.getContextPath() %>/LoginLogSearch",
		type: "POST",
		dataType: "html",
		data: params,
		success: function(data){
			$("#ajaxTable").html("");
			$("#ajaxTable").html(data);
		}
	})
	}
}


</script>



</body>

</html>