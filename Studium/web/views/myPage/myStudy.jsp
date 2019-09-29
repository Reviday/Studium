<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member,java.util.*,com.studium.mypage.model.vo.MyDibs"%>
<%@ page import="com.studium.pstudy.model.vo.Pstudy,com.studium.fstudy.model.vo.Fstudy" %>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
	Member m=(Member)request.getAttribute("member");
	List<Fstudy> myflist=(List)request.getAttribute("myflist");
	List<Pstudy> myplist=(List)request.getAttribute("myplist");
%>
 
 
<script src="<%=request.getContextPath()%>/js/star.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}



.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('<%=request.getContextPath()%>/img/grade_img2.png')no-repeat;}
.star-input{
	display:inline-block; 
	white-space:nowrap;
	width:225px;
	height:40px;
	line-height:30px;
}
.star-input>.input{
	display:inline-block;
	width:150px;
	background-size:100px;
	height:18px;
	white-space:nowrap;
	padding-left:10px;
	margin-left:10px;
	overflow:hidden;
	position: relative;
}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:18px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 100px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:20px;z-index:5;}
.star-input>.input>label[for="p2"]{width:40px;z-index:4;}
.star-input>.input>label[for="p3"]{width:60px;z-index:3;}
.star-input>.input>label[for="p4"]{width:80px;z-index:2;}
.star-input>.input>label[for="p5"]{width:100px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}


