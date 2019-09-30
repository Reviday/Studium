<%@page import="com.studium.member.model.vo.MemberLoginLog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MemberLoginLog> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage"); 
%>
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
<link href="/Studium/css/pagination.css" rel="stylesheet">
<%@ include file="/views/common/pagination.jsp"%>

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