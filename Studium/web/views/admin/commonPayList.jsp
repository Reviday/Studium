<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.PayMember"%>
<%
	List<PayMember> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>

<table class="inqueryTable">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>휴대폰 번호</th>
		<th>스터디</th>
		<th>결제 날짜</th>
		<th>스터디 진행</th>
		<th>결제 취소</th>
	</tr>
	<%for(PayMember p : list) {%>
	<tr>
		<td><%=p.getMemNo() %></td>
		<td><%=p.getMemName() %></td>
		<td><%=p.getMemPhone() %></td>
		<td><%=p.getpTitle() %></td>
		<td><%=p.getPurchaseDate() %></td>
		<td><%=p.getPurchaseStatus() %></td>
		<td>
			<form class="deletePayMember">
				<input type="hidden" name="memNo" value="<%=p.getMemNo() %>">
				<input type="hidden" value="findPayMember" name="method">
			</form>
			<button class="deleteSubmit" onclick="deletePayMember();">결제
				취소</button>
		</td>
	</tr>
	<%} %>
</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<%@ include file="/views/common/pagination.jsp"%>

<script>

function deletePayMember(cPage){
	var result = confirm("결제를 취소하시겠습니까?");
	if(result){
		var params = jQuery(".deletePayMember").serialize();
		params+='&cPage='+cPage;

		$.ajax({
			url: "<%=request.getContextPath()%>/deletePayMember",
			type: "POST",
			dataType: "html",
			data: params,
			success: function(data){
				$("#ajaxTable").html("");
				$("#ajaxTable").html(data);
			}
		})
		return true;
		}else{
			return false;
	        	}
}

function nameFinder(cPage) {
	if(!$("#findName").val().trim()){
		alert("검색할 이름, 이메일을 입력하세요.");
	}else{
	var params = jQuery(".nameFinder").serialize();
	params+='&cPage='+cPage;
	$.ajax({
		url: "<%=request.getContextPath() %>/admin/paymemberFinder",
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

function findPayMember(cPage){
	 var params = '&cPage='+cPage+'&method='+"findPayMember";
	 $.ajax({
		url: "<%=request.getContextPath()%>/findPayMember",
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