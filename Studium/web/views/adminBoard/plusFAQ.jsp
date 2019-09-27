<%@page import="com.studium.admin.model.vo.FAQ"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>


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
					<input type="text" placeholder="질문 종류를 입력하세요." name="type">
				</div>
				<div id="plustitle">
					<div>제 목</div>
					<input type="text" placeholder="질문 제목을 입력하세요." name="title">
				</div>
			</div>
			<div id="plusContent">
				<!--내용 작성하는 전체 섹션-->
				<div id="plusContent-header">작성하기</div>
				<div id="plusContent-content">
					<textarea name="content" id="" cols="30" rows="10"></textarea>
				</div>
	</form>
	</div>
	<button id="plusQnACancle" type="button" onclick="cancleQnA();">취소</button>
	<button id="plusQnASubmit" type="button" onclick="submitQnA();">확인</button>
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
	
	function submitQnA() {

		var params = jQuery("#plusQnAForm").serialize();
		 $.ajax({
			url: "<%=request.getContextPath()%>/AdminBoardInsertFAQ",
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
	
</script>


