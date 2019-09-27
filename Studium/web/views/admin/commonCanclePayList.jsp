<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.studium.admin.model.vo.CanclePayMember"%>
<%
	List<CanclePayMember> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage"); 
%>
<table class="inqueryTable">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>휴대폰 번호</th>
		<th>스터디</th>
		<th>취소 날짜</th>
		<th>취소 금액</th>
	</tr>
	<%for(CanclePayMember p : list) {%>
	<tr>
		<td><%=p.getMemNo() %></td>
		<td><%=p.getMemName() %></td>
		<td><%=p.getMemPhone() %></td>
		<td><%=p.getpTitle() %></td>
		<td><%=p.getCancleDate() %></td>
		<td><%=p.getPrice() %></td>
	</tr>
	<%} %>
</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<%@ include file="/views/common/pagination.jsp"%>


<script>


function nameFinder(cPage) {
	if(!$("#findName").val().trim()){
		alert("검색할 이름, 이메일을 입력하세요.");
	}else{
	var params = jQuery(".nameFinder").serialize();
	params+='&cPage='+cPage;
	$.ajax({
		url: "<%=request.getContextPath() %>/admin/canclepaymemberFinder",
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

function findCanclePayMember(cPage){
	 var params = '&cPage='+cPage+'&method='+"findCanclePayMember";
	 $.ajax({
		url: "<%=request.getContextPath()%>/findCanclePayMember",
		type: "POST",
		dataType: "html",
		data: params,
		success: function(data){
			$("#ajaxTable").html("");
			$("#ajaxTable").html(data);
		}
	})
}
	

</script>



