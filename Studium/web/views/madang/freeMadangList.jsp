<%@page import="com.studium.madang.model.vo.FreeMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<FreeMadang> fmlist = (List) request.getAttribute("freeMadangList");
	int cPage = (int) request.getAttribute("cPage");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd.");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<section class="madang-section row">
<div class="col-xs-4 col-sm-3 col-md-3 col-lg-3" style="padding-left:0">
<%@ include file="/views/common/sideMenuBar.jsp"%>	
</div>
		<div class="wrapper col-xs-6 col-sm-6 col-md-9 col-lg-8">
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
											<a class="article" href="<%=request.getContextPath()%>/madnag/freeMadangView?madangNo=<%=fm.getMadangNo() %>&cPage=<%=cPage%>">
												 <%=fm.getMadangTitle()%>
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
				
					<%@ include file="/views/common/pagination.jsp"%>

				</div>
			</div>

		</div>



</section>


<%@ include file="/views/common/footer.jsp"%>