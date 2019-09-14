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

    <div class="section-content">
        <div class="row">
            <div class="col-sm-2">
                
            </div>
            <div class="col-sm-8 navbar-myMenu" style=" margin-top:20px">
                <div class="myName">
                    <blockquote class="testimonial">
                        <div class="d-flex author">
                            <img src="<%=request.getContextPath()%>/img/3.jpg" alt="" class="mr-4">
                            <div class="author-info">
                                <div>
                                    <h3 class="float-left "><%=m.getMemName()%></h3>
                                    <div class="btn btn-sm btn-change" style="border:1px solid">사진변경</div>
                                </div>


                                <div style="margin-top:50px">
                                    스타디움은 사람들과 얼굴을 마주하고 오프라인에서 만남을 가지는 모임입니다. 사진을 통해 회원님에 대해 알려주세요. :)
                                </div>
                            </div>
                        </div>
                    </blockquote>
                </div>
                <div class="myInfo">
                    <h5>내 정보</h5>
                    <div class="row">
                        <div class="col-5">
                            <p class="myI-0">이름</p>
                            <p class="myI-0">전화번호</p>
                            <p class="myI-0">이메일</p>
                            <p class="myI-0">주소</p>
                            <p class="myI-0">비밀번호</p>
                            <p class="myI-0">비밀번호 확인</p>
                            <p class="myI-0">관심목록</p>
                        </div>
                        <div class="col-7">
                            <form>
                                <div class="inputForm">
                                    <input type="text" name="name" id="name" class="myI-1" autocomplete=off placeholder="<%=m.getMemName()%>" readonly>
                                </div>
                                <div class="inputForm">
                                    <input type="text" name="phone" id="phone" class="myI-1" autocomplete=off placeholder="<%=m.getMemPhone()%>" required>
                                </div>
                                <div class="inputForm">
                                    <input type="email" name="email" id="email" class="myI-1" autocomplete=off placeholder="<%=m.getMemUserEmail()%>" readonly>
                                </div>
                                <div class="inputForm">
                                    <input type="text" name="address" id="address" class="myI-1" autocomplete=off placeholder="<%=m.getMemAddress1()%>" required>
                                </div>

                                <div class="inputForm">
                                    <input type="password" name="pwd" id="pwd" class="myI-1" required>
                                </div>

                                <div class="inputForm">
                                    <input type="password" name="pwdck" id="pwdck" class="myI-1" required>
                                </div>
                                <div class="tag_cloud_widget">
                                    <ul class="list">
                                        <li>
                                            <a href="#">English</a>
                                        </li>
                                        <li>
                                            <a href="#">Java</a>
                                        </li>
                                        <li>
                                            <a href="#">JavaScript</a>
                                        </li>
                                        <li>
                                            <a href="#">DataBase</a>
                                        </li>
                                        <li>
                                            <a href="#">정처기실기</a>
                                        </li>
                                        <li>
                                            <a href="#">중국어</a>
                                        </li>
                                        <li>
                                            <a href="#">경찰공무원</a>
                                        </li>
                                        <li>
                                            <a href="#">photoshop</a>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <button class="btn-sm btn-changeInfo">수정하기</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>



            </div>
            <div class="col-sm-2"></div>

        </div>


    </div>

</section>

<%@ include file="/views/common/footer.jsp"%>
