<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.PayMember"%>
<%
	List<PayMember> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage"); 
%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">


<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/payList.css">
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
				결제 내역
			</div>
			<div>
				<!--오른쪽 상단에 위치하는 검색기능-->
				<form action="<%=request.getContextPath() %>/admin/paymemberFinder"
					class="nameFinder">
					<input type="text" placeholder="검색" name="memberName" id="findName">
					<input type="hidden" value="findPayMember" name="method">
				</form>
				<input type="submit" value="" class="submitPicture"
					onclick="nameFinder();">
			</div>
		</div>
		<div id="ajaxTable">
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
						<button class="deleteSubmit" onclick="deletePayMember();">결제 취소</button>
					</td>
				</tr>
				<%} %>
			</table>
			<%@ include file="/views/common/pagination.jsp"%>
		</div>

	</div>
</section>

<%@ include file="/views/common/footer.jsp"%>

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



</body>

</html>