<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.studium.fstudy.model.vo.Fstudy" %>
 <%
 	Fstudy p=(Fstudy)request.getAttribute("fstudy");

 %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>스터디소개페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/studypay.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<style>
	body{
	background-color: #eeeeee !important;
}
	.progressimg{
		align-content: left;
	}
	
	.progress-bar{
	     justify-content: left !important;
	}
	.confirmed #con-text {
    vertical-align: left;
    display: inline-block;
    width: 500px !important;
    height: 50px;
}
.confirmed {
    margin-top: 10px;
    background-color: #fff !important;
    border: none !important;
    border-radius: 3px;
    font-size: 16px !important;
    font-weight: 600;
    padding: 5px;
    height: 50px;
    display: inline-block;
    width: 100%;
    text-align: center;
}
	#memberPrice{
     font-size: 20px !important;
      color: #ef6c00;
   }
   #studyPricePrice{
     font-size: 20px !important;
      color: #ef6c00;
   }
   #resultPrice{
     font-size: 20px !important;
      color: #ef6c00;
   }
  
  #product-order-section #stage1 .fields dd .first-meeting-guide .first-meeting-value {
    margin-top: 9pt;
    width: 70%;
    height: 3pc;
    line-height: 3pc;
    padding-left: 14px;
    border: 1px solid #c8c8c8;
    border-radius: 4px;
    font-size: 9pt;
}
.header-background-cover {
         height: 95px;
         background-color: rgba(0,0,0,0.8);
      }
</style>
<body>
	<%@ include file="../../views/common/header.jsp" %> 
    <div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>

    <section class="studyIntro">
        <form action="" id="order-form" class="stage1">
            <article>
                <div id="page-wrap">
                    <div class="progress-bar"> <img src="<%=request.getContextPath()%>/img/studium_ko_logo_white.png" alt="" class="progressimg"> 
                    &nbsp;&nbsp;&nbsp;	<span>스터디움        </span> 
                    <div style="margin-left: 450px;"> 참여 신청</div>
                      <div style="margin-left: 250px;"> 결제</div>
                    </div>
                    <table>
                        <tr id="product-info-columns">
                            <th class="product">스터디 </th>
                            <th class="item"> 일정</th>
                            <th class="price"> 가격 </th>
                        </tr>
                        <tr id="product-info-content">
                            <td class="product2">
                                <div class="product-image" style="background: url('<%=request.getContextPath()%>/upload/pstudy/<%=p.getfImgtitle()%>') 50% 50% / cover no-repeat;">
                                </div>
                                <div class="product-texts">
                                    <span class="area"> <%=p.getfArea() %></span>
                                    <span class="title"><%=p.getfTitle() %></span>
                                </div>
                            </td>
                            <td class="item2"> <%=p.getfDatestart() %>~
                                <%=p.getfDateend() %>
                            </td>
                          
                            <td class="price2" >  </td>
                        </tr>
                    
                       
                    </table>
                    <table>
                     <tr id="product-info-columns" style="">
                        	<th class="product">보요중인 포인트</th>
                        	<th class="item">스터디 포인트 가격</th>
                        	<th class="price">결제 후 포인트 </th>
                        </tr>
                        <tr id="product-info-content">


                      
                        </tr>
                        </table>
                    <dl class="fields">
                        <dt>
                            어느 일정에 참여하세요 ?
                        </dt>
                        <dd>
                        
                            <div class="product-item">
                               <%=p.getfDatestart() %> <span>~</span>
                                <%=p.getfDateend() %>
                            </div>
                        </dd>
                    </dl>
                    <dl class="fields">
                        <dt>
                            언제부터 참여 하시나요 ?
                        </dt>
                        <dd>
                     
                           <div class="first-meeting-guide">
                           <div class="first-meeting-label">첫 스터디 시작일</div>
                           <div class="first-meeting-value">  
                           <div class="product-item">
                               <%=p.getfDatestart() %>
                            </div> 
                            </div>
                           <div class="alert">
                            <span class="highlight"> <%=p.getfDatestart() %> </span>
                             부터 첫 스터디를 시작합니다.<br>
                             일정을 고려해 신중하게 신청해주세요.</div>
                             <div class="absence-alert-wrap">
                             <a href="#" class="absence-alert-toggle opened">결석시 안내</a>
                             <div class="absence-alert">스터디에 참여를 못하는 경우 결석한 부분에 대한 환불은 불가능합니다.<br>
                             하지만 스터디서치 내에 있는 다른 스터디로 스터디 종료전까지 대체참여신청을 할 수 있습니다.<br>
                             대체 참여 신청 방법은 신청 후 문자로 발송되는 참가자 안내문 내용을 참고해주세요.
                             </div>
                             </div>
                             </div>
                          
                            
                        </dd>
                    </dl>
           
                    <dl class="fields">
                        <dt>
                            약관 동의 하십니까 ?
                        </dt>
                        <dd>
                            <div class="confirmed" >
                                <span id="mark"></span>
                                <span id="con-text">
                                    스터디움의 <a href="#">이용약관</a>,
                                    <a href="#">개인정보 취급방침 </a>,
                                    <a href="#">참가자 약관 </a>,
                                    <a href="#">리더약관 </a>에 동의 합니다.
                                    <span id="required"> (필수)</span></span>
                            </div>
                            <div class="required-ck">
                                <span id="required-ck">스터디움의 이용 약관 및 개인정보 취급방침, 참가자 약관, 리더 약관에 동의 후 진행해주세요!</span>
                            </div>
                            <hr />
                        </dd>
                    </dl>
                   
                </div>
            </article>
            <input type="button" class="next" value="결제" onclick="fn_pay();" />
        </form>
        </section>
        
        <%@ include file="../../views/common/footer.jsp" %> 
</body>
<script>
	function fn_pay() {
		if(!confirmed) {
			console.log(confirmed);
			$('.confirmed').css("border","1px solid #e74c3c");
			$('.required-ck').show();
			alert("약관의 동의를 해주세요 ");
			return false;
		}
		var msg = "결제하시겠습니까";
		var flag = confirm(msg);
		
		if(flag==true) {
			aleart("ㅊㅋㅊㅋ");
		}
		else alert("취소하였습니다.");
		
	}
	
	


</script>


</html>