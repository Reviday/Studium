<%@page import="com.studium.madang.model.vo.StudyMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<StudyMadang> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd. kk:mm:ss");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/studymadang.css"
	rel="stylesheet">
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<section class="madang-section madang-content row">
	<div class="col-xs-4 col-sm-3 col-md-3 col-lg-2"
		style="padding-left: 0">
		<%@ include file="/views/common/sideMenuBar.jsp"%>
	</div>
	<div class="col-lg-1"></div>
	<div class="wrapper page col-md-9 col-lg-8" id="scode_content"
		style="min-height: 600px; height: auto; ">
		<div class="madang-list mldiv">
			<div class="sub-tit row mldiv">
				<div class="title-area mldiv">
					<%
                		if(choiceSub!=null&&choiceSub.equals("null")) {
                			%>
                				<h3 class="list-title font-family-type1">공부마당</h3>
                			<%
                		} else {
                			%>
                				<h3 class="list-title font-family-type1">공부마당<%=choiceSub!=null?" - " +choiceSub:""%></h3>
                			<%
                		}
                	%>
					<p class="list-sub">서로가 문제를 출제하고 문제를 풀어보는 공간입니다.</p>
				</div>
			</div>
			<div class="question-filter">
				<ul class="nav nav-tabs">
					<li class="" style="padding: 0;"><a style="cursor: pointer;"
						href="/list/1?sort=newest&amp;sort_order=fw"> 최신순 </a></li>
					<li class="active" style="padding: 0;"><a
						style="cursor: pointer;"
						href="/list/1?sort=recommend&amp;sort_order=rw"> 추천순 <span
							class="caret-order"></span>

					</a></li>
					<li class="" style="padding: 0;"><a style="cursor: pointer;"
						href="/list/1?sort=answer&amp;sort_order=fw"> 인기순 </a></li>
					<li class="" style="padding: 0;"><a style="cursor: pointer;"
						href="/list/1?sort=level&amp;sort_order=fw"> 난이도순 </a></li>
				</ul>
			</div>
			
			<!-- 문제 -->
			<div class="question-area" style="height: auto !important;">
				<div class="question-dummy clearfix" style="margin-bottom:200px;">
					<table class="qna_tb">
						<%
							if(!list.isEmpty()) {
								//리스트가 있으면
								for(StudyMadang s : list) {
									//리스트내의 정보를 출력한다.
						%>
									<tr>
										<td>
											<div class="col-md-1 col-xs-2 list-count">
												<div class="votes">
													<div class="votes-count text-center"><%=s.getMadangRecCount() %></div>
													<div class="votes-text text-center">추천</div>
												</div>
												<div class="answers">
													<div class="answers-count text-center"><%=s.getMadangAnswerCount() %></div>
													<div class="answers-text text-center">풀이</div>
												</div>
											</div>
			
										</td>
										<td>
											<div class="question-line col-md-11 col-xs-10">
			
												<a href="/scode/level/365" class="belt-link">
													<span title="난이도 2" class="pull-right label label-success">
														Lv.<%=s.getMadangLevel() %>
													</span>
												</a> 
												<a class="question-subject" style="text-decoration:none;"
												<%
													if(loginMember!=null) {
												%>
													href="<%=request.getContextPath()%>/madang/studyMadangView?madangNo=<%=s.getMadangNo() %>&cPage=<%=cPage%>&choiceSub=<%=request.getParameter("choiceSub")%>"
												<%
													} else {
												%>
													href="#" onclick="fn_needLogin();return false;"
												<%
													}
												%>
												><%=s.getMadangTitle() %>
												</a>
												<div class="question-summary">
													<div class="d-textarea">
														<%=s.getMadangContent() %>
													</div>
												</div>
												<div class="row">
													<div class="col-md-8">
														
															<%
																if(s.getMadangSubCategory()!=null) {
																		String[] tempArray=s.getMadangSubCategory().split(", ");
																	for(String category : tempArray) {
																		%>
																		<span class="label label-tag code-tag"><%=category %></span>
																		<%
																	}
																}
															%>
														
													</div>
													<div class="col-md-4"
														style="margin-top: 5px;">
														<span class="question-profile" style="text-align: right"> <%=format.format(s.getMadangRegisterDatetime()) %> </span>
													</div>
			
												</div>
			
											</div>
										</td>
									</tr>
						<%
								}
							}
						%>
						
					</table>
					<!-- 버튼 -->
					<div class="post_btns btn_font_family1">
						<div class="fr">
							<a href="#" id="writeFormBtn"
								onclick="fn_madangWrite('<%=loginMember!=null?loginMember.getMemNo():null%>','<%=request.getContextPath()%>','share','<%=choice%>','<%=choiceSub%>'); return false;"
								class="btn_type1 post_write _rosRestrict">글쓰기</a>
						</div>
					</div>


				</div>
			</div>

		</div>
	</div>

</section>

<script src="<%=request.getContextPath()%>/js/madang.js"></script>
<%@ include file="/views/common/footer.jsp"%>