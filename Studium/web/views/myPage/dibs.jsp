<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member,java.util.*,com.studium.mypage.model.vo.MyDibs"%>
<%@ page import="com.studium.pstudy.model.vo.Pstudy,com.studium.fstudy.model.vo.Fstudy" %>
<% 
	Member m=(Member)request.getAttribute("member");
	List<MyDibs> mydibs=(List)request.getAttribute("mydibs");
	List<Fstudy> myflist=(List)request.getAttribute("myflist");
	List<Pstudy> myplist=(List)request.getAttribute("myplist");
%>
 
<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}
</style>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>
	  <div class="section-content" style="background-color: rgb(240, 240, 240)">
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8" style=" margin-top:20px">
                <img src="<%=request.getContextPath()%>/img/dib.png" alt=" " class="img-category ">

                <div class="myShopping ">
                    <h3>찜 목록</h3>
                    <div class="shopping-1 ">
                        <p class="sort studyM ">강사스터디</p>
                    </div>
                </div>
                <div class="study-list">
                    <h5>내가 찜한 스터디</h5>
                    <div class="row ">
				<%if(!(myplist.size()<0)){ %>
				<%for(Pstudy p :myplist){ %>
                        <div data-aos="fade-up" class="col-3 study-card"OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
                            <div class="card-top" >
                                <p><%=p.getpArea() %> | <%=p.getpCategory() %></p>
                                <h5></h5>
                                <p class="card-price"><%=p.getpPrice() %></p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle() %>" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg1()%>">
                            </div>
                        </div>
                <% }}else{ %>
                <%} %>
				
                    </div>
					
                </div>
                                <div class="myShopping " style="margin-top: auto !important;">
                    <h3>찜 목록</h3>
                    <div class="shopping-1 ">

                        <p class="sort studyN ">일반스터디</p>
                    </div>
                </div>
                <div class="study-list">
                    <h5>내가 찜한 스터디</h5>
                    <div class="row ">

				<%if(!(myflist.size()<0)){ %>
				<%for(Fstudy f :myflist){ %>
                        <div data-aos="fade-up" class="col-3 study-card"OnClick="location.href ='<%=request.getContextPath()%>/fstudy/fstudyProduct?pNo=<%=f.getfNo()%>&mNo=<%=loginMember.getMemNo() %>'"
						style="cursor:pointer;">
                            <div class="card-top" >
                                <p><%=f.getfArea() %> | <%=f.getfCategory() %></p>
                                <h5></h5>
                                <p class="card-price"></p>
                                <div class="circle">
                                    <img src="<%=request.getContextPath()%>/upload/pstudy/<%=f.getfImgtitle() %>" class="img-category ">
                                </div>
                            </div>
                            <div class="card-bottom">
                                <img src="<%=request.getContextPath()%>/upload/pstudy/<%=f.getfImg1() %>">
                            </div>
                        </div>
                <% }}else{ %>
                <%} %>
				
                    </div>
					
                </div>
                
                <%@ include file="/views/common/pagination.jsp"%>
            </div>
            
            <div class="col-sm-2 "></div>
        </div>
    </div>
	
</section>

<%@ include file="/views/common/footer.jsp"%>
