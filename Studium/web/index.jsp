<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy, java.text.*" %>
    <%
    List<Pstudy> pList=(List)request.getAttribute("pList");
	List<Pstudy> bestList =(List)request.getAttribute("bestList");
    
    %>
<%@ include file="views/common/header.jsp" %>
 <link rel="stylesheet" href="css/myPage.css">
  <section class="home-slider owl-carousel">
    <div class="slider-item" style="background-image: url('img/1.jpg');">

      <div class="container">
        <div class="row slider-text align-items-center justify-content-center">
          <div class="col-md-8 text-center col-sm-12 element-animate">
            <h1>STUDIUM</h1>
            <p class="mb-5">자기주도적 학습관리 STUDIUM</p>
            <p><a href="http://rclass.iptime.org:9999/Studium/pstudyListView" class="btn btn-white btn-outline-white">신청하기</a></p>
          </div>
        </div>
      </div>
    </div>
    <div class="slider-item" style="background-image: url('img/2.jpg');">
      <div class="container">
        <div class="row slider-text align-items-center justify-content-center">
          <div class="col-md-8 text-center col-sm-12 element-animate">
            <h1>STUDIUM</h1>
            <p class="mb-5">각양각색의 강사들과 함께하는 STUDIUM</p>
            <p><a href="http://rclass.iptime.org:9999/Studium/pstudyListView" class="btn btn-white btn-outline-white">함께 공부하기</a></p>
          </div>
        </div>
      </div>

    </div>

  </section>
<style>
#indexBest{
	z-index:1;
	position: relative;
    display: block;

}
.item-dishes {
    position: relative;
    display: block;
    overflow: hidden;
    margin: 10px;
}

