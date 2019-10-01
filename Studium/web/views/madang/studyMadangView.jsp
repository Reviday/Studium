<%@page import="com.studium.madang.model.vo.StudyMadangQuestion"%>
<%@page import="com.studium.madang.model.vo.StudyMadangCmt"%>
<%@page import="com.studium.madang.model.vo.StudyMadang"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	StudyMadang sm = (StudyMadang) request.getAttribute("sm");
	int cPage = (int)request.getAttribute("cPage");
	List<StudyMadangCmt> list = (List<StudyMadangCmt>)request.getAttribute("cmtList");
	List<StudyMadangQuestion> qList = (List<StudyMadangQuestion>)request.getAttribute("qList");
	int totalData = (int)request.getAttribute("totalData");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd. HH:mm:ss", Locale.KOREA);
	String show = (String)request.getAttribute("show");
	
	//prev, next 기능을 위해서 앞글과 이전글의 번호를 가져와야한다.
	Map<String, StudyMadang> preNext=(Map<String, StudyMadang>)request.getAttribute("preNext");
	
	
%>

<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/madangview.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/studymadang.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/markdown.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/default.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/studyview.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/simplemde.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstap-3.3.7.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/madang.js"></script>
<script src="<%=request.getContextPath()%>/js/markdown.js"></script>

