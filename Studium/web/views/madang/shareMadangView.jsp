<%@page import="com.studium.madang.model.vo.ShareMadangCmt"%>
<%@page import="com.studium.madang.model.vo.ShareMadang"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ShareMadang sm = (ShareMadang) request.getAttribute("sm");
	int cPage = (int)request.getAttribute("cPage");
	List<ShareMadangCmt> list = (List<ShareMadangCmt>)request.getAttribute("cmtList");
	int totalDate = (int)request.getAttribute("totalData");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss", Locale.KOREA);
	
	//prev, next 기능을 위해서 앞글과 이전글의 번호를 가져와야한다.
	Map<String, ShareMadang> preNext=(Map<String, ShareMadang>)request.getAttribute("preNext");
	
	
%>

<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/madangview.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/madang.js"></script>
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<!-- 네이버 카페의 게시글 View를 상당히 많이 참고하였음.(이뻐서) -->
<!-- 게시글 View Section -->
<section id="content-area" class="row">
	<div class="col-xs-4 col-sm-3 col-md-3 col-lg-2"
		style="padding-left: 0">
		<!-- 사이드 메뉴가 들어갈 곳 -->
		<%@ include file="/views/common/sideMenuBar.jsp"%>
	</div>
	<div class="col-lg-1"></div>
	<!-- 게시글 View Main -->
	<div id="main-area" class="col-xs-6 col-sm-6 col-md-7 col-lg-7">
		<div class="madang-list mldiv">
			<div class="sub-tit row mldiv">
				<div class="title-area mldiv">
					<h3 class="list-title">공유마당</h3>
					<p class="list-sub">자유롭게 정보와 자료를 공유하는 공간입니다.<br>(저작권엔 유의하여 주시기 바랍니다 ^ - ^)</p>
				</div>
			</div>
		</div>


		<!-- 게시글 View -->
		<div class="madang-view">
			<!-- 뷰 전체 box -->
			<div class="inbox">
				<!-- 타이틀 -->
				<div class="tit-box">
					<!-- 제목/메뉴 위치 -->
					<div class="fl">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr valign="top">
									<td><span class="b m-tcol-c"><%=sm.getMadangTitle()%></span></td>
									<td nowrap="" class="m-tcol-c" style="opacity: 0.3">|</td>
									<td nowrap="" class="m-tcol-c"><a href="#" onclick=""
										class="m-tcol-c" style="color: #ccc">[현재 메뉴 위치]</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 작성일 -->
					<div class="fr">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr>
									<td></td>
									<td class="m-tcol-c date"><%=format.format(sm.getMadangRegisterDatetime())%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- form // 게시글에 필요한 hidden 정보를 담아둔다. -->
				<form action="">
					<input type="hidden" name="" value="">
				</form>

				<!-- 경계 표시용 border -->
				<div class="board-box-line-dashed"></div>

				<!-- 기타 정보 박스// 이름(이메일) etc.. -->
				<div class="etc-box">
					<!-- 프로필 사진/이름(이메일) -->
					<div class="fl">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr>
									<td class="m-tcol-c b nick">
										<table role="presentation" cellspacing="0">
											<tbody>
												<tr>
													<td class="profile_img"><a href="#"> <!-- 프로필이미지가 없을 경우 다음 이미지로 대채한다. -->
															<img src="<%=request.getContextPath()%>/upload/myPage/<%=sm.getProfilePath()%>" width="24" height="24"
															onerror="this.onerror='';this.src='<%=request.getContextPath()%>/img/nonProfile.png'">
													</a></td>
													<td class="p-nick">
														<!-- 이름/이메일 클릭 시, 해당 유저의 게시글보기/1:1채팅/쪽지보내기 등을 드롭다운 박스로 표시 -->
														<a href="#" class="m-tcol-c b"><%=sm.getMadangWriterName()%>
															<!-- 아이디 별표(*)처리 --> (<%=sm.getMadangWriterEmail().substring(0, 4)%>****)</a>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="m-tcol-c step"><span class="filter-50">
											매니저 <%
										
									%>
									</span> <img class="levelico"
										src="<%=request.getContextPath()%>/img/manager_icon.png"
										width="11" height="11" border="0"></td>

									<td class="m-tcol-c chat"><span> <a href="#"
											onclick=""> <img
												src="<%=request.getContextPath()%>/img/chatting_icon.png"
												width="20" height="20" alt="1:1대화" class="ico" title="1:1대화">
										</a>
									</span></td>

								</tr>
							</tbody>
						</table>
					</div>
					<!-- 나중에 필요하면 추가 -->
					<div class="fr"></div>
				</div>
				<!-- height 10 짜리인 빈 공간 및 float 초기화용 -->
				<div class="h10"></div>

				<!-- 실제 작성 내용 -->
				<div class="tbody m-tcol-c" id="tbody"
					style="padding-left: 43px; padding-right: 43px; margin-right: 0px;">
					<pre><%=sm.getMadangContent()%></pre>
				</div>

				<div class="h40"></div>

				<!-- 하단 item box -->
				<div class="bottom-box">
					<!-- left item -->
					<div class="fl reply_sort">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr style="vertical-align: top">
									<!-- 댓글 수 -->
									<td class="reply"><a href="javascript:"
										class="reply_btn b m-tcol-c m-tcol-p _totalCnt" id="comment">댓글
											1 <img class="new_icon"
											src="<%=request.getContextPath()%>/img/new_icon.png"
											width="20" height="20" padding_bottom="2" alt="new">

									</a></td>
									<!-- 조회 수 -->
									<td class="m-tcol-c filter-30">|</td>
									<td><span class="b m-tcol-c reply ">조회수 </span> <span
										class="b m-tcol-c reply">3</span></td>
									<!-- 포크 -->
									<td class="m-tcol-c filter-30">|</td>
									<td><a href="#" class="b fork_btn">포크</a>
										<div class="btn_module">
											<a href="#" class="btn_cnt" aria-pressed="false"> <img
												class="fork_icon"
												src="<%=request.getContextPath()%>/img/fork_icon.png" alt="">
												<em class="fork_count">10</em>
											</a>
										</div></td>
									<!-- 좋아요 -->
									<td class="m-tcol-c filter-30">|</td>
									<td><a href="#" class="b like_btn">좋아요</a>
										<div class="btn_module">
											<a href="#" class="btn_cnt" aria-pressed="false"> <img
												class="dibs_icon"
												src="<%=request.getContextPath()%>/img/like_icon_click.png"
												alt=""> <em class="like_count">100</em>
											</a>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="h10"></div>

				<!-- 댓글 -->
				<div class="box-reply2 bg-color u_cbox" id="comment"
					style="display: block;">
					<h3 class="ir_su">댓글 작성</h3>
					<!-- 댓글 폼 -->
					<div class="tab_container">
						<!-- 댓글 작성 테이블 -->
						<table cellspacing="0" class="cminput">
							<tbody>
								<tr>
									<td class="i2">
										<div class="comm_write_wrap border-sub skin-bgcolor">
											<textarea id="comment_text" cols="50" rows="2"
												class="textarea m-tcol-c" maxlength="6000"
												style="overflow: hidden; line-height: 14px; height: 39px;"
												title="댓글입력"></textarea>
										</div>
									</td>
									<td class="i3">

										<div class="u_cbox_btn_upload _submitBtn">
											<a href="#" class="u_cbox_txt_upload _submitCmt" 
											onclick="fn_addComment('<%=loginMember!=null?loginMember.getMemNo():null%>','<%=request.getContextPath() %>','<%=REMOTE_ADDR%>','<%=sm.getMadangNo()%>','<%=loginMember!=null?loginMember.getMemNo():""%>','<%=loginMember!=null?loginMember.getMemUserEmail():""%>','<%=loginMember!=null?loginMember.getMemName():""%>','<%=cPage%>'); return false;">
											등록</a>													
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3"></td>
								</tr>
							</tbody>
						</table>
						<!-- 탭 : 댓글 -->
						<div id="tab1C" class="tab_content">
							<div id="entry361Comment">
								<div id="comment">
									<!-- } comment-form -->
									<ol id="comment-list" class="cng-list list-unstyled">
									<%
										if(!list.isEmpty()) {

											for(ShareMadangCmt cmt : list) {
												//댓글 테이블 특성상 sort값이 0이면 부모댓글이다.
												if(cmt.getCmtSort()==0) {
													//부모 댓글 작성 로직
									%>
													<li id="comment<%=cmt.getCmtNo()%>" class="<%=cmt.getCmtReply()=='Y'?"has-reply":""%>">
						                                <div class="rp_general cng-container">
						                                    <div class="cng-header">
						                                        <span class="blogicon"></span>
						                                        <span class="name ie-nanum">
						                                            <img src="<%=request.getContextPath()%>/upload/myPage/<%=cmt.getProfilePath()%>"
						                                                alt="BlogIcon" width="64" height="64"
						                                                onerror="this.onerror='';this.src='<%=request.getContextPath()%>/upload/myPage/nonProfile.png'">
						                                            <a href="https://sonylove.tistory.com"
						                                                onclick="return openLinkInNewWindow(this)">
						                                                <%=cmt.getCmtWriterName()%>
						                                            </a>
						                                        </span>
						                                        <span class="timeago dt-published ie-dotum" title="">
						                                            <%=format.format(cmt.getCmtRegisterDatetime())%>
						                                        </span>
						                                        <a href="/toolbar/popup/abuseReport/?entryId=361&amp;commentId=9743709"
						                                            onclick="window.open(this.href, 'tistoryThisBlogPopup', 'width=550, height=510, toolbar=no, menubar=no, status=no, scrollbars=no'); return false;">신고</a>
						                                    </div>
						                                    <div class="cng-content">
						                                        <div class="speech">
						                                            <div class="comm_body">
						                                                <span>
						                                                    <%=cmt.getCmtContent()%>
						                                                </span>
						                                            </div>
						                                        </div>
						                                    </div>
						                                    <a href="#" onclick="deleteComment(<%=cmt.getCmtNo()%>);return false"
						                                        class="modify" title="수정/삭제"><i
						                                        class="icon icon-cancel_circle"></i></a>
						                                    <div class="comm-bottom">
						                                        <button onclick="fn_writeComment(<%=cmt.getCmtNo()%>);"
						                                            class="btn-init ie-dotum write">
						                                            <span class="arrow-symbol dsc_comm">답글달기</span>
						                                        </button>
						                                        <table cellspacing="0" class="cminput _cminputRep" id="re_conmmentRep<%=cmt.getCmtNo()%>"
						                                            style="display: none">
						                                            <tbody>
						                                                <tr>
						                                                    <td class="i2">
						                                                        <div class="comm_write_wrap border-sub skin-bgcolor">
						                                                            <textarea id="comment_text_rep" cols="50" rows="2"
						                                                                class="textarea m-tcol-c" maxlength="6000"
						                                                                style="overflow: hidden; line-height: 14px; height: 39px;"
						                                                                title="댓글입력"></textarea>
						                                                        </div>
						                                                    </td>
						                                                    <td class="i3">
						
						                                                        <div class="u_cbox_btn_upload _submitBtnRep">
																					<a href="#" class="u_cbox_txt_upload _submitCmt" 
																					onclick="fn_addReply('<%=loginMember!=null?loginMember.getMemNo():null%>','<%=request.getContextPath() %>','<%=REMOTE_ADDR%>','<%=sm.getMadangNo()%>','<%=cmt.getCmtNo() %>','<%=loginMember!=null?loginMember.getMemNo():""%>','<%=loginMember!=null?loginMember.getMemUserEmail():""%>','<%=loginMember!=null?loginMember.getMemName():""%>','<%=cPage%>'); return false;">
																					등록</a>													
						                                                        </div>
						                                                    </td>
						                                                </tr>
						                                                <tr>
						                                                    <td colspan="3"></td>
						                                                </tr>
						                                            </tbody>
						                                        </table>
						                                    </div>
						                                </div>
						                             </li>
									<%	
                                
												// sort값이 0이 아니라면 대댓글이다.
												} else {
													//대댓글 작성 로직
									%>					
												<li class="reply-list list-unstyled <%=cmt.getCmtSort()==1?"last":"" %>" id="comment<%=cmt.getCmtNo()%>">
                                                            <div class="rp_admin cng-container">
                                                                <div class="cng-header">
                                                                    <span class="blogicon"></span> 
                                                                    <span class="name ie-nanum">
                                                                        <img src="<%=request.getContextPath()%>/upload/myPage/<%=cmt.getProfilePath()%>" alt="BlogIcon"
                                                                            width="64" height="64"
                                                                            onerror="this.onerror='';this.src='<%=request.getContextPath()%>/upload/myPage/nonProfile.png'"> 
                                                                        <a href="https://cocosoft.kr"
                                                                        onclick="return openLinkInNewWindow(this)"><%=cmt.getCmtWriterName() %>
                                                                        </a>
                                                                    </span> 
                                                                    <span class="timeago dt-published ie-dotum" title=""><%=format.format(cmt.getCmtRegisterDatetime())%> 
                                                                        <a href="/toolbar/popup/abuseReport/?entryId=361&amp;commentId=9743723"
                                                                        onclick="window.open(this.href, 'tistoryThisBlogPopup', 'width=550, height=510, toolbar=no, menubar=no, status=no, scrollbars=no'); return false;">신고</a>
                                                                    </span>
                                                                </div>
                                                                <div class="cng-content">
                                                                    <div class="speech">
                                                                        <div class="comm_body">
                                                                            <span> 
                                                                                <%=cmt.getCmtContent() %>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <a href="#"
                                                                    onclick="deleteComment(<%=cmt.getCmtNo()%>); return false;"
                                                                    class="modify" title="수정/삭제"><i
                                                                    class="icon icon-cancel_circle"></i></a>
        
                                                                <div class="dropdown">
                                                                    <button class="btn-init" data-toggle="dropdown"
                                                                        aria-expanded="true">
                                                                        <i class="icon icon-more-vert"></i>
                                                                    </button>
                                                                    <ul class="dropdown-menu">
                                                                        <li><a href="#" onclick="" tabindex="-1">답글달기</a></li>
                                                                        <li><a href="#"
                                                                            onclick="deleteComment(<%=cmt.getCmtNo()%>); return false;"
                                                                            tabindex="-1">수정/삭제</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                             	</li>
														
									<%
												}
											}
									}
									%>
									</ol>

								</div>
							</div>
						</div>
						<!-- 탭 : 댓글 -->
					</div>
				</div>

				<div style="clear: both; height: 0pt; font: 0pt/0pt arial;"></div>
				<div style="display: none;" class="cc_paginate cmt"
					id="cmt_paginate">
					<!-- 댓글 페이징 처리 -->
					<% 
						//댓글 총 갯수가 30개를 초과한다면 (한 페이지당 30개)
						//댓글 페이징 처리를 한다.
						if(totalDate>30) {
					%>
							<%@ include file="/views/common/pagination.jsp"%>
					<%
						}
					%>
					
				</div>
				<!--
                        <div class="m-tcol-c reply_error" style="display:none;">
                            <strong>죄송합니다. 댓글 시스템 오류로 댓글을 읽거나 쓸 수 없습니다.</strong>
                            문제가 지속될 경우 <a href="http://help.naver.com/" target="_blank" class="m-tcol-c">고객센터</a>에 알려주시면
                            친절하게 안내해 드리겠습니다.
                        </div>-->
			</div>
		</div>

	
	</div>
	<!-- 리모콘 -->

	<div id="remocon" class="col-lg-1" style="diplay: block">
		<div class="remote-area">
			<div class="remote-area-radi-top"></div>
			<div class="remote-area-body">
				<div class="btn btn_upper">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c <%=preNext.get("next").getMadangNo()!=0?"":"disabled"%>" 
							onclick="location.href='<%=request.getContextPath()%>/madang/shareMadangView?madangNo=<%=preNext.get("next").getMadangNo()%>&cPage=<%=cPage%>&choiceSub=<%=choiceSub%>'"> 
						<img id="upper-arrow" src="<%=request.getContextPath()%>/img/arrow_icon.png" class="<%=preNext.get("next").getMadangNo()!=0?"":"sepia"%>"
							width="30px" height="30px" alt="" />
						</a>
					</p>
				</div>
				<div class="btn btn_lower">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c" onclick="location.href='<%=request.getContextPath()%>/madang/shareMadangList?cPage=<%=cPage%>&choiceSub=<%=choiceSub%>'"> 
						<img id="goList" src="<%=request.getContextPath()%>/img/list_icon.png"
							width="30px" height="30px" alt="" />
						</a>
					</p>
				</div>
				<div class="btn">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c <%=preNext.get("prev").getMadangNo()!=0?"":"disabled"%>" 
							onclick="location.href='<%=request.getContextPath()%>/madang/shareMadangView?madangNo=<%=preNext.get("prev").getMadangNo()%>&cPage=<%=cPage%>&choiceSub=<%=choiceSub%>'"> 
							<img id="lower-arrow" src="<%=request.getContextPath()%>/img/arrow_icon.png" class="<%=preNext.get("prev").getMadangNo()!=0?"":"sepia"%>"
							width="30px" height="30px" alt="" />
						</a>
					</p>
				</div>
			</div>
			<div class="remote-area-radi-bottom"></div>
		</div>
	</div>
	<div class="col-lg-1"></div>
</section>
<%@ include file="/views/common/footer.jsp"%>