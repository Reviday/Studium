<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*,com.studium.pstudy.model.vo.Pstudy, java.text.*" %>
     <%@ page import="com.studium.member.model.vo.Member"%>
<% 
 	int categoryCount=(Integer)request.getAttribute("categoryCount");
	List<Pstudy> bestList =(List)request.getAttribute("bestList");
	List<Pstudy> categoryList=(List)request.getAttribute("categoryList");
%>


 <div style="display:none;">  <%@ include file="/views/common/header.jsp" %></div>
 
 		<%
				if(loginMember!=null&&loginMember.getMemCategory1()!=null&&categoryCount!=0)	{
					for(Pstudy p :categoryList){ 
 		%>		
		<%if(loginMember!=null) { %>			
      <a href="<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>" class="item-dishes" >
      <%}else{ %>
         <a href="<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=0" class="item-dishes" >
      <%} %>
        <div class="text">
          <p class="dishes-price"><%=p.getpPrice() %>원</p>
          <!--동그라미 위치 조정해야함-->
          <h2 class="dishes-heading"><%=p.getpTitle() %></h2>
        </div>
        <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle()%>" alt="" class="img-fluid shallwestudy">
      </a>				
 
 
<% 
					}	}else{
				for(Pstudy p :bestList){ 
%>

		<%if(loginMember!=null) { %>			
      <a href="<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>" class="item-dishes" >
      <%}else{ %>
         <a href="<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=0" class="item-dishes" >
      <%} %>
        <div class="text">
          <p class="dishes-price"><%=p.getpPrice() %>원</p>
          <!--동그라미 위치 조정해야함-->
          <h2 class="dishes-heading"><%=p.getpTitle() %></h2>
        </div>
        <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle()%>" alt="" class="img-fluid shallwestudy">
      </a>
		
      <%} }%>
      </div>
        <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>

<script>



$('.centernonloop').owlCarousel({
    center: true,
    items: 3,
    loop: false,
    margin: 10,
    itemsDesktop:[1199,4],
    
    dots: true,
    responsive: {
      600: {
        items: 3
      }
    }
  });
/* $(".owl-carousel").owlCarousel({
	nav:true,
	loop: false,
	dots: true, 
	rewind: true, 
	autoplayTimeout: 2000, 
	margin:10, 
	responsiveClass:true, 
	responsive:{
		0:{ items:2, nav:true },
		600:{ items:3, nav:false }, 
		1000:{ items:6, nav:true, 
			loop:false }
} 
}); */




</script>