</style>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>

    <div class="section-content" style="background-color: rgb(240, 240, 240)">
    <!-- 후기 모달 -->
    
    
    
		<div class="review-wrapper"id="review-wrapper" >
				<div class="col-11 myReview">
					<div class="review-top">
					
						<h5>스터디 후기를 입력해 주세요!</h5>
						<div class="review-close">+</div>
					</div>
					<div class="review-contents" >
					
						<form id="memoform">
							<span class="star-input">
									<span class="input">
										<input type="radio" name="star" value="1" id="p1" >
										<label for="p1"></label>
										<input type="radio" name="star" value="2" id="p2" >
										<label for="p2"></label>
										<input type="radio" name="star" value="3" id="p3">
										<label for="p3"></label>
										<input type="radio" name="star" value="4" id="p4">
										<label for="p4"></label>
										<input type="radio" name="star" value="5" id="p5">
										<label for="p5"></label>
									  </span>						
								</span>
						<textarea name="my-review" class="memo" placeholder="생생한 후기를 남겨주세요:)"></textarea>
						<input type="hidden" class="hidden_no" name="no" value="">
						<input type="hidden" name="memNo" value="<%=m.getMemNo() %>">
						</form>
					</div>
					
						<input type="button" class="review-btn" value="제출">
				</div>
			 </div>
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8" style=" margin-top:20px">
                <img src="<%=request.getContextPath()%>/img/book.jpg " alt=" " class="img-category ">
                <div class="myShopping ">
                    <h3><%=m.getMemName() %> 님의 스터디</h3>
                    <div class="shopping-1 ">
                        <p class="sort studyM " id="p_study">강사스터디</p>
                        <span> | </span>
                        <p class="sort studyN " id="f_study">무료스터디</p>
                    </div>
                </div>



                <div class="study-list" id="p_study_div">
                
				<%if(!(myplist.size()<0)){ 
					for(Pstudy p :myplist){ %>

                    <div class="row"  >
                        <div data-aos="fade-up" class="myStudy-card col-11" >
                            <div class="study">
                                <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg1()%>" class="study-main-img">
                            </div>

                            <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle() %>" class="study-reader-img">
                            <div class="study-context">
                                <h3 OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>'"><%=p.getpTitle()%></h3>
                                <p><%=p.getpDatestart()%> ~ <%=p.getpDateend() %>
                                
						<%
						
						
						SimpleDateFormat dfv         = new SimpleDateFormat("yyyyMMddmmss");
						SimpleDateFormat difv  	= new SimpleDateFormat("MMdd");
						Calendar cal = Calendar.getInstance();

						int yyyy     = cal.get(Calendar.YEAR);    //현재 년도
						int MM        = cal.get(Calendar.MONTH);   //현재 달
						int dd        = cal.get(Calendar.DATE);    //현재 날짜
						cal.set(yyyy, MM, dd); //현재 날짜 세팅

						/* 시,분까지 계산 */
						Date resdate =p.getpDatestart();    //기준일
						Date resdate1 =p.getpDateend();    //기준일
						String today = dfv.format(cal.getTime());
						Date beginDate1 = null;
						Date beginDate2 = null;
						Date endDate = null;

						long diff1 = 0;
						long diff2 = 0;
						long diffDays1 = 0;
						long diffDays2 = 0;
						long diffTime = 0;
						long difvv1=0;
						long difvv2=0;
						long difvvDays1=0;
						long difvvDays2=0;
						
						beginDate1 = (resdate); //
						beginDate2 = (resdate1);    //parse: 문자형 날짜 -> Date 형태로 변환
						endDate = dfv.parse(today);

						diff1 =   beginDate1.getTime()-endDate.getTime(); //밀리세컨단위로 계산됨
						diff2 =   beginDate2.getTime()-endDate.getTime(); //밀리세컨단위로 계산됨
						diffDays1 = diff1 / (24 * 60 * 60 * 1000);
						diffDays2 = diff2 / (24 * 60 * 60 * 1000);
						 difvv1 = beginDate1.getTime();
						 difvv2 = beginDate2.getTime();
						 difvvDays1 = difvv1/(24 * 60 * 60 * 1000);
						 difvvDays2 = difvv2/(24 * 60 * 60 * 1000);
						
						
						 if((diffDays1<1&&diffDays2>1)){ %>
                                <span>진행중</span></p>
                        <%}else if(diffDays1<1&&diffDays2<1){ %> 
                                <span>완료</span></p>
						<% }else{%> 
                                <span>곧 시작합니다!</span></p>
						<% }%>
                                <p><%=p.getpTeachername()%></p>
                                <button class="btn btn-gotochat" id="<%=p.getpNo()%>">후기 작성</button>
                                	
                            </div>
                            
                        </div>
                        
                    </div>
              <% }
              }%>
					
					  </div>
					  
					  <div class="study-list" id="f_study_div">
					<% if(!(myflist.size()<0)){ 
					for(Fstudy f :myflist){ %>
                 	 <div class="row" >
                        <div data-aos="fade-up" class="myStudy-card col-11" OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=f.getfNo()%>&mNo=<%=loginMember.getMemNo() %>'">
                            <div class="study">
                                <img src="<%=request.getContextPath()%>/upload/pstudy/<%=f.getfImg1()%>" class="study-main-img">
                            </div>

                            <img src="<%=request.getContextPath()%>/upload/pstudy/<%=f.getfImgtitle() %>" class="study-reader-img">
                            <div class="study-context">
                                <h3><%=f.getfTitle()%></h3>
                                <p><%=f.getfDatestart()%> ~ <%=f.getfDateend()%>
                               <%
						
						
						SimpleDateFormat dfv         = new SimpleDateFormat("yyyyMMddmmss");
						SimpleDateFormat difv  	= new SimpleDateFormat("MMdd");
						Calendar cal = Calendar.getInstance();

						int yyyy     = cal.get(Calendar.YEAR);    //현재 년도
						int MM        = cal.get(Calendar.MONTH);   //현재 달
						int dd        = cal.get(Calendar.DATE);    //현재 날짜
						cal.set(yyyy, MM, dd); //현재 날짜 세팅

						/* 시,분까지 계산 */
						Date resdate =f.getfDatestart();    //기준일
						Date resdate1 =f.getfDateend();    //기준일
						String today = dfv.format(cal.getTime());
						Date beginDate1 = null;
						Date beginDate2 = null;
						Date endDate = null;

						long diff1 = 0;
						long diff2 = 0;
						long diffDays1 = 0;
						long diffDays2 = 0;
						long diffTime = 0;
						long difvv1=0;
						long difvv2=0;
						long difvvDays1=0;
						long difvvDays2=0;
						
						beginDate1 = (resdate); //
						beginDate2 = (resdate1);    //parse: 문자형 날짜 -> Date 형태로 변환
						endDate = dfv.parse(today);

						diff1 =   beginDate1.getTime()-endDate.getTime(); //밀리세컨단위로 계산됨
						diff2 =   beginDate2.getTime()-endDate.getTime(); //밀리세컨단위로 계산됨
						diffDays1 = diff1 / (24 * 60 * 60 * 1000);
						diffDays2 = diff2 / (24 * 60 * 60 * 1000);
						 difvv1 = beginDate1.getTime();
						 difvv2 = beginDate2.getTime();
						 difvvDays1 = difvv1/(24 * 60 * 60 * 1000);
						 difvvDays2 = difvv2/(24 * 60 * 60 * 1000);
						
						
						 if((diffDays1<1&&diffDays2>1)){ %>
                                <span>진행중</span></p>
                        <%}else if(diffDays1<1&&diffDays2<1){ %> 
                                <span>완료</span></p>
						<% }else{%> 
                                <span>곧 시작합니다!</span></p>
						<% }%>
                                <p><%=f.getfReadername()%></p>
                                <button class="btn btn-gotochat">채팅방 가기</button>
                                <button class="btn btn-gotochat" id="">후기 작성</button>
                            </div>
                        </div>
                   	 </div>
	                 	<% 
						}
					} %>
                     </div>
                  

                
                
                
            </div>
            <div class="col-sm-2 "></div>
        </div>
    </div>
