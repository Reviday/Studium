<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy" %>
 <%
 	Pstudy p=(Pstudy)request.getAttribute("pstudy");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>스터디소개페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/studyIntro.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style type="text/css">
   
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('<%=request.getContextPath()%>/img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
.header-background-cover {
         height: 95px;
         background-color: rgba(0,0,0,0.8);
      }
</style>
    
    
 
    
</head>

<body>
	 <%@ include file="../../views/common/header.jsp" %> 
    <section class="studyIntro">
        <!--스터디소개페이지-섹션 -->
        <article>
            <!-- 가운데 위치배치를 위한 article -->
            <div class="intro">
                <!-- 왼쪽에 위치한 메인 소개 div -->
                <div id="toast" ><span class="icon"></span><span class="message"></span></div>
                <div class="intro-img">
                    <!-- 이미지슬라이드 div -->
                    <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg1()%>" alt="">
                </div>

                <div class="intro-img">
                    <!-- 이미지슬라이드 div -->
                    <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg2()%>"
                        alt="">
                </div>

                <div class="intro-img">
                    <!-- 이미지슬라이드 div -->
                    <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg3()%>" alt="">
                </div>

                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                </div>



                <div class="intro-title">
                    <!-- 소개 title --> <%=p.getpTitle() %>
                    <div>
                        <!-- 스터디지역 -->
                       	<%=p.getpArea() %>
                    </div>
                    <div>
                        <!-- 스터디 타이틀 -->
                       <%=p.getpTitle() %>
                    </div>
                </div>
                <div class="intro-category">
                    <!-- 카테고리 div (fix) -->
                   	<%=p.getpCategory() %>
                </div>
                <div class="line-title-bottom"></div> <!-- 파트를 구분하는 선 div -->
                <div class="intro-content">
                    <!-- 소개 content -->
                    <div class="intro-content-study">
                        스터디소개
                    </div> <!-- 스터디 소개 텍스트 -->
                    <div>
                        <textarea cols="70" rows="40" readonly>
                       <%=p.getpIntro1() %><br><br>
                       <%=p.getpIntro2() %>
					</textarea>
                    </div> <!-- 스터디 소개 content -->
                </div>
                <div class="line-content-bottom"></div><!-- 파트를 구분하는 선 div -->
                <div class="study-information">
                    <!-- 스터디 상세정보 -->
                    <div>
                       		 상세 정보
                    </div>
                    <div>
                        <span class="info-left"><span style="color:#a0a0a0">지역:</span>
                            &nbsp;&nbsp;<span><%=p.getpArea() %></span></span>
                        <span class="info-right"><span style="color:#a0a0a0">인원:</span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><%=p.getpStudypserson() %></span></span> <br>
                        <span class="info-right"><span style="color:#a0a0a0">장소비:</span>
                            &nbsp;&nbsp;<span>포함</span></span> <br>
                        <span class="info-left"><span style="color:#a0a0a0">시간:</span>
                            &nbsp;&nbsp;<span>A그룹(화)</span></span> <span class="info-time"><%=p.getpDay() %></span> <br>
                        <span class="info">지금 신청하면&nbsp; <p><%=p.getpDatestart() %></p>&nbsp; 첫 스터디 시작!</span>
                    </div>
                </div>
                <div>
                 <% if(loginMember!=null&&loginMember.getMemUserEmail()=="admin@studium.com"){ %>
                 	<input type="image" src="<%=request.getContextPath()%>/img/delete.png" onclick="fn_delete();"/>
                 	<input type="image" src="<%=request.getContextPath()%>/img/update.png" onclick="fn_update();"/>
                 	<%}else{ %>
                 	<%} %>
                </div>
                <div class="line-information-bottom"></div> <!-- 파트를 구분하는 선 div -->
                <div class="review">
                    <!-- 스터디 후기 -->
                    <div class="review-1">
                        <h2>리더에 대한 후기</h2>
                        
                    </div>
                   
		<div>
			<%if(p.getpLike()==1){ %>
				<img src="<%=request.getContextPath()%>/img/star1.png" width=200px>
			<%}else if(p.getpLike()==2) {%>
			<img src="<%=request.getContextPath()%>/img/star2.png" width=200px>
			<%}else if(p.getpLike()==3){ %>
			<img src="<%=request.getContextPath()%>/img/star3.png" width=200px>
			<%}else if(p.getpLike()==4){ %>
			<img src="<%=request.getContextPath()%>/img/star4.png" width=200px>
			<%}else if(p.getpLike()==5){ %>
			<img src="<%=request.getContextPath()%>/img/star5.png" width=200px>
			<%} else{%>
			
			<%} %>
		
		<b><%=p.getpLike() %></b>점
		</div>
	
                    <div>
                        <div class="review-2">
                            <img src="https://cdn.studysearch.co.kr/images/users/201907/profile/1561957236" alt=""
                                style="width:76px; height: 76px;">
                            <div class="review-content">
  

                                <h2>김민주</h2>
                                <textarea name="" id="" cols="60" rows="6" readonly>
실제로 유용하게 쓰이는 문장들을 자주 읽고 반복하여 쉽고 재미있게 접근할수 있었습니다. 평소 영어로 말하기에 어려움을 겪고있던터라, 말하기 연습은 저에게 정말 유용했습니다. 영어에 어떻게 접근해야할지, 저에게 필요한 영어공부법은 무엇인지 깨닫게 해주는 소중한 경험이었습니다. 제이슨 감사합니당>__< bb
                            </textarea>
                                <div>
                                    노하우 가득한 리더, Jason의 꿀잼 스터디로 회화두려움 극복
                                </div>
                                <div>
                                    2019년 8월
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pay">
                <!-- 오른쪽에 위치한 신청 고정 div -->
                <div>
                    <!-- 신청 타이틀 -->
                   <%=p.getpTitle() %>
                </div>
                <div class="pay-line"></div> <!-- 구분 선 -->
                <div class="pay-date">
                    <!-- 스터디 기간 -->
                    <img src="https://cdn.studysearch.co.kr/static/images/purchase/item_radio_checked.1f99efef95e3.png"
                        alt="">
                        
                    <span>~<%=p.getpDateend() %></span>
                </div>
                <div class="pay-line1"></div> <!-- 구분 선 -->
                <div class="pay-pay">
                    <!-- 참가비용 -->
                    <span>참가비</span>
                    <span><%=p.getpPrice() %></span>
                </div>
                <div class="sinchung">
                    <!-- 신청 버튼 -->
                    <input type="button" value="참여 신청하기" onclick="fn_pay();">
                </div>
                <div class="zzim">
                    <!-- 찜하기 버튼 -->
                    <span class="icon"></span>
                    <input type="button" value="찜하기" onclick="fn_zzim();">
                </div>
                <div class="pay-line"></div> <!-- 구분 선 -->
                <div class="hugi">
                    <!-- 후기 버튼 -->
                    <a href="">
                        <stong>100% 리얼 후기</stong> (5735)
                    </a>
                </div>
                <div class="pay-line"></div> <!-- 구분 선 -->
            </div>
        </article>
    </section>
    <script>
    	function fn_zzim(){
    		
    	}
        $(function () {
            $(window).scroll(function () { 
                var num = $(this).scrollTop();
                if (num > 40) { 
                    $(".pay").css("position", "fixed");
                    $(".pay").css("top", "0");
                } else {
                    $(".pay").css("position", "absolute");
                    $(".pay").css("top", "39px");
                }
            });
        });

        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("intro-img");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }
        function fn_delete(){
        	var msg = "삭제하시겠습니까";
    		var flag = confirm(msg);
    		if(flag==true) {
    		location.href="<%=request.getContextPath()%>/pstudy/pstudyDelete?pNo=<%=p.getpNo()%>";
    		}
    		else alert("취소하였습니다.");
        }
        function fn_update(){
        	
        	location.href="<%=request.getContextPath()%>/pstudy/pstudyUpdate?pNo=<%=p.getpNo()%>";
        }
        function fn_loginAlert(){
        	alert("로그인후 이용하세요 ");
        	return false;
        }
        function fn_pay(){
        	if(<%=loginMember!=null%>){
        		location.href="<%=request.getContextPath()%>/pstudy/pstudyPay?pNo=<%=p.getpNo()%>&mPoint=<%=loginMember.getMemPoint()%>";
    		}else{
    			fn_loginAlert();
    			return false;
    		
        	
  
    		}
        }
        
    </script>
    
     <script src="<%=request.getContextPath() %>/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath() %>/js/star.js"></script>
 <%@ include file="../../views/common/footer.jsp" %> 
</body>

</html>



</body>
</html>