<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy" %>
    <%
     List<Pstudy> pList=(List)request.getAttribute("pList");
  
    
    %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pstudy.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

  <style>
  

.header-background-cover {
         height: 95px;
         background-color: rgba(0,0,0,0.8);
      }

body{
	background-color: #ffffff !important;
}
  </style>

<body>
    <%@ include file="../../views/common/header.jsp" %> 
    <div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>
  <!-- END header -->
 
  
  <div class="main_study"><img src="<%=request.getContextPath()%>/img/study.jpg"></div>
    <section >
  <div class="wrap" style="margin-left:100px;">
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
    <div style="width: 900px; padding-top: 50px;">
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
      
      <% if(loginMember!=null&&loginMember.getMemUserEmail()=="admin@studium.com"){ %>
      <div><input type="image" src="<%=request.getContextPath()%>/img/admin.png" value="등록" onclick="fn_insert();"> </div>
     <%}else{ %>
     	
     <%} %>
     
     
    </div>
    <div style="height: 210px;"></div>
   
<div class="plist">
	<div class="a_title">강사 스터디 </div>
	<div class="study-list">
		<div class="row ">
			
			<% for(Pstudy p :pList){ %>
			<div class="a_cnt1">
				<div data-aos="fade-up" class="col-3 pstudy-card">

					 <%
                    	if(loginMember!=null) {
                    %>
					<div class="card-top"	OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
					<%}else {%>
					<div class="card-top"	OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=0'"
						style="cursor:pointer;">
					<% } %>
						<p><%=p.getpArea() %> | <%=p.getpDay() %></p>
						<h5><%=p.getpTitle() %></h5>
						<p class="card-price"><%=p.getpPrice() %></p>

						<div class="circle">
							<%if(p.getpImgtitle()!=null){ %>
							<img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle()%>"
								class="img-category ">
							<%} %>
						</div>
					</div>
						 <%
                    	if(loginMember!=null) {
                    %>
					<div class="card-bottom"	OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
					<%}else {%>
					<div class="card-bottom"	OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=0'"
						style="cursor:pointer;">
					<% } %>
						<img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg1()%>">
					</div>
				</div>
			</div>

			<%} 
	  %>
		</div>
</div>
</div>

	</div>
</div>

  </div>
   <style>
   
       
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
<!-- aos 애니메이션-->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</section>
<%@ include file="../../views/common/footer.jsp" %> 
</body>

</html>