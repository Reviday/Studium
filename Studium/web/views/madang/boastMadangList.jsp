<%@page import="com.studium.madang.model.vo.BoastMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<BoastMadang> bmlist = (List) request.getAttribute("boastMadangList");
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
<div class="col-xs-4 col-bm-3 col-md-3 col-lg-2" style="padding-left:0">
<%@ include file="/views/common/sideMenuBar.jsp"%>	
</div>
<div class="col-lg-1"></div>
		<div class="wrapper col-xs-6 col-bm-6 col-md-7 col-lg-9" style="min-height: 600px">
			<div class="madang-list mldiv">
				<div class="sub-tit row mldiv">
					<div class="title-area mldiv">
						<%
	                		if(choiceSub!=null&&choiceSub.equals("null")) {
	                			%>
	                				<h3 class="list-title">자랑마당</h3>
	                			<%
	                		} else {
	                			%>
	                				<h3 class="list-title">자랑마당<%=choiceSub!=null?" - " +choiceSub:""%></h3>
	                			<%
	                		}
                		%>
						<p class="list-sub">자랑하고 싶은 부분을 마음껏 자랑하는 공간입니다!</p>
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
								if (!bmlist.isEmpty()) {
									for (BoastMadang bm : bmlist) {
							%>
							<tr class="_noticeArticle board-notice type_main">
								<td class="td_article">

									<div class="board-tag">
										<!-- <strong class="board-tag-txt">
		                                <span class="inner">공지</span>
		                            </strong>  공지는 이거로-->
										<span class="inner" style="text-align: center"><%=bm.getMadangNo()%></span>
									</div>
								</td>
								<td class="td_article">
									<div class="board-list">
										<div class="inner_list">
											<a class="article" href="<%=request.getContextPath()%>/madang/boastMadangView?madangNo=<%=bm.getMadangNo() %>&cPage=<%=cPage%>&choiceSub=<%=request.getParameter("choiceSub")%>">
												<%=bm.getMadangTitle()%>
												<%
													if(bm.getMadangRepCount()>0) {
														%>
															<span style="color:rgb(239, 108, 0); display: inline;">　[<%=bm.getMadangRepCount()%>]</span>
														<%
													}
												%>
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
														class="" onclick=""> <%=bm.getMadangWriterName()%></a> <span
														class="mem-level"><img
															src="https://cafe.pstatic.net/levelicon/1/1_888.gif"
															width="11" height="11"></span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
								<td class="td_date"><%=format.format(bm.getMadangRegisterDatetime())%></td>
								<td class="td_view"><%=bm.getMadangReadCount()%></td>
								<td class="td_like"><%=bm.getMadangRecCount()%></td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
					
					<!-- 버튼 -->
					<div class="post_btns">
						<div class="fr">
							<a href="#" id="writeFormBtn"
								onclick="fn_madangWrite('<%=loginMember!=null?loginMember.getMemNo():null%>','<%=request.getContextPath()%>','boast','<%=choice%>','<%=choiceSub%>'); return false;"
								class="btn_type1 post_write _rosRestrict">글쓰기</a>
						</div>
					</div>
					
				</div>
				<%@ include file="/views/common/pagination.jsp"%>
			</div>

		</div>



</section>
<script src="<%=request.getContextPath() %>/js/madang.js"></script>
<%@ include file="/views/common/footer.jsp"%>