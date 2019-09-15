<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy" %>
 <%
 	Pstudy p=(Pstudy)request.getAttribute("pstudy");
  	int resultPay=(int)request.getAttribute("resultPay");
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

<body>
	<%@ include file="../../views/common/header.jsp" %> 

    <section class="studyIntro">
        <form action="" id="order-form" class="stage1">
            <article>
                <div id="page-wrap">
                    <div class="progress-bar"> <img src="<%=request.getContextPath()%>/img/studium_logo.png" alt=""> 스터디 서치 </div>
                    <table>
                        <tr id="product-info-columns">
                            <th class="product">스터디 </th>
                            <th class="item"> 일정</th>
                            <th class="price"> 가격 </th>
                        </tr>
                        <tr id="product-info-content">
                            <td class="product2">
                                <div class="product-image" style="background: url('<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle()%>') 50% 50% / cover no-repeat;">
                                </div>
                                <div class="product-texts">
                                    <span class="area"> <%=p.getpArea() %></span>
                                    <span class="title"><%=p.getpTitle() %></span>
                                </div>
                            </td>
                            <td class="item2"> <%=p.getpDatestart() %>~
                                <%=p.getpDateend() %>
                            </td>
                          
                            <td class="price2"> <%=p.getpPrice() %> </td>
                        </tr>
                    
                       
                    </table>
                    <table>
                     <tr id="product-info-columns" style="">
                        	<th class="product">보요중인 포인트</th>
                        	<th class="item">스터디 포인트 가격</th>
                        	<th class="price">결제 후 포인트 </th>
                        </tr>
                        <tr id="product-info-content">
                        <td class="product2">  <%=loginMember.getMemPoint() %> </td>
                        <td class="item2">  <%=p.getpPrice() %> </td>
                        <td class="price2"> 
                        
                        	<%= resultPay %> 
                      
                         
                        <input type="hidden" value="<%= resultPay%>" name="resultPoint"/>
                         </td>
                        </tr>
                        </table>
                    <dl class="fields">
                        <dt>
                            어느 일정에 참여하세요 ?
                        </dt>
                        <dd>
                            <div class="product-item">
                               <%=p.getpDatestart() %>~
                                <%=p.getpDateend() %>
                            </div>
                        </dd>
                    </dl>
                    <dl class="fields">
                        <dt>
                            언제부터 참여 하시나요 ?
                        </dt>
                        <dd>
                            <div class="product-item">
                               <%=p.getpDatestart() %>
                            </div>
                        </dd>
                    </dl>
           
                    <dl class="fields">
                        <dt>
                            약관 동의 하십니까 ?
                        </dt>
                        <dd>
                            <div class="confirmed" style="border: 1px solid rgb(204, 204, 204)" ;>
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
		var msg = "결제하시겠습니까";
		var flag = confirm(msg);
		if(flag==true) {
		location.href="<%=request.getContextPath()%>/pstudy/psutdyPayment?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo()%>&mPoint=<%= resultPay%>";
		}
		else alert("취소하였습니다.");
		
	}


</script>


</html>