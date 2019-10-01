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


<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
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


<!-- 움직이는메뉴바 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/svgs/fi-list.svg" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/myNavigation.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/1.0.0/anime.js"></script>
<!-- 하단메뉴바 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/myPageMenu.css">
 <link href="<%=request.getContextPath()%>/css/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
 
<!-- Theme Style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
 <!--애니메이션-->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<!-- aos 애니메이션-->
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
</head>
<style>


</style>

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
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/story">스터디후기</a>

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
    
   		 <div class="center menu">
              <div id="myMenu"></div>
         </div>
  		<%}%> 
		
		
       	
	</header>
<script>

var timeOut;
var Item = /** @class */ (function () {
 function Item(icon, backgroundColor) {
     this.$element = $(document.createElement("div"));
     this.icon = icon;
     this.$element.addClass("item");
     this.$element.css("background-color", backgroundColor);
     var i = document.createElement("i");
     $(i).addClass("fi-" + icon);
     this.$element.append(i);
     this.prev = null;
     this.next = null;
     this.isMoving = false;
     var element = this;
     this.$element.on("mousemove", function () {
         clearTimeout(timeOut);
         timeOut = setTimeout(function () {
             if (element.next && element.isMoving) {
                 element.next.moveTo(element);
             }
         }, 10);
     });
 }
 Item.prototype.moveTo = function (item) {
     anime({
         targets: this.$element[0],
         left: item.$element.css("left"),
         top: item.$element.css("top"),
         duration: 700,
         elasticity: 500
     });
     if (this.next) {
         this.next.moveTo(item);
     }
 };
 Item.prototype.updatePosition = function () {
     anime({
         targets: this.$element[0],
         left: this.prev.$element.css("left"),
         top: this.prev.$element.css("top"),
         duration: 80
     });
     if (this.next) {
         this.next.updatePosition();
     }
 };
 return Item;
}());
var Menu = /** @class */ (function () {
 function Menu(menu) {
     this.$element = $(menu);
     this.size = 0;
     this.first = null;
     this.last = null;
     this.timeOut = null;
     this.hasMoved = false;
     this.status = "closed";
 }
 Menu.prototype.add = function (item) {
     var menu = this;
     if (this.first == null) {
         this.first = item;
         this.last = item;
         this.first.$element.on("mouseup", function () {
             if (menu.first.isMoving) {
                 menu.first.isMoving = false;
             }
             else {
                 menu.click();
             }
         });
         item.$element.draggable({
             start: function () {
                 menu.close();
                 item.isMoving = true;
             }
         }, {
             drag: function () {
                 if (item.next) {
                     item.next.updatePosition();
                 }
             }
         }, {
             stop: function () {
                 item.isMoving = false;
                 item.next.moveTo(item);
             }
         });
     }
     else {
         this.last.next = item;
         item.prev = this.last;
         this.last = item;
     }
     this.$element.after(item.$element);
 };
 Menu.prototype.open = function () {
     this.status = "open";
     var current = this.first.next;
     var iterator = 1;
     var head = this.first;
     console.log(head);
     var sens = -1;
     while (current != null) {
         anime({
             targets: current.$element[0],
             left: parseInt(head.$element.css("left"), 10) + (sens * (iterator * 50)),
             top: head.$element.css("top"),
             duration: 500
         });
         iterator++;
         current = current.next;
     }
 };
 Menu.prototype.close = function () {
     this.status = "closed";
     var current = this.first.next;
     var head = this.first;
     var iterator = 1;
     while (current != null) {
         anime({
             targets: current.$element[0],
             left: head.$element.css("left"),
             top: head.$element.css("top"),
             duration: 500
         });
         iterator++;
         current = current.next;
     }
 };
 Menu.prototype.click = function () {
     if (this.status == "closed") {
         this.open();
     }
     else {
         this.close();
     }
 };
 return Menu;
}());
var menu = new Menu("#myMenu");
var item1 = new Item("list");
var item2 = new Item("torso", "#5CD1FF");
var item3 = new Item("bookmark", "#ff7f00");
var item4 = new Item("heart", "#FF5C5C");
var item5 = new Item("credit-card", "#FFF15C");
var item6 = new Item("clipboard-pencil", "#D358F7");
var item7 = new Item("widget", "#64F592");


menu.add(item1);
menu.add(item2);
menu.add(item3);
menu.add(item4);
menu.add(item5);
menu.add(item6);
menu.add(item7);

<%if(loginMember!=null) { %>
$('.fi-torso').click(function(){//마이페이지
	window.location.href='<%=request.getContextPath()%>/myPage/myInfoCheckPw?memberNo=<%=loginMember.getMemNo()%>';
});
$('.fi-bookmark').click(function(){//내스터디
	window.location.href='<%=request.getContextPath()%>/myPage/myStudy?memberNo=<%=loginMember.getMemNo()%>';
});

$('.fi-heart').click(function(){//찜
	window.location.href='<%=request.getContextPath()%>/myPage/divs?memberNo=<%=loginMember.getMemNo()%>';
});

$('.fi-credit-card').click(function(){//결제
	window.location.href='<%=request.getContextPath()%>/myPage/payment?memberNo=<%=loginMember.getMemNo()%>';
});

$('.fi-widget').click(function(){//마이페이지
	window.location.href='<%=request.getContextPath()%>/myPage/setting?memberNo=<%=loginMember.getMemNo()%>';
});

$('.fi-clipboard-pencil').click(function(){//메모
	window.location.href='<%=request.getContextPath()%>/myPage/myMemo?memberNo=<%=loginMember.getMemNo()%>';
});





<%}%>
$(document).delay(50).queue(function (next) {
 menu.open();
 next();
 $(document).delay(500).queue(function (next) {
     menu.close();
     next();
 });
});

       
</script>
	<!-- END header -->