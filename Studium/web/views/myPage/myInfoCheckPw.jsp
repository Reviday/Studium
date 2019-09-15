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
            <div class="col-sm-3">

            </div>
             <div class="col-sm-6 navbar-myMenu" >
               <!-- 로그인 폼 -->
	
	<form action="<%=request.getContextPath() %>/myPage/myInfo" class="login-form-myInfo" id="my-confirmPw"  method="post">
		<h4>비밀번호 확인</h4>

		
		<div class="input-area">
			<input type="hidden" name="loginMember" value="<%=loginMember.getMemUserEmail()%>">
			<input type="password" name="password" id="password-confirm"> <span
				data-placeholder="Password"></span>
		</div>


		<div class="logbtn-form">
			<span class="logbtn-effect"></span> <span class="logbtn-effect"></span>
			<span class="logbtn-effect"></span> <span class="logbtn-effect"></span>
			<input type="submit" class="logbtn" value="비밀번호 확인">
		</div>
		



		<div class="bottom-text-myInfo">
			비밀번호를 잊으셨나요? <a href="#">비밀번호 찾기</a>
		</div>
	</form>
               
               
               
            </div>
            <div class="col-sm-3"></div>

        </div>


    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>
