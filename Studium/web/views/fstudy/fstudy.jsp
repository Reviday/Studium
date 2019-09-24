<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.studium.fstudy.model.vo.Fstudy" %>
      <%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
List<Fstudy> fList=(List)request.getAttribute("fList");
List<Fstudy> bestList =(List)request.getAttribute("bestList");
int cPage=(int)request.getAttribute("cPage");

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
  <div class="container studycon">
    <section >
    <div style="width: 900px; padding-top: 50px; margin-left:150px;">
      <div class="a_title" >스터디 지역 찾기</div>
           <form method=post action="<%=request.getContextPath()%>/fstudy/search" class="filter-form">
        <select class=input1  id= "filter" name="p_area" style="width: 120px; height: 30px;">
          <option value='null'>지역 선택</option>
          <option value='강남'>강남</option>
          <option value='건대'>건대</option>
          <option value='잠실'>잠실</option>
          <option value='신촌'>신촌</option>
          <option value='분당'>분당</option>
          <option value='수원'>수원</option>
          <option value='남양주'>남양주</option>
        </select>
         <select class=input1 id="filter2" name="p_category" style="width: 120px; height: 30px;">
          <option value='null'>관심사</option>
          <option value='영어'>영어</option>
          <option value='코딩'>코딩</option>
          <option value='중국어'>중국어</option>
        </select>
        <select class=input1 id="filter3" name="p_day" style="width: 120px; height: 30px;">
          <option value='null'>가능 시간</option>
          <option value='평일'>평일</option>
          <option value='주말'>주말</option>
        </select>
       <button class="submit">필터 검색<span class="arrow"></span></button>
         
      </form>
      
      
      <% if(loginMember!=null&&(loginMember.getMemCode()=='M'||loginMember.getMemCode()=='L')){ %>
      <div><input type="image" src="<%=request.getContextPath()%>/img/admin.png" value="등록" onclick="fn_insert();"> </div>
     <%}else{ %>
     	
     <%} %>
     
    </div>

    <% if(bestList.size()!=0){%>
<div class="plist">
	<div class="a_title">평점 높은 스터디 </div>
	<div class="study-list">
		<div class="row ">
			
			<% for(Fstudy p :bestList){ 
				DecimalFormat    capa        = new DecimalFormat("#");
				SimpleDateFormat df          = new SimpleDateFormat("yyyy-MM-dd E");
				SimpleDateFormat dfv         = new SimpleDateFormat("yyyyMMdd");
				SimpleDateFormat simpleM 	 = new SimpleDateFormat("MM");
				SimpleDateFormat simpleD 	 = new SimpleDateFormat("dd");
				Calendar cal = Calendar.getInstance();

				int yyyy     = cal.get(Calendar.YEAR);    //현재 년도
				int MM        = cal.get(Calendar.MONTH);   //현재 달
				int dd        = cal.get(Calendar.DATE);    //현재 날짜
				cal.set(yyyy, MM, dd); //현재 날짜 세팅

				/* 시,분까지 계산 */
				Date resdate = p.getfDatestart();    //기준일
				String today = dfv.format(cal.getTime());
				Date beginDate = null;
				Date endDate = null;
				String startDateM = simpleM.format(resdate);
				String startDateD = simpleD.format(resdate);
				long diff = 0;
				long diffDays = 0;
				long diffTime = 0;

				beginDate = (resdate);    //parse: 문자형 날짜 -> Date 형태로 변환
				endDate = dfv.parse(today);

				diff =   beginDate.getTime()-endDate.getTime(); //밀리세컨단위로 계산됨
				diffDays = diff / (24 * 60 * 60 * 1000);
	
			
			%>
			
			<div class="a_cnt1">
				<div data-aos="fade-up" class="col-3 pstudy-card">
						<%
						
						
						
						if(diffDays<3){ %>
							<div class="drawing-near">마감 임박</div>
						<%	}else{ %>
						<div class="recruiting-status new">신규 모집</div>
						<%} %> 
					
					 <%
                    	if(loginMember!=null) {
                    %>
					<div class="card-top"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
					<%}else {%>
					<div class="card-top"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=0'"
						style="cursor:pointer;">
					<% } %>
					
						<p><%=p.getfArea() %> | <%=p.getfDay() %></p>
						<h5><%=p.getfTitle() %></h5>
						
						<p class="card-price"><span style="color:#4c8def;"> <%=startDateM %>월 <%=startDateD %>일</span><span style="color: #787878;"> 첫 시작 !</span></p>

						<div class="circle">
							<%if(p.getfImgtitle()!=null){ %>
							<img src="<%=request.getContextPath()%>/upload/fstudy/<%=p.getfImgtitle()%>"
								class="img-category ">
							<%} %>
						</div>
					</div>
					
							 <%
                    	if(loginMember!=null) {
                    %>
					<div class="card-bottom"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
					<%}else {%>
					<div class="card-bottom"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=0'"
						style="cursor:pointer;">
					<% } %>
						<img src="<%=request.getContextPath()%>/upload/fstudy/<%=p.getfImg1()%>">
						
						
						
					</div>
				</div>
			</div>

			<%} 
	   %>
		</div>

	</div>
</div>
<% } else {%>
<%} %>
<div class="plist">
	<div class="a_title">리더 스터디 </div>
	<div class="study-list">
		<div class="row ">
			
			<% for(Fstudy p :fList){ 
				DecimalFormat    capa        = new DecimalFormat("#");
				SimpleDateFormat df          = new SimpleDateFormat("yyyy-MM-dd E");
				SimpleDateFormat dfv         = new SimpleDateFormat("yyyyMMdd");

				Calendar cal = Calendar.getInstance();

				int yyyy     = cal.get(Calendar.YEAR);    //현재 년도
				int MM        = cal.get(Calendar.MONTH);   //현재 달
				int dd        = cal.get(Calendar.DATE);    //현재 날짜
				cal.set(yyyy, MM, dd); //현재 날짜 세팅

				/* 시,분까지 계산 */
				Date resdate = p.getfDatestart();    //기준일
				String today = dfv.format(cal.getTime());
				Date beginDate = null;
				Date endDate = null;
				SimpleDateFormat simpleM 	 = new SimpleDateFormat("MM");
				SimpleDateFormat simpleD 	 = new SimpleDateFormat("dd");
				String startDateM = simpleM.format(resdate);
				String startDateD = simpleD.format(resdate);
				long diff = 0;
				long diffDays = 0;
				long diffTime = 0;

				beginDate = (resdate);    //parse: 문자형 날짜 -> Date 형태로 변환
				endDate = dfv.parse(today);

				diff =   beginDate.getTime()-endDate.getTime(); //밀리세컨단위로 계산됨
				diffDays = diff / (24 * 60 * 60 * 1000);
			
			
			%>
			<div class="a_cnt1">
				<div data-aos="fade-up" class="col-3 pstudy-card">
				<%
						if(diffDays<3){ %>
							<div class="drawing-near">마감 임박</div>
						<%	}else{ %>
						<div class="recruiting-status new">신규 모집</div>
						<%} %> 
					 <%
                    	if(loginMember!=null) {
                    %>
					<div class="card-top"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
					<%}else {%>
					<div class="card-top"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=0'"
						style="cursor:pointer;">
					<% } %>
						<p><%=p.getfArea() %> | <%=p.getfDay() %></p>
						<h5><%=p.getfTitle() %></h5>
					<p class="card-price" ><span style="color:#4c8def; font-weight: 1000 !important;"> <%=startDateM %>월 <%=startDateD %>일</span><span style="color: #787878; font-weight: 800 !important;"> 첫 시작 !</span></p>

						<div class="circle">
							<%if(p.getfImgtitle()!=null){ %>
							<img src="<%=request.getContextPath()%>/upload/fstudy/<%=p.getfImgtitle()%>"
								class="img-category ">
							<%} %>
						</div>
					</div>
						 <%
                    	if(loginMember!=null) {
                    %>
					<div class="card-bottom"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
					<%}else {%>
					<div class="card-bottom"	OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=p.getfNo()%>&mNo=0'"
						style="cursor:pointer;">
					<% } %>
						<img src="<%=request.getContextPath()%>/upload/fstudy/<%=p.getfImg1()%>">
					</div>
				</div>
			</div>

			<%} 
	  %>
		</div>
</div>
		<%@ include file="/views/common/pagination.jsp"%>
	</div>
</div>

  </div>



  <script type="text/javascript" src="">
  
  $(window).scroll(function() {
      
      
      var scrolltop = $(document).scrollTop();
      console.log(scrolltop);
      var height = $(document).height();
      console.log(height);
      var height_win = $(window).height();
      console.log(height_win);
      
      
   if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
      
      
      moreList();
      
  }  
  
  </script>
	
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<script type="text/javascript">
var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
 
$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
     getList(page);
     page++;
}); 
 
$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
     if($(window).scrollTop() >= $(document).height() - $(window).height()){
          getList(page);
           page++;   
     } 
});
 

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