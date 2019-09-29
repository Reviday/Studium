<%@page import="com.studium.admin.model.vo.FAQ"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
	FAQ f = (FAQ)request.getAttribute("faq");
%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/plusFAQ.css">


<article id="plusQnA1">
	<div id="plusQnA-header">게시글 생성</div>
	<div class="rine"></div>
	<!--경계선-->
	<form method="POST" id="plusQnAForm">
		<div id="plusQnASection">
			<!--작성하는 전체 섹션-->
			<div id="plustypetitle">
				<!-- 종류와 제목 작성하는 섹션-->
				<div id="plustype">
					<div>종 류</div>
					<input type="text" placeholder="<%=f.getFaqType() %>" name="type" value="<%=f.getFaqType() %>">
				</div>
				<div id="plustitle">
					<div>제 목</div>
					<input type="text" placeholder="<%=f.getFaqTitle() %>" name="title" value="<%=f.getFaqTitle() %>">
				</div>
			</div>
			<div id="plusContent">
				<!--내용 작성하는 전체 섹션-->
				<div id="plusContent-header">작성하기</div>
				<button id="deletedeletebtn" type="button" class="<%=f.getFaqNO()%>" onclick="deleteQnA();">삭제</button>
				<div id="plusContent-content">
					<textarea name="content" id="" cols="30" rows="10"><%=f.getFaqContent() %></textarea>
				</div>
				<input type="hidden" name="faqNo" value="<%=f.getFaqNO() %>">
	</form>
	</div>
	<button id="plusQnACancle" type="button" onclick="cancleQnA();">취소</button>
	<button id="plusQnASubmit" type="button" onclick="UpdateQnA();">수정</button>
	</div>
</article>

<script>
	function cancleQnA() {
		$.ajax({
			url: "<%=request.getContextPath()%>/AdminBoardAjaxFAQ",
			type: "POST",
	      	dataType: "html",
	      	success: function(data){
	      		$(".memberPoint").html("");
	      		$(".memberPoint").html(data);
	      	}
		})
	}
	
	function UpdateQnA() {

		var params = jQuery("#plusQnAForm").serialize();
		 $.ajax({
			url: "<%=request.getContextPath()%>/AdminBoardUpdateFAQ",
			type: "POST",
			data: params,
		    dataType: "html",
		      success: function(data){
		    	alert("게시되었습니다.");
		      	$(".memberPoint").html("");
		      	$(".memberPoint").html(data);
		      }
		}) 
	}
	
	function deleteQnA(){
		var result = confirm("삭제하시겠습니까?");
		if(result){
		$.ajax({
			url: "<%=request.getContextPath()%>/AdminBoardDeleteFAQ",
			type: "POST",
			data: {"no" : $("#deletedeletebtn").attr("class")},
		    dataType: "html",
		      success: function(data){
		    	alert("게시글이 삭제되었습니다.");
		      	$(".memberPoint").html("");
		      	$(".memberPoint").html(data);
		      }
		}) 
		return true;
		}else{
			return false;
		}
	}
	
</script>


