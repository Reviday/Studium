<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd.");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<section class="madang-section row">
<div class="col-xs-4 col-sm-3 col-md-3 col-lg-2" style="padding-left:0">
<%@ include file="/views/common/sideMenuBar.jsp"%>	
</div>
<div class="col-lg-1"></div>
	<div class="wrapper col-xs-6 col-sm-6 col-md-7 col-lg-9" style="height:500px">
	</div>
	</section>


<%@ include file="/views/common/footer.jsp"%>