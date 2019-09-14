<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy" %>
    <%
     List<Pstudy> pList=(List)request.getAttribute("pList");
    
    %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/pstudy.css">
  <style>
  
.leader-photo {
    position: absolute;
    display: inline-block;
    width: 6pc;
    height: 6pc;
    left: 50%;
    margin: -40px 0 0 -51px;
    border-radius: 50%;
    background: #fff;
    border: 3px solid #fff;
    z-index: 100;
  
}
.header-background-cover {
         height: 95px;
         background-color: rgba(0,0,0,0.8);
      }
  </style>

<body >
    <%@ include file="../../views/common/header.jsp" %> 
    <div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>
  <!-- END header -->
  
  
  <div class="main_study"><img src="<%=request.getContextPath()%>/img/study.jpg"></div>
  <div class="wrap">
    <div class="category" style="margin-top: 20px;">
      <div class="sidebar">
        <div id="leftside-navigation" class="nano">
          <ul class="nano-content">
            <li class="sub-menu">
              <a href="study.html"><i class="fa fa-cogs"></i><span>강사 스터디</span><i
                  class="arrow fa fa-angle-right pull-right"></i></a>
            </li>
            <li class="sub-menu">
              <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>무료 스터디</span><i
                  class="arrow fa fa-angle-right pull-right"></i></a>
            </li>
            <li class="sub-menu">
              <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>커뮤니티</span><i
                  class="arrow fa fa-angle-right pull-right"></i></a>
              <ul>
                <li><a href="madang.html">마당</a>
                </li>
                <li><a href="">마당</a>
                </li>
                <li><a href="">마당</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div style="width: 800px; padding-top: 50px;">
      <div class="a_title">스터디 지역 찾기</div>
      <form method=post action="<%=request.getContextPath()%>/pstudy/search">
        <select class=input1 name="p_area" style="width: 120px; height: 30px;">
          <option value=''>지역 선택</option>
          <option value='강남'>강남</option>
          <option value='건대'>건대</option>
          <option value='잠실'>잠실</option>
          <option value='신촌'>신촌</option>
          <option value='분당'>분당</option>
          <option value='수원'>수원</option>
          <option value='남양주'>남양주</option>
        </select>
        <select class=input1 name="p_day" style="width: 120px; height: 30px;">
          <option value=''>가능 시간</option>
          <option value='평일'>평일</option>
          <option value='주말'>주말</option>
        </select>
        <div class="psutdysearch_btn2"><input type="image" src="<%=request.getContextPath()%>/img/search_btn1.png"></div>
         
      </form>
      <div><input type="image" src="<%=request.getContextPath()%>/img/admin.png" value="등록" onclick="fn_insert();"> </div>
     
     
    </div>
    <div class="a">
      <div class="a_title">좋아요 높은 스터디 </div>
      <div class="a_cnt1" style="cursor:pointer" window.open('product.html' toolbar=no, menubar=no, scrollbars=no,
        resizable=yes');return false;">
        <a href="product.html"> <img src='img/img2.jpg'></a>
        <div>
        <img src="https://cdn.studysearch.co.kr/images/users/94097/profile/1565326044" alt="" class="leader-photo">
      </div>
      <div style="height: 50px"></div>
        <div class='list_name'> 추천강사</div>
        <div class="list_type">서울dddd</div>
        <div class="most_border"> </div>
      </div>
      
    </div>
     <div class="a">
 <div class="a_title">강사 스터디 </div>
    <%if(pList.size()!=0) {%>
    <% for(Pstudy p :pList){ %>
    
   					
     			  <div class="study-list">
    
                    
                    <div class="row ">
                        <div data-aos="fade-up" class="col-3 study-card">
                            <div class="card-top" OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>'" style="cursor:pointer;">
                                <p><%=p.getpArea() %> | <%=p.getpDay() %></p>
                                <h5><%=p.getpTitle() %></h5>
                                <p class="card-price"><%=p.getpPrice() %></p>
                                <div class="circle">
                                   <%if(p.getpImgtitle()!=null){ %>
                                    <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle()%>" class="img-category ">
                                     <%} %>
                                </div>
                            </div>
                            <div class="card-bottom" OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>'" style="cursor:pointer;">
                                <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg1()%>">
                            </div>
                      
				  </div>
  						</div>
                </div>
   
   <%} 
    }%>
    
                  
  
     </div>

  </div>
   <style>
   
        .card-price {
            color: orange;
        }

        .card-top {
            margin: 0;
            padding-top: 30px;
            width: 100%;
            height: 50%;
        }

        .card-bottom {
            border-top: 2px solid white;
            width: 100%;
            height: 50%;
            margin-left: 0px;
            margin-right: 0px;
            border-bottom: 1px solid;
            overflow: hidden;
        }

        .card-bottom img {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            margin-left: 0px;
            margin-right: 0px;
        }

        .card-top p {
            z-index: initial;
            text-align: center;
            margin: 0px;
            font-size: 0.8em;
        }

        .card-top .img-category {
            position: absolute;
            top: 40%;
            left: 35%;
            width: 30%;
            height: 25%;
            border-radius: 50%;
            border: 2px solid white;
        }

        .studyM {
            color: #000;
            font-weight: bolder;
        }

        .sort {
            text-align: center;
            display: inline-block;
        }

        .sort:hover {
            color: black;
            -webkit-box-shadow: 2px 0 30px -5px rgba(0, 0, 0, 0.2);
            box-shadow: 2px 0 30px -5px rgba(0, 0, 0, 0.2);
        }

        .study-card {
            cursor: pointer;
            background-color: white;
            margin: 4.1%;
            margin-bottom: 30px;
            padding-right: 0px;
            padding-left: 0px;
            width:300px;
            height: 300px;
            box-shadow: 3px 3px 15px 1px #999;
            transform: scale(1);
            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            -o-transform: scale(1);
            transition: all 0.3s ease-in-out;
        }

        .study-card:hover {
            transform: scale(1.1);
            -webkit-transform: scale(1.1);
            -moz-transform: scale(1.1);
            -ms-transform: scale(1.1);
            -o-transform: scale(1.1);
        }

        .study-list h5 {
            padding-top: 3px;
            text-align: center;
        }

        .shopping-1 {
            margin: 2%;
            border-bottom: 1px solid;
        }

        .myShopping h3 {
            margin-top: 80px;
        }

        .myShopping {
            margin-top: 20%;
            padding: 50px 0px;
            text-align: center;
        }

        .myShopping i {
            margin-top: 20%;
            padding: 50px 0px;
            text-align: center;
            border-bottom: 1px solid black;
        }

        div .img-category {
            position: absolute;
            top: 8%;
            left: 42.5%;
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }

        .myName {
            margin-top: 20px;
            padding-left: 10%;
            padding-right: 10%;
            border-bottom: 1px solid black;
        }

        #myP,
        #myMenu {
            margin-top: 75px;
            position: fixed;
            float: left;
            background-color: rgba(255, 255, 255, 0.7);
            width: 150px;
            height: 96%;
            border: 1px solid black;
        }

        .nav-link {
            color: black;
            /* border-bottom: 1px solid black; */
        }

        .nav-link:hover {
            color: orangered;
            background-color: rgba(255, 255, 255, 0.9);
        }

        .navbar-myMenu {
            /* background-color: orangered !important; */
        }

        .cta-btn div {
            /*마이페이지버튼 효과적용*/
            color: #000 !important;
            text-transform: uppercase;
            padding: 10px 20px !important;
            margin-right: 2px;
            line-height: 1;
            font-weight: bold;
            -webkit-transition: .3s all ease;
            -o-transition: .3s all ease;
            transition: .3s all ease;
        }

        .cta-btn div:hover {
            background: #fff;
            color: #cf1d16 !important;
            -webkit-box-shadow: 2px 0 30px -5px rgba(0, 0, 0, 0.2);
            box-shadow: 2px 0 30px -5px rgba(0, 0, 0, 0.2);
        }

        .section-content {
            font-family: 'Nanum Gothic', sans-serif;
            /* font-family: '맑은 고딕', sans-serif; */
        }

        #loader {
            display: none;
        }
    </style>


  <script type="text/javascript" src=""></script>
	
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  <script>
    $("#leftside-navigation .sub-menu > a").click(function (e) {
      $("#leftside-navigation ul ul").slideUp(), $(this).next().is(":visible") || $(this).next().slideDown(),
        e.stopPropagation()
    })
    
    function fn_insert(){
    	location.href="<%=request.getContextPath()%>/pstudy/pstudyListAdd";
    }
  </script>




</body>

</html>