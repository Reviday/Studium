<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>관리자 1:1문의 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="./css/leaderIntro.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Q&AList.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
     <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>  
    <section>
        <article class="leftmenu">
            <ul>
                <li>
                    <a href="">인쿼리</a>  
                </li>
                <li>
                    <a href="">적립금 관리</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/AdminQandAList">1:1문의 관리</a>
                </li>
            </ul>
        </article>
       
        <article class="mainArticle"></article>
        <%@ include file="/views/common/footer.jsp" %>
</body>
</html>