<script src="<%=request.getContextPath()%>/js/simplemde.min.js"></script>
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
					<%
                		if(choiceSub.equals("null")) {
                			%>
                				<h3 class="list-title font-family-type1">공부마당</h3>
                			<%
                		} else {
                			%>
                				<h3 class="list-title font-family-type1">공부마당<%=choiceSub!=null?" - " +choiceSub:""%></h3>
                			<%
                		}
                	%>
					<p class="list-sub font-family-type1">서로가 문제를 출제하고 문제를 풀어보는 공간입니다.</p>
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
						<table role="presentation" class="border-none" cellspacing="0" cellpadding="0"
							border="0">
							<tbody >
								<tr valign="bottom" style="vertical-align: bottom; border:none;">
									<td style="border:none;">
										<div class="list-count-view">
												<div class="votes">
													<div class="votes-count text-center">
														<a href="#" 
														<%
															if(loginMember!=null) {
														%>
															onclick="fn_likeUp('<%=request.getContextPath()%>','study','<%=sm.getMadangNo()%>','<%=loginMember.getMemNo()%>','<%=REMOTE_ADDR %>'); return false;"
														<%		
															} else {
														%>
															onclick="fn_needLogin(); return false;"
														<%
															}
														%>
														>
															<%=sm.getMadangRecCount() %>
														</a>
													</div>
													<div class="votes-text text-center">추천</div>
												</div>
										</div>
									</td>
									<td >
										<span class="b m-tit"><%=sm.getMadangTitle()%></span>
									</td >
									<td nowrap="" class="m-tcol-c" style="opacity: 0.3">|</td>
									<td nowrap="" class="m-tcol-c"><a href="#" onclick=""
										class="m-tcol-c" style="color: #ccc">[현재 메뉴 위치]</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 작성일 -->
					<div class="fr" style="margin:0 !important;">
						<table role="presentation" class="border-none" cellspacing="0" cellpadding="0"
							border="0">
							<tbody>
								<tr valign="bottom" style="vertical-align: bottom; height:46px">
									<td></td>
									<td nowrap="" class="m-tcol-c date">
											<%=format.format(sm.getMadangRegisterDatetime())%>
									</td>
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
				<div class="etc-box" style="margin-bottom:10px;">
					<!-- 프로필 사진/이름(이메일) -->
					<div class="fl">
						<table role="presentation" cellspacing="0" cellpadding="0" class="border-none"
							border="0">
							<tbody>
								<tr>
									<td class="m-tcol-c b nick">
										<table role="presentation" cellspacing="0" class="border-none">
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
										
										<!-- 직급 -->
										
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
				<div class="markdown_area answer-content" id="tbody"
					style="padding-left: 43px; padding-right: 43px; margin-right: 0px; color: #333;">
					<%=sm.getMadangContent()%>
				</div>

				<div class="h40"></div>

				<!-- 하단 item box -->
				<div class="bottom-box">
					<!-- left item -->
					<div class="fl reply_sort">
						<table role="presentation" cellspacing="0" cellpadding="0"
							border="0" class="border-none">
							<tbody>
								<tr style="vertical-align: top">
									<!-- 댓글 수 -->
									<td class="reply"><a href="javascript:"
										class="reply_btn b m-tcol-c m-tcol-p _totalCnt cmt_toggle" 
										onclick="fn_openCommentArea(); return false;">
											댓글 <%=totalData%>
										<img class="new_icon"
											src="<%=request.getContextPath()%>/img/new_icon.png"
											width="20" height="20" padding_bottom="2" alt="new">
									</a></td>
									<!-- 조회 수 -->
									<td class="m-tcol-c filter-30">|</td>
									<td><span class="b m-tcol-c reply ">조회수 </span> <span
										class="b m-tcol-c reply"><%=sm.getMadangReadCount()%></span></td>
									<!-- 포크 -->
									<td class="m-tcol-c filter-30">|</td>
									<td><a href="#" class="b fork_btn">포크</a>
										<div class="btn_module">
											<a href="#" class="btn_cnt" aria-pressed="false"> <img
												class="fork_icon"
												src="<%=request.getContextPath()%>/img/fork_icon.png" alt="">
												<em class="fork_count"><%=sm.getMadangForkCount()%></em>
											</a>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 버튼 -->
					<div class="fr">
						<div class="post_btns font-family-type1">
							<a href="#" id="writeFormBtn"
								onclick="fn_madangWrite('<%=loginMember!=null?loginMember.getMemNo():null%>','<%=request.getContextPath()%>','study','<%=choice%>','<%=choiceSub%>'); return false;"
								class="btn_type1 post_write _rosRestrict" style="color:#000">수정하기</a>
						</div>
					</div>
					
				</div>

				<div class="h10"></div>

				<!-- 댓글 -->
				<div class="box-reply2 bg-color u_cbox" id="comment" 
					style="display: block; display:none">
					<h3 class="ir_su">댓글 작성</h3>
					<!-- 댓글 폼 -->
					<div class="tab_container">
						<!-- 댓글 작성 테이블 -->
						<table cellspacing="0" class="cminput border-none">
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
											onclick="fn_addComment('<%=loginMember!=null?loginMember.getMemNo():null%>', 'study', '<%=request.getContextPath() %>','<%=REMOTE_ADDR%>','<%=sm.getMadangNo()%>','<%=loginMember!=null?loginMember.getMemNo():""%>','<%=loginMember!=null?loginMember.getMemUserEmail():""%>','<%=loginMember!=null?loginMember.getMemName():""%>','<%=cPage%>','<%=choice%>', '<%=choiceSub%>'); return false;">
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

											for(StudyMadangCmt cmt : list) {
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
						                                        <table cellspacing="0" class="cminput _cminputRep border-none" id="re_conmmentRep<%=cmt.getCmtNo()%>"
						                                            style="display: none">
						                                            <tbody>
						                                                <tr>
						                                                    <td class="i2">
						                                                        <div class="comm_write_wrap border-sub skin-bgcolor">
						                                                            <textarea id="comment_text_rep_<%=cmt.getCmtNo()%>" cols="50" rows="2"
						                                                                class="textarea m-tcol-c" maxlength="6000"
						                                                                style="overflow: hidden; line-height: 14px; height: 39px;"
						                                                                title="댓글입력"></textarea>
						                                                        </div>
						                                                    </td>
						                                                    <td class="i3">
						
						                                                        <div class="u_cbox_btn_upload _submitBtnRep">
																					<a href="#" class="u_cbox_txt_upload _submitCmt" 
																					onclick="fn_addReply('<%=cmt.getCmtNo()%>', '<%=loginMember!=null?loginMember.getMemNo():null%>', 'study', '<%=request.getContextPath() %>', '<%=REMOTE_ADDR%>','<%=sm.getMadangNo()%>','<%=cmt.getCmtNo() %>','<%=loginMember!=null?loginMember.getMemNo():""%>','<%=loginMember!=null?loginMember.getMemUserEmail():""%>','<%=loginMember!=null?loginMember.getMemName():""%>','<%=cPage%>','<%=choice%>', '<%=choiceSub%>'); return false;">
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
                                                                <a href="#" onclick="deleteComment(<%=cmt.getCmtNo()%>); return false;"
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
				
				<div class="h40"></div>

				<div style="clear: both; height: 0pt; font: 0pt/0pt arial;"></div>
				<div style="display: none;" class="cc_paginate cmt"
					id="cmt_paginate">
					<!-- 댓글 페이징 처리 -->
					<% 
						//댓글 총 갯수가 30개를 초과한다면 (한 페이지당 30개)
						//댓글 페이징 처리를 한다.
						if(totalData>30) {
					%>
							<%@ include file="/views/common/pagination.jsp"%>
					<%
						}
					%>
					
				</div>
				
				
				<div class="show-answer-area" style="margin:20px; padding-top:20px; border-top: 1px solid #333">
				<%
					if(sm.getMadangAnswerCount()>0 && !show.equals("true")) {
						// 답변이 1개 이상일떄만 풀이보기를 출력한다.
						// show가 true가 아니면 풀이가 감춰진 상태
						%> 
							<a href="<%=request.getContextPath()%>/madang/studyMadangView?madangNo=<%=sm.getMadangNo()%>&cPage=<%=cPage%>&show=true&choiceSub=<%=choiceSub%>" 
								class="btn btn-block btn-outline btn-lg" id="showAnswerBtn" style="margin-bottom:20px;">
			                    <i class="glyphicon glyphicon-menu-down"></i>
			                    <span class="help font-family-type1">풀이 보기 (<%=sm.getMadangAnswerCount()%>개의 풀이가 있습니다)</span>
			                </a>
						<%
				
					} else if(sm.getMadangAnswerCount()>0 && show.equals("true")) {
						// 답변이 1개 이상일떄만 풀이보기를 출력한다.
						// show가 true면 풀이가 보여지는 상태.
				%> 
						<a name="answer-filter-area"></a> <!-- 타게팅용 -->
						
						<span class="b m-tit help" style="font-size: 20px;"><%=sm.getMadangAnswerCount()%>개의 풀이가 있습니다!</span>
						
						<!-- 풀이 뷰! -->
						<%
							if(!qList.isEmpty()) {
								for(StudyMadangQuestion smq : qList) {
									%>
										<div class="row" id="queView_<%=smq.getQuestionNo()%>"
											style="margin:10px 0 30px 0; padding: 30px 0; border-top:1px groove rgba(239, 108, 0, 0.4); "> 
											<div class="col-md-1 answer-info">
												<table role="presentation" class="border-none" cellspacing="0" cellpadding="0"
													border="0">
													<tbody >
														<tr valign="bottom" style="vertical-align: top; border:none;">
															<td style="border:none;">
																<div class="list-count-view">
																	<div class="votes">
																		<div class="votes-count text-center">
																			<a href="#" 
																			<%
																				if(loginMember!=null) {
																			%>
																				onclick="fn_likeUp('<%=request.getContextPath()%>','study','<%=smq.getQuestionNo()%>','<%=loginMember.getMemNo()%>','<%=REMOTE_ADDR %>'); return false;"
																			<%		
																				} else {
																			%>
																				onclick="fn_needLogin(); return false;"
																			<%
																				}
																			%>
																			>
																				<%=smq.getQuestionRecCount() %>
																			</a>
																		</div>
																		<div class="votes-text text-center">추천</div>
																	</div>
																</div>
															</td>
																
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-md-11">
												<div class="fl" style="padding 5px 5px;border-radius: 10px; background-color: rgba(239, 108, 0, 0.04)">
													<table role="presentation" cellspacing="0" cellpadding="0" class="border-none"
														border="0" >
														<tbody >
															<tr style="background-color: transparent !important;">
																<td class="m-tcol-c b nick">
																	<table role="presentation" cellspacing="0" class="border-none">
																		<tbody>
																			<tr style="background-color: transparent !important;">
																				<td class="profile_img"><a href="#"> <!-- 프로필이미지가 없을 경우 다음 이미지로 대채한다. -->
																						<img src="<%=request.getContextPath()%>/upload/myPage/<%=smq.getProfilePath()%>" width="24" height="24"
																						onerror="this.onerror='';this.src='<%=request.getContextPath()%>/img/nonProfile.png'">
																				</a></td>
																				<td class="p-nick">
																					<!-- 이름/이메일 클릭 시, 해당 유저의 게시글보기/1:1채팅/쪽지보내기 등을 드롭다운 박스로 표시 -->
																					<a href="#" class="m-tcol-c b"><%=smq.getQuestionWriterName()%>
																						<!-- 아이디 별표(*)처리 --> (<%=smq.getQuestionWriterEmail().substring(0, 4)%>****)</a>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
																<td class="m-tcol-c step">
																	<span class="filter-50">
																	</span> 
																		<!-- 직급 -->
																	<img class="levelico"
																	src="<%=request.getContextPath()%>/img/manager_icon.png"
																	width="11" height="11" border="0">
																</td>
																
																<td class="m-tcol-c chat">
																	<span> 
																		<a href="#"	onclick=""> 
																			<img src="<%=request.getContextPath()%>/img/chatting_icon.png"
																				width="20" height="20" alt="1:1대화" class="ico" title="1:1대화">
																		</a>
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<!-- 작성일 -->
												<div class="fr" style="margin:0 !important;">
													<table role="presentation" class="border-none" cellspacing="0" cellpadding="0"
														border="0">
														<tbody>
															<tr valign="bottom" style="vertical-align: bottom;">
																<td></td>
																<td nowrap="" class="m-tcol-c date" >
																		<%=format.format(smq.getQuestionRegisterDatetime())%>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div style="clear:both; height: 10px;"></div>
												<div class="markdown_area answer-content" id="tbody" style="color: #333;">
													<%=smq.getQuestionContent()%>
												</div>
												<!-- 하단 item box -->
												<div class="bottom-box">
													<!-- left item -->
													<!-- 만들 여력이 없어서 일단 드랍..
													<div class="fl reply_sort">
														<table role="presentation" cellspacing="0" cellpadding="0"
															border="0" class="border-none">
															<tbody>
																<tr style="vertical-align: top">
																	<td class="reply"><a href="javascript:"
																		class="reply_btn b m-tcol-c m-tcol-p _totalCnt cmt_toggle" 
																		onclick="fn_openCommentArea(); return false;">
																			댓글 <%=totalData%>
																		<img class="new_icon"
																			src="<%=request.getContextPath()%>/img/new_icon.png"
																			width="20" height="20" padding_bottom="2" alt="new">
																	</a></td>
																</tr>
															</tbody>
														</table>
													</div>
													 -->
												</div>
											</div>
										</div>
									<%
								}
							}
						%>				
						
				<%
					}
				%>
				
				
				
				<div class="answer-area">
					<!-- 풀이  답변 영역 -->
				</div>	
				
				<!-- 풀이영역 -->
				<div class="answer-write-area" >
			        <p class="lead font-family-type1" style="margin:10px 0;"><strong style="color:#000">풀이를 작성해 주세요!</strong></p>
			
			        <div class="well" style="padding:10px 20px; background-color: rgba(239, 108, 0, 0.03);">
			            <strong>※ 이렇게 해주세요!</strong>
			            <small>
			                <ul style="margin:5px 0;padding-left:20px;">
			                    
			                    <li>본문에 코드를 삽입할 경우 에디터 우측 상단의 "<strong>코드삽입</strong>" 버튼을 이용 해 주세요.</li>
			                    
			                    <li><a href="http://daringfireball.net/projects/markdown/basics" target="_new">마크다운</a> 문법으로 본문을 작성 해 주세요.</li>
			                    <li>풀이를 읽는 사람들을 위하여 풀이에 대한 설명도 부탁드려요. (아이디어나 사용한 알고리즘 또는 참고한 자료등)</li>
			                </ul>
			            </small>
			        </div>
			        <form role="form" method="post" onsubmit="return fn_qValidate();">
			        <!-- action="<%=request.getContextPath()%>/madang/insertQuestion" -->
			        		
			        		<script>
			        			function fn_qValidate() {
			        				if(<%=loginMember==null%>) {
			        					fn_needLogin();
			        					return false;
			        				} else {
			        					return true;
			        				}
			        			}
			        		</script>
			            <div class="form-group markdown_editor">
			                
			                    <div class="toolbar clearfix" style="margin-bottom: 5px;">
			                        <a href="http://daringfireball.net/projects/markdown/basics" target="_new" class="label label-default pull-right" style="margin-top:5px;margin-left:5px;">마크다운이란?</a>
			                        <a href="javascript:insert_code();" id="preview_name" class="label answers pull-right" style="margin-top:5px;margin-left:5px;">코드삽입</a>
			                    </div>
			                
			                <textarea class="form-control" rows="15" id="id_content" name="content"></textarea>
			            </div>
			            
			            
			            <div class="post_btns">
							<div class="fr">
								<button type="submit" class="btn-default" id="submitBtn" 
									style="background-color: transparent; border:none; cursor: pointer">
					                <span class="_rosRestrict btn_type1 font-family-type1"
					                 style="color:#000; margin:0 !important; ">풀이달기</span>
					            </button>
							</div>
						</div>
						
						<!-- hidden data -->
						<div class="hidden" style="display:none">
							<input type="hidden" name="madangNo" value="<%=sm.getMadangNo()%>">
							<input type="hidden" name="REMOTE_ADDR" value="<%=REMOTE_ADDR%>">
							<input type="hidden" name="cPage" value="<%=cPage%>">
							<input type="hidden" name="choiceSub" value="<%=choiceSub%>">
							<input type="hidden" name="mCategory" value="<%=sm.getMadangMainCategory()%>">
							<input type="hidden" name="category" value="<%=sm.getMadangCategory()%>">
							<input type="hidden" name="sCategory" value="<%=sm.getMadangSubCategory()%>">
							<%
								if(loginMember!=null) {
									%>
										<input type="hidden" name="memNo" value="<%=loginMember.getMemNo()%>">
										<input type="hidden" name="memEmail" value="<%=loginMember.getMemUserEmail()%>">
										<input type="hidden" name="memName" value="<%=loginMember.getMemName()%>">
								   <%
								}
							%>
						</div>
			        </form>
			    </div>
				<!-- 풀이영역 -->
				
			</div>
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
						<a href="#" class="m-tcol-c <%=preNext.get("prev").getMadangNo()!=0?"":"disabled"%>" 
							onclick="location.href='<%=request.getContextPath()%>/madang/studyMadangView?madangNo=<%=preNext.get("prev").getMadangNo()%>&cPage=<%=cPage%>&choiceSub=<%=choiceSub%>'"> 
						<img id="upper-arrow" src="<%=request.getContextPath()%>/img/arrow_icon.png" class="<%=preNext.get("prev").getMadangNo()!=0?"":"sepia"%>"
							width="30px" height="30px" alt="" />
						</a>
					</p>
				</div>
				<div class="btn">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c" onclick="location.href='<%=request.getContextPath()%>/madang/studyMadangList?cPage=<%=cPage%>&choiceSub=<%=choiceSub%>'"> 
						<img id="goList" src="<%=request.getContextPath()%>/img/list_icon.png"
							width="30px" height="30px" alt="" />
						</a>
					</p>
				</div>
				<div class="btn">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c" 
							<%
								if(loginMember!=null) {
									%>
										onclick="location.href='<%=request.getContextPath()%>/madang/madangWrite?locate=study&cPage=<%=cPage%>&choice=공부마당&choiceSub=<%=choiceSub%>'"
									<%
								} else {
							%>
									onclick="fn_needLogin(); return false;"
							<%
								}
							%>>
						<img id="goWite" src="<%=request.getContextPath()%>/img/write_icon.png"
							width="30px" height="30px" alt="" />
						</a>
					</p>
				</div>
				<div class="btn btn_lower">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c <%=preNext.get("next").getMadangNo()!=0?"":"disabled"%>" 
							onclick="location.href='<%=request.getContextPath()%>/madang/studyMadangView?madangNo=<%=preNext.get("next").getMadangNo()%>&cPage=<%=cPage%>&choiceSub=<%=choiceSub%>'"> 
							<img id="lower-arrow" src="<%=request.getContextPath()%>/img/arrow_icon.png" class="<%=preNext.get("next").getMadangNo()!=0?"":"sepia"%>"
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
<!-- 모달 -->
<div class="modal" id="insertCode" tabindex="-1" role="dialog" aria-labelledby="insertCodeLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">코드삽입</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <select class="form-control" id="codeLang">
                    <option value="">Choose Language</option>
                    <option value="actionscript">ActionScript</option>
                    <option value="bash">Bash</option>
                    <option value="cs">C#</option>
                    <option value="cpp">C++</option>
                    <option value="clojure">Clojure</option>
                    <option value="delphi">Delphi</option>
                    <option value="erlang">Erlang</option>
                    <option value="go">Go</option>
                    <option value="haskell">Haskell</option>
                    <option value="html">Html</option>
                    <option value="java">Java</option>
                    <option value="javascript">JavaScript</option>
                    <option value="lisp">Lisp</option>
                    <option value="lua">Lua</option>
                    <option value="matlab">Matlab</option>
                    <option value="objectivec">Objective C</option>
                    <option value="php">PHP</option>
                    <option value="perl">Perl</option>
                    <option value="python">Python</option>
                    <option value="r">R</option>
                    <option value="ruby">Ruby</option>
                    <option value="smalltalk">SmallTalk</option>
                    <option value="swift">Swift</option>
                    <option value="scala">Scala</option>
                    <option value="sql">SQL</option>
                    <option value="vbnet">VB.NET</option>
                    <option value="vbscript">VBScript</option>
                    <option value="typescript">TypeScript</option>
                    <option value="no-highlight">No Highlight</option>
                </select>
            </div>
            <div class="form-group">
                <textarea class="form-control" rows="10" id="codeContent" name="codeContent"></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" id="codeOkBtn">OK</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
</div>
<%@ include file="/views/common/footer.jsp"%>