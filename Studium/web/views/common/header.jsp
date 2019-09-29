<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.studium.member.model.vo.Member"%>
<% 
	Member loginMember=(Member)session.getAttribute("loginMember");
	String REMOTE_ADDR= request.getRemoteAddr(); // IP
%>
<!doctype html>
<html lang="ko">

<head>
<title>Studium</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="shortcut icon" href="<%=request.getContextPath() %>/img/studium_logo.png" type="image/x-icon" />
<link rel="icon" href="<%=request.getContextPath() %>/img/studium_logo.png" type="image/x-icon" />

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/magnific-popup.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/myPage.css">

<!-- Theme Style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
 <!--애니메이션-->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<!-- aos 애니메이션-->
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
   

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
</head>

<body>
	<!-- 로그인 폼 -->
	<div class="login-sec" id="log-dialog-background"></div>
	<form action="<%=request.getContextPath() %>/login?REMOTE_ADDR=<%=REMOTE_ADDR%>" 
		class="login-form" id="my-log-dialog"  method="post">
		<h1>Login</h1>

		<div class="input-area">
			<input type="email" name="userEmail" id="userEmail"> <span
				data-placeholder="UserEmail"></span>
		</div>

		<div class="input-area">
			<input type="password" name="password" id="password"> <span
				data-placeholder="Password"></span>
		</div>


		<div class="logbtn-form">
			<span class="logbtn-effect"></span> <span class="logbtn-effect"></span>
			<span class="logbtn-effect"></span> <span class="logbtn-effect"></span>
			<input type="submit" class="logbtn" value="Login">
		</div>



		<div class="bottom-text">
			Don't hava account? <a href="#">Sign in</a>
		</div>
	</form>
	
	<!-- 회원가입 폼 -->
	<div class="registation-sec" id="reg-dialog-background"></div>
	<form action="<%=request.getContextPath() %>/registration" class="registation-form" id="my-reg-dialog"
				onsubmit="return registation_validate()" method="post">
		<h4>가입하기</h4>
	
		<div class="confirmed">
			<span id="mark"></span>
			<span id="con-text">
			스터디움의 <a href="#">이용약관</a>, 
			<a href="#">개인정보 취급방침 </a>,
			<a href="#">참가자 약관 </a>, 
			<a href="#">리더약관 </a>에 동의 합니다. 
			<span id="required"> (필수)</span></span>
		</div>
		
		<div class="required-ck">
			<span id="required-ck">스터디움의 이용 약관 및 개인정보 취급방침, 참가자 약관, 리더 약관에 동의 후 진행해주세요!</span>
		</div>
		
		<hr/>
		
		<div class="input-area">
			<input type="text" name="name" id="name" autocomplete=off> <span
				data-placeholder="이름"></span>
		</div>

		<div class="input-area">
			<input type="email" name="email" id="email" autocomplete=off> <span
				data-placeholder="이메일"></span>
		</div>

		<div class="input-area">
			<input type="password" name="pwd" id="pwd" > <span
				data-placeholder="비밀번호"></span>
		</div>
		
		<div class="input-area">
			<input type="password" name="pwdck" id="pwdck"> <span
				data-placeholder="비밀번호 확인"></span>
		</div>


		<div class="regbtn-form">
			<span class="regbtn-effect"></span> <span class="regbtn-effect"></span>
			<span class="regbtn-effect"></span> <span class="regbtn-effect"></span>
			<input type="submit" class="regbtn" value="Join now!">
		</div>
	</form>



	<header class="page-header" role="banner">
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container">
				<a href="<%=request.getContextPath()%>"> <img src='<%=request.getContextPath()%>/img/studium_en_logo_white.png'
					onmouseover="this.src='<%=request.getContextPath()%>/img/studium_ko_logo_white.png'"
					onmouseout="this.src='<%=request.getContextPath()%>/img/studium_en_logo_white.png'" alt="Studium"
					width="50px;">
				</a> <a class="navbar-brand" href="<%=request.getContextPath()%>"> <span>Studium</span></a>

				<div class="collapse navbar-collapse" id="navbarsExample05">
					<ul class="navbar-nav ml-auto pl-lg-5 pl-0">
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/pstudyListView">강사스터디</a>
						</li>

						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath() %>/fstudyListView">일반스터디</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="review.html">스터디후기</a>

						</li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/story">스토리</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">커뮤니티</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="<%=request.getContextPath()%>/madang/introMadang">마당소개</a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/madang/studyMadangList">공부마당</a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/madang/freeMadangList">자유마당</a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/madang/shareMadangList">공유마당</a> 
								<a class="dropdown-item" href="<%=request.getContextPath()%>/madang/boastMadangList">자랑마당</a>
								<a class="dropdown-item" href="<%=request.getContextPath()%>/madang/questionMadangList">질문마당</a>
							</div></li>
					</ul>

					<ul class="navbar-nav ml-auto">
					
						<% 
						  	//관리자 로그인
							if(loginMember!=null && loginMember.getMemCode()=='M') {
						%>
							<li class="nav-item cta-btn">
							<a class="btn btn-white btn-outline-white"style="border: 1px solid"
							href="<%=request.getContextPath()%>/AdminManager">회원관리</a>
							</li>
							<li class="nav-item cta-btn">
							<a class="btn btn-white btn-outline-white" style="border: 1px solid"
							href="<%=request.getContextPath()%>/AdminBoardManager">게시글관리</a></li>
							<li class="nav-item cta-btn">
							<a class="btn btn-white btn-outline-white" style="border: 1px solid"
								 onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</a></li>
						<% 
							//강사 로그인
							} else if(loginMember!=null && loginMember.getMemCode()=='T') {
						%>
							<li class="nav-item cta-btn">
							<a class="btn btn-white btn-outline-white" id="myM" style="border: 1px solid">마이페이지</a>
							</li>
							<li class="nav-item cta-btn"><a
								class="btn btn-white btn-outline-white" style="border: 1px solid"
								onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</a></li>
						<% 
							//회원 로그인
							} else if(loginMember!=null) {
						%>
							<li class="nav-item cta-btn">
							<a class="btn btn-white btn-outline-white" style="border: 1px solid" id="myM"
							>마이페이지</a>
							</li>
							<li class="nav-item cta-btn"><a
								class="btn btn-white btn-outline-white" style="border: 1px solid"
								onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</a></li>
						<%} else { %>
							<li class="nav-item cta-btn"><a id="logbtn-open-dialog"
								class="btn btn-white btn-outline-white login-btn" style="border: 1px solid">로그인</a>
							</li>
							<li class="nav-item cta-btn"><a id="regbtn-open-dialog"
								class="btn btn-white btn-outline-white regist-btn" style="border: 1px solid">회원가입</a></li>
						<%} %>

					</ul>

				</div>
			</div>
		</nav>
		
		<!--마이페이지 메뉴-->
		<%if(loginMember!=null) { %>
        <div id="myP-index">
            <nav class="nav-item nav-menu">
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/myInfoCheckPw?memberNo=<%=loginMember.getMemNo()%>">마이페이지</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/mySchedule?memberNo=<%=loginMember.getMemNo()%>">일정관리</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/myStudy?memberNo=<%=loginMember.getMemNo()%>">내 스터디</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/dibs?memberNo=<%=loginMember.getMemNo()%>">찜</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/myMemo?memberNo=<%=loginMember.getMemNo()%>">메모</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/payment?memberNo=<%=loginMember.getMemNo()%>">결제</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/myFork?memberNo=<%=loginMember.getMemNo()%>">내 포크</a>
                <a class="nav-link" href="<%=request.getContextPath()%>/myPage/setting?memberNo=<%=loginMember.getMemNo()%>"">환경설정</a>
            </nav>
        </div>
       	<%} %>
        <script>
        //마이페이지버튼  호버 시 애니메이션
            var flag = true;
            $(function() {
                $('#myM').hover(function() {
                    $('#myP-index').animate({
                        'left': '-100px'
                    }); console.log("hover");
                }, function() {
                    if(flag) {
                        $('#myP-index').animate({
                            'left': '-360px'
                        }); console.log("unhover");
                    }
                }); 
                $('#myM').click(function() {//마이페이지버튼  클릭 시 고정
                    flag=false;
                    console.log("click");
                }); 
            });

        </script>

	</header>
		

	<!-- END header -->