<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar")%>
	</ul>
</div>