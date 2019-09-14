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
                <img src="<%=request.getContextPath()%>/img/dib.png" alt=" " class="img-category ">

                <div class="myShopping ">
                    <h3>찜 목록</h3>
                    <div class="shopping-1 ">
                        <p class="sort studyM ">강사스터디</p>
                        <span> | </span>
                        <p class="sort studyN ">일반스터디</p>
                    </div>
                </div>



                <div class="study-list">
                    <h5>내가 찜한 스터디</h5>
                    <div class="row ">
                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top">
                                <p>홍대 | 초급</p>
                                <h5>강참치와 함께하는 스터디</h5>
                                <p class="card-price">24000원</p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/img/4.jpg" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="img/1.jpg">
                            </div>
                        </div>

                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top">
                                <p>홍대 | 초급</p>
                                <h5>스터디</h5>
                                <p class="card-price">24000원</p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/img/5.jpg" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="img/1.jpg">
                            </div>
                        </div>


                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top">
                                <p>홍대 | 초급</p>
                                <h5>스터디</h5>
                                <p class="card-price">24000원</p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/img/3.jpg" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="img/1.jpg">
                            </div>
                        </div>

                    </div>
                    <div class="row ">
                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top">
                                <p>홍대 | 초급</p>
                                <h5>강참치와 함께하는 스터디</h5>
                                <p class="card-price">24000원</p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/img/4.jpg" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="img/1.jpg">
                            </div>
                        </div>

                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top">
                                <p>홍대 | 초급</p>
                                <h5>스터디</h5>
                                <p class="card-price">24000원</p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/img/5.jpg" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="img/1.jpg">
                            </div>
                        </div>


                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top">
                                <p>홍대 | 초급</p>
                                <h5>스터디</h5>
                                <p class="card-price">24000원</p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/img/3.jpg" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="<%=request.getContextPath()%>/img/1.jpg">
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
