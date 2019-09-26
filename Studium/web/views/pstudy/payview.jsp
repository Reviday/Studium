<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy,com.studium.member.model.vo.Member" %>

 <%
 	Pstudy p=(Pstudy)request.getAttribute("newp");
	int resultPay =(int)request.getAttribute("resultPay");
 	Member m=(Member)request.getAttribute("newm");
 
 %>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/payview.css">
 


    <section id="paypay" >
        <div class="pay-header">결제하기<span>.</span></div> 
        <article id="payview"> <!-- 수강신청 정보 섹션 -->
            <div>수강신청 정보</div>
            <div class="rine1"></div> <!--경계선-->
            <div class="subject">강의명</div> 
            <div class="payanswer"><%=p.getpTitle() %></div> <!-- 강의이름 -->
            <div class="subject">기간</div>
            <div class="payanswer"><span><%=p.getpDatestart()%></span> ~ <span><%=p.getpDateend() %></span></div> <!--강의기간-->
            <div class="subject">시간</div>
            <div class="payanswer"><span><%=p.getpTimestart() %></span>~<span><%=p.getpTimeend() %></span></div> <!--강의일정-->
            <div class="subject">장소</div>
            <div class="payanswer">결제 후 24시간 이내 쪽지발송(마이페이지 확인)</div>
            <div class="subject">문의(환불 문의)</div>
            <div id="gogakcenter">
                고객센터 010-6606-5547 <br>
                <span>한정원입니다@google.com</span>
            </div>
            <div class="rine2"></div> <!--경계선-->
            <div class="subject">이름</div>
            <div class="payanswer"><%=m.getMemName() %></div> <!--수강인원이름-->
            <div class="subject">휴대전화</div>
            <div class="payanswer"><%=m.getMemPhone() %></div> <!--수강인원번호-->
            <div class="subject">이메일</div>
            <div class="payanswer"><%=m.getMemUserEmail() %></div> <!--수강인원이메일-->
            <a href="" class="turnback">수강신청 다시 하기</a>
        </article>
        <article id="payPointview"> <!--포인트선택 섹션-->
            <div>포인트 선택</div>
            <div class="rine1"></div> <!--경계선-->
            <div class="pointFlex">
                <div>사용 가능한 포인트</div>
                <div><%=m.getMemPoint() %> </div> <!--수강인원포인트-->
            </div>
            <div class="pointSelect">
                <input type="text" name="" id="">
                <button>포인트 사용</button>
            </div>
        </article>
        <article id="paymethod">
            <div>결제 수단 선택</div>
            <div class="rine1"></div> <!--경계선-->
            <div class="paymethod-select">
                <label for="" class="check-label">
                    <input class="option-input checkbox" type="checkbox"><span>신용카드결제</span>
                </label>
                <label for="" class="check-label">
                    <input class="option-input checkbox" type="checkbox"><span>실시간 계좌이체</span>
                </label>
                <label for="" class="check-label">
                    <input class="option-input checkbox" type="checkbox"><span>무통장입금(가상계좌)</span>
                </label>
            </div>
            <div class="rine3"></div> <!-- 경계선-->
            <div class="payInfo">
                신용카드, 실시간 계좌이체, 가상 계좌입금(무통장입금) 결제의 경우 현금영수증이 자동 발행됩니다. 
                <br>
                회사를 통한 결제시 전자계산서 발행을 원하신다면, [우리은행 1005-902-393657 스터디움(주)]로 무통장입금 바랍니다.
                <br>    
                입금 전 청구 발행이 필요하신 경우 수강신청 후, <span>한정원이다@google.com</span> 로 사업자등록증을 보내주시면 됩니다.
            </div>
        </article>

        <div class="paypopup"> <!--결제팝업-->
            <div class="paypopup-Info"> <!--결제정보-->
                <div class="paypopup-answer"> <!--결제가격-->
                    <div class="paypopup-subject">가격</div>
                    <div class="paypopup-answer1"><%=p.getpPrice() %>원</div>
                </div>
                <div>
                    <img src="minus.png" alt="" class="img-payview">
                </div> <!--마이너스 이미지-->
                <div class="paypopup-answer"> <!--포인트할인-->
                    <div class="paypopup-subject">포인트 할인</div>
                    <div class="paypopup-answer1"><%=m.getMemPoint() %>원</div>
                </div>
                <div>
                    <img src="equal.png" alt="" class="img-payview">
                </div> <!-- = 이미지 -->
                <div class="paypopup-answer"> <!--최종결제금액-->
                    <div class="paypopup-subject1">결제 금액</div>
                    <div class="paypopup-answer2">
                    
                    <%if(resultPay>0){ %>
                    <%=resultPay %>원
                    <%}else{ %>
                    0원 포인트로 결제됩니다
                    <%} %>
                    
                    
                    </div>
                </div>
            </div>
            <div class="payagree"> <!-- 결제동의, 버튼-->
                <div>
                    <label for="" class="check-label"><input type="checkbox" name="" id="" class="option-input checkbox">
                        <span class="payagreespan">강의 및 결제 정보를 확인하였으며, 이에 동의합니다. (필수)</span>
                    </label>
                </div>
   
                <button onclick="fn_payment();">결제하기</button>
            </div>
        </div>
    </section>
    <script>
        $(function () {
            $(window).scroll(function () { 
                var num = $(this).scrollTop();
                if (num > 450) { 
                    $(".paypopup").addClass("slide-in-from-bottom");
                    $(".paypopup").removeClass("slide-out-from-bottom");
                    $(".paypopup").removeClass("hide");
                } else {
                    $(".paypopup").addClass("slide-out-from-bottom");
                    $(".paypopup").addClass("hide");
                }
            });
        });
   
    </script>
    <script>
    function fn_payment(){
 	   location.href="<%=request.getContextPath()%>/pstudy/pstudyFinally?pNo=<%=p.getpNo()%>&mNo=<%=m.getMemNo()%>";
    }
    
    </script>