</style>


  <section class="section element-animate">

    <div class="clearfix mb-5 pb-5">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12 text-center heading-wrap">
              <h2>best</h2>
            <span class="back-text">STUDIUM</span>
          </div>
        </div>
      </div>
    </div>
       <div class="owl-carousel centernonloop" id="indexBest" >
    </div>
  </section> 
  <!-- .section -->
  <section class="section bg-light element-animate">

    <div class="clearfix mb-5 pb-5">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12 text-center heading-wrap">
            <h2>Review</h2>
            <span class="back-text-dark">STUDY</span>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row no-gutters" id="indexreview">
              <div class="col-md-6">
          <div class="sched d-block d-lg-flex">
            <div class="bg-image order-2" style="background-image: url('img/3.jpg');"></div>
            <div class="text order-1">
              <h3>집단지성의 힘!</h3>
              <p>매 수업마다 너무 즐거웠고 선생님이 너무 좋으셨어요~! 매주 다른 방식으로 스터디를 진행하셨고, 무겁게 공부 하는 느낌이 아닌 일상적인 이야기나 준비하신 프린트물로 수업을 진행하셨습니다. :)</p>
              <p class="text-primary h3">경찰공무원 합격방</p>
            </div>

          </div>

          <div class="sched d-block d-lg-flex">
            <div class="bg-image" style="background-image: url('img/4.jpg');"></div>
            <div class="text">
              <h3>살면서 코딩을 이만큼 할 줄 몰랐어요</h3>
              <p>말하는 것에 있어서 자신감을 확실히 심어주셨어요! 세달 가량 하면서 이제는 맞든 틀리든 생각보다는 일단 뱉고 보는거 같아요. 그리고 지금 까지 들은 많은 영어 수업 중 가장 즐겁게 한 것 같습니다</p>
              <p class="text-primary h3">3주만에 코딩완성</p>

            </div>

          </div>

        </div>

        <div class="col-md-6">
          <div class="sched d-block d-lg-flex">
            <div class="bg-image order-2" style="background-image: url('img/5.jpg');"></div>
            <div class="text order-1">
              <h3>강사님이 너무 재밌고 좋아요</h3>
              <p>모두들 좋은사람들에다 대화중에 틀린부분에 대해선 바로 바로 피드백 주시는게 너무 좋았습니다!!</p>
              <p class="text-primary h3">javascript마스터</p>

            </div>

          </div>

          <div class="sched d-block d-lg-flex">
            <div class="bg-image" style="background-image: url('img/5.jpg');"></div>
            <div class="text">
              <h3>즐겁게 공부하고 취업까지!</h3>
              <p>강남에 유명하다는 회화학원도 다녀 봤지만..실력에 전혀 차도가 없어서 처음에는 반신반의로 신청해 봤습니다. 그런데 스터디 그룹 분위기도 너무 좋고 무엇보다 리더님의 눈높이 강의 덕분에 영어가 재미있어졌어요!</p>
              <p class="text-primary h3">그만해,,</p>

            </div>

          </div>

        </div>
      </div>
    </div>
  </section> <!-- .section -->


  <section class="section element-animate">
    <div class="clearfix mb-5 pb-5">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12 text-center heading-wrap">
            <h2>이번주의 Fork!</h2>
            <span class="back-text">Fork</span>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="blog d-block d-lg-flex">
            <div class="bg-image" style="background-image: url('img/1.jpg');"></div>
            <div class="text">
              <h3>자바스크립트 빠르게 배우는 법</h3>
              <p class="sched-time">
                <span><span class="fa fa-calendar"></span> April 22, 2018</span> <br>
              </p>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto illo delectus...</p>

              <p><a href="#" class="btn btn-primary btn-sm">Read More</a></p>

            </div>

          </div>
        </div>
        <div class="col-md-6">
          <div class="blog d-block d-lg-flex">
            <div class="bg-image" style="background-image: url('img/2.jpg');"></div>
            <div class="text">
              <h3>단기간에 영어회화 마스터하기</h3>
              <p class="sched-time">
                <span><span class="fa fa-calendar"></span> April 22, 2018</span> <br>
              </p>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto illo delectus...</p>

              <p><a href="#" class="btn btn-primary btn-sm">Read More</a></p>

            </div>

          </div>
        </div>
      </div>
    </div>

  </section> <!-- .section -->



  <section class="section element-animate">

    <div class="clearfix mb-5 pb-5">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12 text-center heading-wrap">
            <h2>STUDIUM</h2>
            <span class="back-text">STUDIUM</span>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
	        <!-- 스터디움홍보 -->
        <div class="thirdSection-board">
            <div class="board-first">
                <span style="color: #ff6c00; font-weight: bold;">스터디움,</span> <br> 어떤 점이 좋나요?
            </div>
            <div class="board-second">
                <div class="board-second-study">
                    <div class="study-img">
                        <img src="<%=request.getContextPath() %>/img/asd1.png" alt="">
                    </div>
                    <div class="study-title">내가 원하는 분야별 스터디</div>
                    <div class="study-text">나에게 딱 필요한 공부하고 싶은 <br> 분야, 시험별로 진행되는 스터디에요!</div>
                </div>
                <div class="board-second-study">
                    <div class="study-img">
                        <img src="<%=request.getContextPath() %>/img/asd2.png" alt="">
                    </div>
                    <div class="study-title">최대 6-8명의 소수 정예</div>
                    <div class="study-text">도란도란 정예 멤버로 <br> 꼭 맞는 사람들끼리 시작해요:)</div>
                </div>
                <div class="board-second-time">
                    <div class="study-img">
                        <img src="<%=request.getContextPath() %>/img/asd3.png" alt="">
                    </div>
                    <div class="study-title">다양한 지역 및 시간대</div>
                    <div class="study-text">평일 낮부터 밤, 그리고 주말까지! <br> 내게 딱 맞는 시간대를 찾아보세요 <br> :D</div>
                </div>
            </div>
        </div>
    </div>
  </section> <!-- .section -->


  <section class="py-5 bg-light">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6 text-center">
          <div class="row">
            <div class="col-md-12">
              <h3>스터디 상담받기</h3>
              <p style="font-size:22px;">혹시 어떤 스터디가 나에게 맞을지, 고민되시는 거라면?</p>
            </div>

           <form action="https://pf.kakao.com/_PqxlWT" class="col-12">
              <div class="row align-items-center">
                
                <div class="col-md-4">
                  <input type="submit" class="btn btn-primary btn-block" value="카톡상담하러가기" style="margin-left:192px;">
                </div>
              </div></form>
          </div>
        </div>
      </div>
    </div>
     <form id="logincategory">
    <%if(loginMember!=null&&loginMember.getMemCategory1()!=null){ %>
   
    <input type="hidden" value="<%=loginMember.getMemCategory1()%>" name="locate"  id="locate"/>
  
    <%}else{ %>
    <input type="hidden" value="N" name="locate" id="locate" />
  
    <%} %>
      </form>
  </section>
  <style>
  .thirdSection-board {
    margin: auto;
    width: 880px;
}

.board-first {
    padding-top: 110px; 
    font-size: 38px;
    line-height: 1.5;
}

.board-second {
    display: flex;
    margin-top: 70px;
}

.board-second-study {
    margin: 0 50px 0 0;
}

.board-second-time {
    margin: 0;
}

.study-img {
    
}

.study-img img {
    width: 90px;
}

.study-title {
    margin: 30px 0 18px 0;
    font-size: 22px;
    font-weight: bold;
}

.study-text {
    font-size: 17px;
    color: #777b7e;
    line-height: 1.5;
    font-weight: bold;
}
  
  
  </style>
  <script>
  var params = jQuery("#logincategory").serialize();
  $(document).ready(function(){
	  loadNext();
	  loadNext2();
	});
	function loadNext(){
	  $.ajax({
	    type: "POST",
	    url: "<%=request.getContextPath()%>/indexBest",
	    data:params,
	    dataType: "html",
	    success: function(data){
	      $('#indexBest').html("");
	      $('#indexBest').html(data);
	    }
	  });

	}
 	function loadNext2(){
		  $.ajax({
		    type: "POST",
		    url: "<%=request.getContextPath()%>/indexreview",
		    dataType: "html",
		    success: function(data){
		      $('#indexreview').html("");
		      $('#indexreview').html(data);
		    }
		  });

		} 
  </script>

<%@ include file="views/common/footer.jsp" %>
