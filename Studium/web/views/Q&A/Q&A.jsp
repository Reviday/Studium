<%@page import="com.studium.admin.model.vo.FAQ"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<FAQ> list = (List)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자주묻는 질문</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="./css/leaderIntro.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Q&A.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <style>
    	
			.header-background-cover {
				height: 95px;
         		background-color: rgba(0,0,0,0.8);
			}	
    </style>
</head>

<body>
<%@ include file="/views/common/header.jsp" %>
 <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>  
    <section>
        <div class="back" style="background-image: url('https://cdn.studysearch.co.kr/static/images/faq/image_header_faq.814e6778c4cd.jpg')">
        </div>
        <h2 id="question">무엇을 도와드릴까요?</h2>
        <article class="QandA">
            <div>자주 묻는 질문</div>
            <ul>
            	<%for(FAQ f : list) {%>
                <li>
                    <a id="a1" class="choice">
                        <span>Q.</span>
                        <span>[<%=f.getFaqType() %>]</span>
                        <span><%=f.getFaqTitle() %></span>
                    </a>
                    <div class="answer">
                        <span>A.</span>
                        <span>
                        	<%=f.getFaqContent() %>
                        </span>
                    </div>
                </li>
                <%} %>

                <li>
                    <div class="bt">혹시 어떤 스터디가 나에게 맞을지, 고민되시는 거라면?</div>
                    <a class="consult-link" href="http://pf.kakao.com/_PqxlWT">
                        스터디 추천받기 >
                    </a>
                </li>
            </ul>
        </article>
        <div class="line"></div>
        <article class="helf">
            <div class="helf-left">
                <div>도움이 필요하신가요?</div>
                <div>
                    걱정 마세요. 스터디움에게 <span>1:1문의</span>를 해주세요 <br>
                    접수 후 영업일 기준 3일 내로 답변 받으실 수 있습니다.
                </div>
            </div>
            <div class="helf-right">
                <form action="<%=request.getContextPath()%>/qandA" method="post" onsubmit="return validate()">
                    <textarea name="content" id="content" cols="30" rows="10" placeholder="무엇을 도와드릴까요? 문의하실 내용을 적어주세요."></textarea>
                    <input type="email" placeholder="답변받을 이메일 주소" id="email" name="email">
                    <input type="submit" value="문의하기" class="submit">
                </form>
            </div>
        </article>
    </section>

    <script>
        
         $(function() {
             $('.choice').click(function(e) {
                var classVal=e.target.className;
                $('.choice').next().removeClass('show');
                $('.choice').removeClass('showw').children().removeClass("showw");
                $(this).next().addClass('show');
                $(this).addClass('showw');
                $(this).children().addClass("showw");
                if(classVal.includes("showw")){
                    $(this).next().removeClass('show');
                    $(this).removeClass('showw').children().removeClass("showw");
                }
             });

         })

        function validate(){
			if($("#content").val().trim().length==0){
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
			if($("#email").val().trim().length==0){
				alert("답변받으실 이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
			
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
			 
			if(!emailRule.test($("#email").val())) {            
				alert("이메일 양식에 맞게 입력하세요.");       
			    return false;
			}
            alert("문의가 접수되었습니다.");
			return true;
		}
         
         
    </script>
    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>