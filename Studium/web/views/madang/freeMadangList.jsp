<%@page import="com.studium.madang.model.vo.FreeMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<FreeMadang> fmlist = (List) request.getAttribute("freeMadangList");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.dd.MM.");
%>
<%@ include file="/views/common/header.jsp"%>

<style>
.madang-section {
	position: relative;
	height: 1800px;
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
}

.wrapper {
	position: relative;
	height: 1800px;
}
/*
.middle {
	position: absolute;
	top: 0;
	left: 0;
	width: 300px;
	margin: 0 !important;
} */
.madang-list {
	position: absolute;
	top: 0;
	left: 300px;
	margin: 0 !important;
}
<!--
-->
</style>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/all.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/sidemenubar.css"
	rel="stylesheet">

<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<section class="madang-section">
	<div class="container">
		<div class="wrapper">
			<div class="nav-side-menu">
				<div class="brand" style="height:57px">
					<a href="index.html"> <img style="margin:5px"
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
						<li><a href="#"> <i class="fas fa-tachometer-alt fa-lg"></i>
								마당소개
						</a></li>

						<li data-toggle="collapse" data-target="#products"
							class="collapsed active"><a href="#"> <i
								class="fab fa-studiovinari fa-lg"></i> 공부마당 <span
								class="arrow"></span></a></li>
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


						<li data-toggle="collapse" data-target="#service"
							class="collapsed"><a href="#"> <i
								class="fab fa-fort-awesome-alt fa-lg"></i> 자유마당 <span
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


						<li><a href="#"> <i class="fas fa-user-tie fa-lg"></i>
								자랑마당
						</a></li>

						<li><a href="#"> <i class="fa fa-users fa-lg"></i> 질문마당
						</a></li>
					</ul>
				</div>
			</div>

			<!-- <div class="middle">
			        <div class="menu">
			            <li class="item" id="intro">
			                <a href="#intro" class="btn"><i class="fas fa-book-reader"></i>소개</a>
			                <div class="smenu">
			                    <a href="#">대분류 1</a>
			                    <a href="#">대분류 2</a>
			                    <a href="#">대분류 3</a>
			                </div>
			            </li>
			
			            <li class="item" id="free-madang">
			                <a href="#free-madang" class="btn"><i class="fas fa-user-friends"></i>자유마당</a>
			                <div class="smenu">
			                    <a href="#">대분류 1</a>
			                    <a href="#">대분류 2</a>
			                    <a href="#">대분류 3</a>
			                </div>
			            </li>
			
			            <li class="item" id="share-madang">
			                <a href="#share-madang" class="btn"><i class="fas fa-clone"></i>공유마당</a>
			                <div class="smenu">
			                    <a href="#">대분류 1</a>
			                    <a href="#">대분류 2</a>
			                    <a href="#">대분류 3</a>
			                </div>
			            </li>
			
			            <li class="item" id="question-madang">
			                <a href="#question-madang" class="btn"><i class="fas fa-edit"></i>풀이마당</a>
			                <div class="smenu">
			                    <a href="#">대분류 1</a>
			                    <a href="#">대분류 2</a>
			                    <a href="#">대분류 3</a>
			                </div>
			            </li>
			        </div>
			    </div> -->
			<div class="madang-list">
				<div class="sub-tit">
					<div class="title-area">
						<h3 class="list-title">자유마당</h3>
						<p class="list-sub">자유롭게 글을 올리는 공간입니다.</p>
					</div>
					<div class="sort_area">
						<input type="checkbox" id="notice_checkbox"> <label
							for="notice_checkbox">공지 숨기기</label>
					</div>
				</div>
				<div class="article-board" id="upperArticleList">
					<table>
						<caption>
							<span class="blind">게시물 목록</span>
						</caption>
						<colgroup>
							<col style="width: 88px">
							<col>
							<col style="width: 118px">
							<col style="width: 80px">
							<col style="width: 68px">
							<col style="width: 68px">
						</colgroup>
						<thead>
							<tr id="normalTableTitle">
								<th scope="col" colspan='2'><span class="article_title">제목</span></th>
								<th scope="col" class="th_name">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회</th>
								<th scope="col" class="th_like">좋아요</th>
							</tr>
							<tr id="simpleTableTitle" style="display: none;">
								<th colspan="6" style="height: 0px; padding: 0px;"></th>
							</tr>
						</thead>
						<tbody>
							<%
								if (!fmlist.isEmpty()) {
									for (FreeMadang fm : fmlist) {
							%>
							<tr class="_noticeArticle board-notice type_main">
								<td class="td_article">

									<div class="board-tag">
										<!-- <strong class="board-tag-txt">
		                                <span class="inner">공지</span>
		                            </strong>  공지는 이거로-->
										<span class="inner" style="text-align: center"><%=fm.getMadangNo()%></span>
									</div>
								</td>
								<td class="td_article">
									<div class="board-list">
										<div class="inner_list">
											<a href="#" onclick="" class="article"> <%=fm.getMadangTitle()%>
											</a>
										</div>
									</div>
								</td>
								<td class="td_name">
									<div class="pers_nick_area">
										<table role="presentation" cellspacing="0">
											<tbody>
												<tr>
													<td class="p-nick" style="padding: 0"><a href="#"
														class="" onclick=""> <%=fm.getMadangWriterName()%></a> <span
														class="mem-level"><img
															src="https://cafe.pstatic.net/levelicon/1/1_888.gif"
															width="11" height="11"></span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
								<td class="td_date"><%=format.format(fm.getMadangRegisterDatetime())%></td>
								<td class="td_view"><%=fm.getMadangReadCount()%></td>
								<td class="td_like"><%=fm.getMadangRecCount()%></td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>