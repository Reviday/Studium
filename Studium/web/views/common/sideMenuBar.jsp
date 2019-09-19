<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, java.util.ArrayList , com.studium.util.model.vo.SideMenuElement"%>
<% 
	List<SideMenuElement> elements=(List<SideMenuElement>)request.getAttribute("elements");
	String choice=(String)request.getAttribute("choice");
%>
<link href="<%=request.getContextPath()%>/css/all.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/sidemenubar.css"
	rel="stylesheet">
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

		<div class="menu-list">
			<ul id="menu-content" class="menu-content collapse out">

				<%
			int flag=-1; // 마지막 하위메뉴 처리를 위한 flag
			int count=0; // 마지막 메뉴 판단을 위한 변수
			int uCount=0; // 상위 메뉴 개수 판단과 하위 메뉴와의 매칭을 위한 변수
			for(SideMenuElement element : elements) {
				// count 가산
				count++;
				// parent_id의 값이 0일 경우, 상위 메뉴 
				if(element.getParentId()==0) {
					// 해당 분기에 들어왔는데, flag값이 0일 경우 
					// 이전 분기에서 하위 요소를 처리하였다는 의미. 
					// 때문에 하위 요소 처리 후 ul 태그를 닫아주어야 한다.
					if(flag==0) {
		%>
			</ul>
			<%				
						// 동시에 flag=-1 설정
						flag=-1;
					}
					// 상위 메뉴 생성
					// 동시에 uCount 가산
					uCount++;
		%>
			<li data-toggle="collapse" data-target="#element<%=uCount %>"
				class="collapsed <%=choice!=null&&choice.equals(element.getMenuName())?"choice":""%>">
				<a class="top-menu"
				<%
							//만약 하위메뉴가 존재하면 href 설정을 주지 않고,
							//하위메뉴가 존재하지 않는다면, 상위 메뉴가 href를 갖는다. 
							if(element.getUseDown()=='N') {
						%>
				href="<%=request.getContextPath()%><%=element.getMenuUrl()%>"
				<%
							}
						%>> <i
					class="<%=element.getMenuClass()%>"></i> <%=element.getMenuName()%>
					<%
								//하위 메뉴가 있을 경우 화살표 표기를 위한 클래스 추가
								if(element.getUseDown()=='Y') {
									flag=1; // 하위 메뉴가 있으면 1로 설정한다. 
							%> <span class="arrow"></span> <%
								}
							%>
			</a>
			</li>
			<%
				} else {
				// parent_id의 값이 0이 아닐 경우, 하위 메뉴
					// 하위 메뉴 생성
					// flag가 1이라면 첫 메뉴이므로 ul 태그 생성
					if(flag==1) {
		%>
			<ul class="sub-menu collapse" id="element<%=uCount %>">
				<li><a class="down-menu"
					href="<%=request.getContextPath()%><%=element.getMenuUrl()%>">
						<%=element.getMenuName()%>
				</a></li>
				<%	
						//첫 하위 메뉴 처리 후 flag값을 0으로 돌려 일반 요소임을 알림.		
						flag=0;
					} else if(flag==0) {
						// 일반 요소는 ul을 열거나 닫지 않는다.
		%>
				<li><a class="down-menu"
					href="<%=request.getContextPath()%><%=element.getMenuUrl()%>">
						<%=element.getMenuName()%>
				</a></li>
				<% 
					} 
					// 해당 요소가 모든 요소의 마지막 요소일 경우 ul을 닫는다.
					// 참고로 이 분기는 하위 요소만 들어올 수 있다.
					if(count==elements.size()) {
		%>
			</ul>
			<%
					}
				} 
			}
		
		%>
		</div>
	</div>
</div>