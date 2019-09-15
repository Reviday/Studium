<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member"%>
<% 
	Member m=(Member)request.getAttribute("member");

%>
 
<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}
</style>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>


    <div class="section-content" style="background-color: rgb(240, 240, 240)">
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8" style=" margin-top:20px">
                <img src="<%=request.getContextPath()%>/img/book.jpg " alt=" " class="img-category ">
                <div class="myShopping ">
                    <h3>ㅇㅇㅇ 님의 스터디</h3>
                    <div class="shopping-1 ">
                        <p class="sort studyM ">진행중인 스터디</p>
                        <span> | </span>
                        <p class="sort studyN ">지난 스터디</p>
                    </div>
                </div>




                <div class="study-list">
                    <h5>진행중인 스터디</h5>
                    <div class="row">
                        <div data-aos="fade-up" class="study-card col-12">
                            <div class="study">
                                <img src="<%=request.getContextPath()%>/img/s1.jpg" class="study-main-img">
                            </div>

                            <img src="<%=request.getContextPath()%>/img/3.jpg" class="study-reader-img">
                            <div class="study-context">
                                <h3>강동원과 함께하는 스터디</h3>
                                <p>2019년 12월 1일<span>진행중</span></p>
                                <p>강동원</p>
                                <button class="btn btn-gotochat">채팅방 가기</button>
                                <button class="btn btn-gotochat">후기 작성</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div data-aos="fade-up" class="study-card col-12">
                            <div class="study">
                                <img src="<%=request.getContextPath()%>/img/s1.jpg" class="study-main-img">
                            </div>

                            <img src="<%=request.getContextPath()%>/img/3.jpg" class="study-reader-img">
                            <div class="study-context">
                                <h3>강동원과 함께하는 스터디</h3>
                                <p>2019년 12월 1일<span>진행중</span></p>
                                <p>강동원</p>
                                <button class="btn btn-gotochat">채팅방 가기</button>
                                <button class="btn btn-gotochat">후기 작성</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div data-aos="fade-up" class="study-card col-12">
                            <div class="study">
                                <img src="<%=request.getContextPath()%>/img/s1.jpg" class="study-main-img">
                            </div>

                            <img src="<%=request.getContextPath()%>/img/3.jpg" class="study-reader-img">
                            <div class="study-context">
                                <h3>강동원과 함께하는 스터디</h3>
                                <p>2019년 12월 1일<span>진행중</span></p>
                                <p>강동원</p>
                                <button class="btn btn-gotochat">채팅방 가기</button>
                                <button class="btn btn-gotochat">후기 작성</button>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <div class="col-sm-2 "></div>
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>
