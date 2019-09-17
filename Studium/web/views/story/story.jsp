<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/story.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap">
    <style>
        /* 사이드바 스타일 */
        .sidenav {
            height: 50%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            right: 0;
            background-color: rgb(240, 26, 80);
            /* overflow-x: hidden; */
            transition: 0.7s ease-in-out;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: white;
            display: block;
            transition: 0.7s ease-in-out;
        }

        .sidenav a:hover,
        .offcanvas a:focus {
            color: black;
        }

        .closebtn {
            position: absolute;
            top: 0;
            right: -20px;
            font-size: 10px !important;
            margin-left: 50px;
        }

        .openmenu:hover {
            color: red;
            transition: 0.5s ease-in;
        }

        .openmenu {
            font-size: 15px;
            cursor: pointer;
            transition: 0.5s ease-in;
        }

        .supText {
            vertical-align: super;
            font-size: small;
            color: red;
        }

        /* .openmenu > i {
            font-size: 30px;
        } */
        /* 미디어쿼리 적용 */
        @media screen and (max-height:450px) {
            .sidenav {
                padding-top: 15px;
            }

            .sidenav a {
                font-size: 18px;
            }
        }
    </style>
    
    <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
	<section class="allhugi">
        <!-- 전체후기페이지 -->
        <article class="allhugi">
            <!-- 가운데 맞춤 article -->
            <div class="hugiIntro">
                <!-- 배경사진 넣은 div -->
                <div>
                    <!-- 후기를 설명하는 div -->
                    <img src="img/검은색영어.png" alt="">
                    <div>진짜~가 나타났다!</div>
                    <div>리얼 스터디 후기</div>
                    <div></div> <!-- 디자인선 -->
                    <div>스터디에 참여한 멤버들의 후기를 확인해보세요!</div>
                    <img src="img/전체후기(디자인용).png" alt="">
                </div>
            </div>
            <div class="review">
                <div class="review-title">
                    <!-- 후기 -->
                    초급 후기 <span>(1)</span>
                    <br>
                    <div id="mysidenav" class="sidenav">
                        <a href="#" class="closebtn" onclick='closeNav()'>x를 눌러 joy를 표하십시오</a>
                        <a href="introduction .html">입문후기</a>
                        <a href="beginner.html">초급후기</a>
                        <a href="intermediate level.html">중급후기</a>
                        <a href="a high class.html">고급후기</a>

                    </div>


                    <span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5"
                            aria-hidden="true"></i>레벨별 후기 만나보기<sup class="supText">click!</sup></span>

                    <script>
                        function openNav() {
                            document.getElementById('mysidenav').style.width = '250px';
                        }
                        function closeNav() {
                            document.getElementById('mysidenav').style.width = '0';
                        }
                    </script>
                </div>
                <div class="rine"></div> <!-- 구분선 -->
                <div class="reviewContainer">
                    <!-- 후기 들어가는 div -->
                    <div class="reviewAll">
                        <!-- 개인후기 div -->
                        <img src="https://cdn.clien.net/web/api/file/F01/7204370/101c3b18a512f9.jpg?w=780&h=30000&gif=true" alt="">
                        <!-- 후기올린 사람 사진 -->
                        <div class="reviewName">
                            <!-- 이름 -->
                            김예림
                        </div>
                        <div class="star">
                            <!-- 별점 -->
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="reviewContent">
                            <div class="reviewText">
                                <!-- 내용 -->
                                우리 예리쌤 너무 이쁘고 완벽한 발음으로 진짜 현지에서 쓰는 영어를 가르쳐주셨어요! <br>
                                또한 엄청난 인싸력으로 재밌는 행사 만들어주셔서 너무 좋았습니다!!&nbsp; <span></span>
                            </div>
                            <div class="reviewTeacherTime">
                                <div class="reviewTime">
                                    <!-- 후기올린 시간 -->
                                    오전 2시 22분
                                </div>
                                <div class="reviewTeacher">
                                    <!-- 강사 이름, 사진 -->
                                    <div>
                                        <!-- 강사 이름 -->
                                        Yeri Mina
                                    </div>
                                    <img src="https://t1.daumcdn.net/cfile/tistory/99A1753F5B7DB0BD1A" alt="">
                                    <!-- 강사 사진 -->

                                </div>
                            </div>
                            <div class="reviewrine"></div> <!-- 후기 구분선 -->
                        </div>
                    </div>
                </div>
            </div>
        </article>
    </section>
<%@ include file="/views/common/footer.jsp" %>