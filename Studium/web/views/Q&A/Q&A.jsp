<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body>
<%@ include file="/views/common/header.jsp" %>
    <section>
        <div class="back" style="background-image: url('https://cdn.studysearch.co.kr/static/images/faq/image_header_faq.814e6778c4cd.jpg')">
        </div>
        <h2 id="question">무엇을 도와드릴까요?</h2>
        <article class="QandA">
            <div>자주 묻는 질문</div>
            <ul>
                <li>
                    <a href="#a1" id="a1" class="choice">
                        <span>Q.</span>
                        <span>[취소 및 환불]</span>
                        <span>환불 요청은 어떻게 하나요?</span>
                    </a>
                    <div class="answer">
                        <span>A.</span>
                        <span>
                            환불/교환문의는 카카오톡 플러스친구 카카오톡 플러스친구 @스터디움 을 통해 안내드리고 있습니다. <br>
                            친구추가 후 1:1메시지를 통해 '성함', '연락처'및 환불/교환문의를 남겨주세요
                        </span>
                    </div>
                </li>
                <li>
                    <a href="#a2" id="a2" class="choice">
                        <span>Q.</span>
                        <span>[취소 및 환불]</span>
                        <span>환불 금액은 언제 입금되나요?</span>
                    </a>
                    <div class="answer">
                        <span>A.</span>
                        <span>
                            스터디 환불은 신청자의 환불 신청일에 따라 환불규정이 적용되며, <br>
                            스터디움 상담원이 확인 후 즉시 환불안내를 진행합니다 :) <br>
                            <br> 
                            카드 환불/승인취소의 경우 결제사와 카드사의 행정업무 부분으로, <br>
                            사정상 최대 7 영업일이 소요될 수 있으며, <br>
                            정확한 환불/승인취소 일자는 상품 구매자인 회원님께서 직접 카드사를 통해 문의하셔야 확인이 가능합니다. <br>
                            <br>
                            가상계좌 환불은 말씀해주신 계좌로 입급되며, <br>
                            결제사의 행정업무 부분으로 사정상 최대 3영업일이 소요될 수 있습니다. <br>
                        </span>
                    </div>
                </li>
                <li>
                    <a href="#a3" id="a3" class="choice">
                        <span>Q.</span>
                        <span>[서비스 사용]</span>
                        <span>후기는 어떻게 작성하나요?</span>
                    </a>
                    <div class="answer">
                        <span>A.</span>
                        <span>
                            스터디움에 있는 후기는 스터디움 커뮤니티의 강사와 참가자가 남긴 것으로, 모두 스터디 참가 후 작성된 것입니다. <br>
                            <br>
                            정해진 회차의 스터디가 종료되면, 상대방이 나에 대해 후기를 보냅니다. 상대방이 보낸 후기를 읽으려면 회원님도 <br><br> 상대방에 대한 후기를 작성해주세요. <br>
                            <br>
                            작성 후 나에 대한 후기를 확인하실 수 있습니다. <br>
                            <br>
                            내가 보낸 후기와 나에 대한 후기는 프로필 페이지에서 확인할 수 있습니다.
                        </span>
                    </div>
                </li>
                <li>
                <a href="#a4" id="a4" class="choice">
                    <span>Q.</span>
                    <span>[스터디 진행]</span>
                    <span>스터디 신청 후 뭘 해야하나요?</span>
                </a>
                <div class="answer">
                    <span>A.</span>
                    <span>
                        스터디 참석을 위한 비용결제가 완료되면, 강사님의 환영메세지를 받아보실 수 있을거에요! <br>
                        강사님의 환영 메세지는 스터디움 서비스 1:1 메세지함을 통해 발송되니 꼭! 확인 부탁드리구요 ㅎㅎ <br>
                        <br>
                        스터디 첫 시작전에 스터디 단톡방에 초대하여 함께 스터디에 참여할 회원분들과 함께 스터디에 대해 <br>
                        자세한 안내 도와드릴게요 ㅎㅎ <br>
                        즐거운 스터디되세요!
                    </span>
                </div>
                </li>
                <li>
                    <a href="#a5" id="a5" class="choice">
                        <span>Q.</span>
                        <span>[스터디 진행]</span>
                        <span>스터디에는 어떤 사람들이 참가하나요?</span>
                    </a>
                    <div class="answer">
                        <span>A.</span>
                        <span>
                            스터디움에서 운영하는 모든 스터디는 성인 회원들을 대상으로 진행합니다. <br>
                            <br>
                            스터디에 참여하시는 분들은 대학생부터 직장인, 가정주부등 다양해요 ㅎㅎ <br>
                            스터디에 참여하셔서 함께 참여하시는 참가자분들과 즐거운 공부 하시겠어요? <br>
                            <br>
                            참가하시는 분들은 다양한 목적을 가지고 스터디에 참여하셔서 <br>
                            내가 살아보지 못한 삶에 대한 많은 이야기를 간접적으로나마 경험하실 수 있을거에요!!
                        </span>
                    </div>
                </li>
                <li>
                    <a href="#a6" id="a6" class="choice">
                        <span>Q.</span>
                        <span>[결제]</span>
                        <span>현장에서 현금으로 드리면 안되나요?</span>
                    </a>
                    <div class="answer">
                        <span>A.</span>
                        <span>
                            현장 결제는 불가합니다. <br>
                            <br>
                            강사와 스터디원 사이의 금전적인 분쟁을 방지하기 위해, 결제는 스터디움이 중개자로서 대행합니다.
                        </span>
                    </div>
                </li>
                <li>
                    <a href="#a7" id="a7" class="choice">
                        <span>Q.</span>
                        <span>[결제]</span>
                        <span>결제수단 추가나 삭제는 어떻게 하나요?</span>
                    </a>
                    <div class="answer"> 
                        <span>A.</span>
                        <span>
                            결제수단 추가는 결제 단계에서 "카드 추가"를 눌러서 진행해주시면 됩니다. 결제수단 삭제는 <br><br>
                            이메일이지롱@gmail.com으로 아이디와 삭제를 원하시는 결제수단을 보내주시면 바로 삭제 도와드리겠습니다.
                        </span>
                    </div>
                </li>
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
        var choiceClick;
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