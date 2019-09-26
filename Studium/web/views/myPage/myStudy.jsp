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
                        <div data-aos="fade-up" class="myStudy-card col-11" OnClick="location.href ='<%=request.getContextPath()%>/pstudy/pstudyProduct?pNo=<%=p.getpNo()%>&mNo=<%=loginMember.getMemNo() %>'">
                            <div class="study">
                                <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImg1()%>" class="study-main-img">
                            </div>

                            <img src="<%=request.getContextPath()%>/upload/pstudy/<%=p.getpImgtitle() %>" class="study-reader-img">
                            <div class="study-context">
                                <h3><%=p.getpTitle()%></h3>
                                <p><%=p.getpDatestart()%> ~ <%=p.getpDateend() %><span>진행중</span></p>
                                <p><%=p.getpTeachername()%></p>
                                <button class="btn btn-gotochat">채팅방 가기</button>
                                <button class="btn btn-gotochat">후기 작성</button>
                            </div>
                        </div>
                    </div>
                    
              
	                 	<% 
						}
					} 	%>
					
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
                                <p><%=f.getfDatestart()%> ~ <%=f.getfDateend()%><span>진행중</span></p>
                                <p><%=f.getfReadername()%></p>
                                <button class="btn btn-gotochat">채팅방 가기</button>
                                <button class="btn btn-gotochat">후기 작성</button>
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

</script>

<%@ include file="/views/common/footer.jsp"%>
