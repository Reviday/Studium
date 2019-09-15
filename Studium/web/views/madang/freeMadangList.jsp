<%@page import="com.studium.madang.model.vo.FreeMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<FreeMadang> fmlist = (List) request.getAttribute("freeMadangList");
	int cPage = (int) request.getAttribute("cPage");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.dd.MM.");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<style>
.page {
	height: 100px;
	display: inline-block;
	text-align: center;
	width: 100%;
}

.pagination {
	list-style: none;
	display: inline-block;
	padding: 0;
	margin-top: 20px;
}

.pagination li {
	display: inline;
	text-align: center;
}

.pagination a {
	float: left;
	display: block;
	font-size: 14px;
	text-decoration: none;
	padding: 5px 12px;
	color: #96a0ad;
	line-height: 1.5;
}

.first {
	margin-right: 15px;
}

.last {
	margin-left: 15px;
}

.first:hover, .last:hover, .left:hover, .right:hover {
	color: #2e9cdf;
}

.pagination a.active {
	cursor: default;
	color: #ffffff;
}

.pagination a:active {
	outline: none;
}

.num-modal .num {
	margin-left: 3px;
	padding: 0;
	width: 30px;
	height: 30px;
	line-height: 30px;
	-moz-border-radius: 100%;
	-webkit-border-radius: 100%;
	border-radius: 100%;
}

.num-modal .num:hover {
	background-color: #ef6c00;
	color: #ffffff;
}

.num-modal .num.active, .num-modal .num:active {
	background-color: #ef6c00;
	cursor: pointer;
}

.arrow-left {
	width: 0;
	height: 0;
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
	border-right: 10px solid blue;
}
</style>
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<section class="madang-section">
	<%@ include file="/views/common/sideMenuBar.jsp"%>
	<div class="container">
		<div class="wrapper">
			<div class="madang-list mldiv">
				<div class="sub-tit row mldiv">
					<div class="title-area mldiv">
						<h3 class="list-title">자유마당</h3>
						<p class="list-sub">자유롭게 글을 올리는 공간입니다.</p>
					</div>
					<div class="sort_area mldiv">
						<input type="checkbox" id="notice_checkbox"> <label
							for="notice_checkbox">공지 숨기기</label>
					</div>
				</div>
				<div class="article-board row mldiv" id="upperArticleList">
					<table>
						<caption>
							<span class="ir_su">게시물 목록</span>
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
					<div class="page">
						<ul class="pagination num-modal">
							<li><a>처음 페이지</a></li>
							<li><a href="#"><<</a></li>
							<li><a href="#" class="active num">1</a></li>
							<li><a href="#" class="num">2</a></li>
							<li><a href="#" class="num">3</a></li>
							<li><a href="#" class="num">4</a></li>
							<li><a href="#" class="num">5</a></li>
							<li><a href="#" class="num">6</a></li>
							<li><a href="#" class="num">7</a></li>
							<li><a href="#" class="num">8</a></li>
							<li><a href="#" class="num">9</a></li>
							<li><a href="#" class="arrow right">>></a></li>
							<li><a href="#" class="last">끝 페이지</a></li>
						</ul>
					</div>

				</div>
			</div>

		</div>

	</div>

</section>


<%@ include file="/views/common/footer.jsp"%>