</section>
<script>
$("#f_study").on('click', function () {
	 $('#p_study_div').hide();
	 $('#f_study_div').show();
});
$("#p_study").on('click', function () {
	 $('#p_study_div').show();
	 $('#f_study_div').hide();
});

//리뷰쓰기 버튼 눌렀을 때 
$(function() {
    $('.btn-gotochat').click(function(e) {
    	var pNo = $(this).attr('id');
    	var memNo=<%=m.getMemNo()%>;
    	console.log(pNo);
    	console.log(memNo);
    	//히든값에 pNo 붙여줌
    	$(".hidden_no").val(pNo);
    	
    	$.ajax({
    		url: "<%=request.getContextPath()%>/myPage/reviewSelect",
    		type: "POST",
    		dataType: "json",
    		data: {"memNo" : memNo, "pNo":pNo},
    		success: function(data){
    			$(".memo").text(data);
            	$(".review-wrapper").css("display","block");
            	console.log("들어옴");
    		},
    		error:function (data){
    			console.log(data);
    		}
    	})
    });

})


//리뷰제출버튼 눌렀을 때 
$('.review-btn').click(function(e) {
		console.log('리뷰제출함수');
 		var params = $("#memoform").serialize();

		console.log('리뷰제출함수3');
 		$.ajax({
 			url: "<%=request.getContextPath()%>/myPage/reviewUpdate",
 			type: "POST",
 			dataType: "json",
 			data: params,
 			success: function(data){
 				console.log('제출성공');
 				$(".memo").text(data);	
 	        	$(".review-wrapper").css("display","none");
 				
 			}
 		});
	
});


$(function(){
	var modal = document.getElementById('review-wrapper');                                         
    $(".review-close").click(function() {
        $(".review-wrapper").css("display","none");
    }); 

    window.onclick = function(event) {
        if (event.target == modal) {
        	$(".review-wrapper").css("display","none");
        }
    }
});

</script>

<%@ include file="/views/common/footer.jsp"%>
