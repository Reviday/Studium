<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.*,com.studium.story.model.vo.Story" %>
<%@ page import="com.studium.pstudy.model.vo.Pstudy" %>
  
  <%
	List<Pstudy> myplist=(List)request.getAttribute("myplist");
	List <Story> slist = (List)request.getAttribute("slist");
%>
				
				  <div class="col-md-6">
          <div class="sched d-block d-lg-flex">
            <div class="bg-image order-2" style="background-image: url('<%=request.getContextPath()%>/upload/story/<%=slist.get(0).getStoryTeacherpicture()%>');"></div>
            <div class="text order-1">
          
              <p><%=slist.get(0).getStoryContent() %></p>
              <p class="text-primary h3"><%=myplist.get(0).getpTitle() %></p>
            </div>

          </div>

          <div class="sched d-block d-lg-flex">
            <div class="bg-image" style="background-image: url('<%=request.getContextPath()%>/upload/story/<%=slist.get(1).getStoryTeacherpicture()%>');"></div>
            <div class="text">
            
              <p><%=slist.get(1).getStoryContent() %></p>
              <p class="text-primary h3"><%=myplist.get(1).getpTitle() %></p>

            </div>

          </div>

        </div>

        <div class="col-md-6">
          <div class="sched d-block d-lg-flex">
            <div class="bg-image order-2" style="background-image: url('<%=request.getContextPath()%>/upload/story/<%=slist.get(2).getStoryTeacherpicture()%>');"></div>
            <div class="text order-1">
              
              <p><%=slist.get(2).getStoryContent() %></p>
              <p class="text-primary h3"><%=myplist.get(2).getpTitle() %></p>

            </div>

          </div>

          <div class="sched d-block d-lg-flex">
            <div class="bg-image" style="background-image: url('<%=request.getContextPath()%>/upload/story/<%=slist.get(3).getStoryTeacherpicture()%>');"></div>
            <div class="text">
           
              <p><%=slist.get(3).getStoryContent() %></p>
              <p class="text-primary h3"><%=myplist.get(3).getpTitle() %></p>

            </div>

          </div>
		
        </div>
