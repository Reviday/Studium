<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="java.util.*,com.studium.story.model.vo.Story" %>
<%
	List <Story> slist = (List)request.getAttribute("slist");
	int totaldata = (int)request.getAttribute("totaldata"); 
	int Foreignlanguagetotaldata = (int)request.getAttribute("Foreignlanguagetotaldata"); 
	int Programmingtotaldata = (int)request.getAttribute("Programmingtotaldata"); 
	int Publicofficertotaldata = (int)request.getAttribute("Publicofficertotaldata"); 
	int Certificatetotaldata = (int)request.getAttribute("Certificatetotaldata");
	int Employmenttotaldata = (int)request.getAttribute("Employmenttotaldata"); 
%>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/story.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap">
    <style>
        /* 사이드바 스타일 */
        #review-level{
        	position:fixed;
        	right:0;
        	box-sizing:border-box;
        	width:15pc;
        	background:#fff;
        	border:1px solid #dcdcdc;
        	box-shadow:0 2px 6px 0 rgba(0,0,0,.1)
        	}
        .review-title{
        	margin: 0 24px;
    		color: #505050;
    		font-size: 18pt;
    		padding: 36px 0 9pt;
    		border-bottom: 2px solid #f2f2f2;
        }
        .level-list{
         	margin: 0;
    		padding: 0;
        }
        
        .level-select{
			display: block;
    		box-sizing: border-box;
    		height: 72px;
    		line-height: 72px;
    		padding-left: 24px;
    		color: #787878;
		}
		.level-select:hover {
    		padding-left: 20px;
    		border-left: 4px solid #ef6c00;
    		background: #f8f8f8;
    		color: #ef6c00;
		}
		.subjectName{
			 
    		color: #ef6c00;
		}
		
		
		}
      
    </style>
    
    <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
	<section class="allhugi">
        <!-- 전체후기페이지 -->
        <aside id="review-level">
            	<div class="review-title" href="<%=request.getContextPath()%>/score">종류별</div>
            	<ul class="level-list">
            	<li class="level-select-wrap">
            			<a class="level-select" href="<%=request.getContextPath()%>/story">전체(<%=totaldata%>)</a>
            		</li>
            		<li class="level-select-wrap">
            			<a class="level-select" href="<%=request.getContextPath()%>/story1">외국어(<%=Foreignlanguagetotaldata%>)</a>
            		</li>
            
            	
            		<li class="level-select-wrap">
            			<a class="level-select" href="<%=request.getContextPath()%>/story2">프로그래밍(<%=Programmingtotaldata%>)</a>
            		</li>
            	
            	
            		<li class="level-select-wrap">
            			<a class="level-select" href="<%=request.getContextPath()%>/story3">공무원(<%=Publicofficertotaldata%>)</a>
            		</li>
            	
            	
            		<li class="level-select-wrap">
            			<a class="level-select" href="<%=request.getContextPath()%>/story4">자격증(<%=Certificatetotaldata%>)</a>
            		</li>
            		<li class="level-select-wrap">
            			<a class="level-select" href="<%=request.getContextPath()%>/story5">취업준비(<%=Employmenttotaldata%>)</a>
            		</li>
            	</ul>
          
            </aside>
        <article class="allhugi">
            <!-- 가운데 맞춤 article -->
           
            <div class="hugiIntro">
                <!-- 배경사진 넣은 div -->
                <div>
                    <!-- 후기를 설명하는 div -->
                    <img src="img/story1.png" alt="">
                    <div>진짜~가 나타났다!</div>
                    <div>리얼 스터디 후기</div>
                    <div></div> <!-- 디자인선 -->
                    <div>스터디에 참여한 멤버들의 후기를 확인해보세요!</div>
                    <img src="img/story2.png" alt="">
                </div>
            </div>
             
            <div class="review">
                <div class="review-title">
                    <!-- 후기 -->
                 공무원 준비후기<a class="/story3">(<%=Publicofficertotaldata%>)</a>
          
    
                    
                </div>
                <div class="rine"></div> <!-- 구분선 -->
                <div class="reviewContainer">
                <%
               
                for(Story s : slist) { 
                %>
                    <!-- 후기 들어가는 div -->
                    <div class="reviewAll">
                        <!-- 개인후기 div -->
                         <img src="<%=request.getContextPath()%>/upload/myPage/<%=s.getStoryStudentpicture()%>"/>
                        
                        <!-- 후기올린 사람 사진 -->
                        <div class="reviewName">
                            <!-- 이름 -->
                          <%=s.getStoryWrite()%>
                          <span class="subjectName">
                        		 <%=s.getStorySubject()%>
                          </span>
                 
                        </div>
                        <div class="star">
		
		         <%if(s.getStoryStar()==1){ %>
				<img src="<%=request.getContextPath()%>/img/star1.png" width=100px; class="star">
			<%}else if(s.getStoryStar()==2) {%>
			<img src="<%=request.getContextPath()%>/img/star2.png" width=100px; class="star">
			<%}else if(s.getStoryStar()==3){ %>
			<img src="<%=request.getContextPath()%>/img/star3.png" width=100px; class="star">
			<%}else if(s.getStoryStar()==4){ %>
			<img src="<%=request.getContextPath()%>/img/star4.png" width=100px; class="star">
			<%}else if(s.getStoryStar()==5){ %>
			<img src="<%=request.getContextPath()%>/img/star5.png" width=100px; class="star">
			
			<%} else{%>
			
			<%} %>

		
		
		<div class="score">
		<b><%=s.getStoryStar() %></b>점
		</div>
		</div>
                        <div class="reviewContent">
                            <div class="reviewText">
                                <!-- 내용 -->
                               <%=s.getStoryContent()%>
                                 &nbsp; <span></span>
                            </div>
                            <div class="reviewTeacherTime">
                                <div class="reviewTime">
                                    <!-- 후기올린 시간 -->
                                    <%=s.getStoryTime()%>
                                </div>
                                <div class="reviewTeacher">
                                    <!-- 강사 이름, 사진 -->
                                    <div>
                                        <!-- 강사 이름 -->
                                        <%=s.getStoryTeachername()%>
                                    </div>
                                    <img src="<%=request.getContextPath()%>/upload/myPage/<%=s.getStoryTeacherpicture()%>"/>
                   
                                    <!-- 강사 사진 -->
                                    
                          </div>
                                
                            </div>
                              
                            <div class="reviewrine"></div> <!-- 후기 구분선 -->
                        
                        </div>
                      <%
                        }
                
                        %>
                    </div>
                         
                </div>
            </div>
        </article>
        
    </section>
 <%@ include file="/views/common/footer.jsp" %>  


