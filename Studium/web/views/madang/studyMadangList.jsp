<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd.");
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
		style="min-height: 600px; height: auto !important; min-height: 0px !important;">
		<div class="madang-list mldiv">
			<div class="sub-tit row mldiv">
				<div class="title-area mldiv">
					<h3 class="list-title">공부마당</h3>
					<p class="list-sub">서로가 문제를 출제하고 문제를 풀어보는 공간입니다.</p>
				</div>
				<div class="sort_area mldiv">
					<input type="checkbox" id="notice_checkbox"> <label
						for="notice_checkbox">공지 숨기기</label>
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
			<div class="question-area" style="height: auto !important;">
				<div class="question-dummy clearfix">
					<table class="qna_tb">
						<tr>
							<td>
								<div class="col-md-1 col-xs-2 list-count">
									<div class="votes">
										<div class="votes-count text-center">71</div>
										<div class="votes-text text-center">추천</div>
									</div>
									<div class="answers">
										<div class="answers-count text-center">796</div>
										<div class="answers-text text-center">풀이</div>
									</div>
								</div>

							</td>
							<td>
								<div class="question-line col-md-11 col-xs-10">

									<a href="/scode/level/365" class="belt-link"><span
										title="난이도 2" class="pull-right label label-success">Lv.
											2</span></a> <a href="/scode/365?answer_mode=hide"
										class="question-subject">넥슨 입사문제 중에서</a>
									<div class="question-summary">어떤 자연수 n이 있을 때, d(n)을 n의 각
										자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자. 예를 들어 &gt; d(91) = 9 + 1 + 91 =
										101 이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의
										제네레이터이다. 어떤 숫자 ...</div>
									<div class="row">
										<div class="col-md-8"></div>
										<div class="col-md-4"
											style="text-align: right; margin-top: 5px;">
											<span class="question-profile"> 2011/08/14 14:32 </span>
										</div>

									</div>

								</div>
							</td>
						</tr>
					</table>


				</div>
			</div>

		</div>
	</div>

</section>

<script src="<%=request.getContextPath()%>/js/madang.js"></script>
<%@ include file="/views/common/footer.jsp"%>