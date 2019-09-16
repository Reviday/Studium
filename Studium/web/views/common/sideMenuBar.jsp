<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList , com.studium.util.model.vo.SideMenuElement"%>
<% 
	List<SideMenuElement> elements=(List<SideMenuElement>)request.getAttribute("elemnents");
	// 요소의 순서 정하기(각 요소의 순서는 order에 의해 정해져 있고
	// order는 관리자에 의해 수정 가능한 부분이다.)
	List<SideMenuElement> useElements=new ArrayList(); //정렬된 요소가 저장될 리스트 
	for(SideMenuElement element : elements) {
		//parent값이 null일 경우 
		if(element.getSmParent()==null) {
			//
		}
	}
%>
<link href="<%=request.getContextPath()%>/css/all.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/sidemenubar.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/sidemenubar.js"></script>
<!-- Side Menu -->
<div class="nav-side-menu">
	<div class="side-menu">
		<div class="brand" style="height: 57px">
			<a href="index.html"> <img style="margin: 5px"
				src='<%=request.getContextPath()%>/img/studium_en_logo_white.png'
				onmouseover="this.src='<%=request.getContextPath()%>/img/studium_ko_logo_white.png'"
				onmouseout="this.src='<%=request.getContextPath()%>/img/studium_en_logo_white.png'"
				alt="Studium" width="50px;">
			</a>
		</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>
			
			
	<%
		for(SideMenuElement element : elements) {
			
			
	%>
	
	<% 		
		}
	%>
		<div class="menu-list">

			<ul id="menu-content" class="menu-content collapse out">
				<li><a href="#"> <i class="fas fa-tachometer-alt fa-lg"></i>
						마당소개
				</a></li>
				<li data-toggle="collapse" data-target="#products"
					class="collapsed active"><a href="#"> <i
						class="fab fa-studiovinari fa-lg"></i> 공부마당 <span class="arrow"></span></a></li>
				<ul class="sub-menu collapse" id="products">
					<li class="active"><a href="#">CSS3 Animation</a></li>
					<li><a href="#">General</a></li>
					<li><a href="#">Buttons</a></li>
					<li><a href="#">Tabs & Accordions</a></li>
					<li><a href="#">Typography</a></li>
					<li><a href="#">FontAwesome</a></li>
					<li><a href="#">Slider</a></li>
					<li><a href="#">Panels</a></li>
					<li><a href="#">Widgets</a></li>
					<li><a href="#">Bootstrap Model</a></li>
				</ul>


				<li data-toggle="collapse" data-target="#service" class="collapsed"><a
					href="#"> <i class="fab fa-fort-awesome-alt fa-lg"></i> 자유마당 <span
						class="arrow"></span></a></li>
				<ul class="sub-menu collapse" id="service">
					<li>New Service 1</li>
					<li>New Service 2</li>
					<li>New Service 3</li>
				</ul>


				<li data-toggle="collapse" data-target="#new" class="collapsed">
					<a href="#"> <i class="fab fa-pagelines fa-lg"></i> 공유마당 <span
						class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="new">
					<li>New New 1</li>
					<li>New New 2</li>
					<li>New New 3</li>
				</ul>


				<li><a href="#"> <i class="fas fa-user-tie fa-lg"></i> 자랑마당
				</a></li>

				<li><a href="#"> <i class="fa fa-users fa-lg"></i> 질문마당
				</a></li>
			</ul>
		</div>
	</div>
</div>