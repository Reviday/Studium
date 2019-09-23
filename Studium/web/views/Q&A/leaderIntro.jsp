<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/leaderIntro.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <style>
    	
			.header-background-cover {
				height: 95px;
         		background-color: rgba(0,0,0,0.8);
			}	
    </style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
 <section>
        <!-- 리더지원소개페이지 섹션 -->
        <div class="picture">
            <!-- 상단 div -->
            <img src="https://cdn.studysearch.co.kr/static/images/host_apply/ayden-banner.a0a02d549a4a.jpg" alt=""> <!-- 메인 사진 -->
            <div>
                스터디움 강사가 되어 <br>
                공부의 즐거움을 선사하세요.
            </div>
            <a href="<%=request.getContextPath() %>/leader/leaderForm">Apply Now</a> <!-- 지원페이지로 이동하는 a태그 -->
            <p>강사 지원 페이지로 이동합니다.</p>
        </div>
        <article>
            <!-- 중앙 아티클 -->
            <div class="marginAuto">
                <!-- 가운데 위치 잡아주는 div -->
                <p>스터디움 강사의 장점</p>
                <div class="positive"> <!-- 장점 div -->
                    <div class="positive1"> <!-- 수입 -->
                        <div class="picture1"></div> <!-- 사진 -->
                        <div>수입을 기대하세요.</div>
                        <div>
                            내가 편한 지역, 편한 시간에 <br>
                            스터디를 개설해 수입을 <br> 
                            확보할 수 있습니다.
                        </div>
                    </div>
                    <div class="positive2"> <!-- 사람 -->
                        <div class="picture2"></div> <!-- 사진 -->
                        <div>다양한 사람을 만나세요.</div>
                        <div>
                            대학생부터 직장인까지, <br> 
                            다양한 사람들과 함께하는 <br> 
                            스터디를 운영해보세요.
                        </div>
                    </div>
                    <div class="positive3"> <!-- 감 유지 -->
                        <div class="picture3"></div> <!-- 사진 -->
                        <div>공부의 감 유지</div>
                        <div>
                            스터디를 진행하며 담당 분야의 <br>
                            실력을 유지할 수 있습니다.
                        </div>
                    </div>
                </div>
                <div class="rine"></div> <!-- 구분선 -->
                <div class="english"> <!-- 있어보이는 영어 -->
                    <div class="left"> <!-- 왼쪽 -->
                        <div>Be one of our Leaders!</div>
                        <div>
                            <span>먼저 <a href="">강사 지원서</a>를 확인 및 작성해주세요.</span> <br>
                            개설 가능한 지역 및 시간대, 예상 수입에 대해 <br>
                            7일 이내로 안내를 드리겠습니다!
                        </div>
                        <div>
                            7일 이후에도 메일이 오지 않는다면 <br>
                            <a href="mailto:rlduddms1@gmail.com">이거슨이메일@gmail.com</a>으로 연락주세요
                        </div>
                    </div>
                    <div class="right"> <!-- 오른쪽 -->
                        <img src="https://cdn.studysearch.co.kr/static/images/host_apply/hanna.4d0fc914f62a.png" alt="">
                    </div>
                </div>
            </div>
        </article>
    </section>
   <%@ include file="/views/common/footer.jsp" %>
</body>
</html>