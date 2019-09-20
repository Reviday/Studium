<%@page import="com.studium.madang.model.vo.FreeMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	FreeMadang fm = (FreeMadang) request.getAttribute("fm");
	int cPage = (int) request.getAttribute("cPage");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd.");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/madangview.css"
	rel="stylesheet">
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
	<div class="col-lg-1">
	</div>
	<!-- 게시글 View Main -->
	<div id="main-area" class="col-xs-6 col-sm-6 col-md-7 col-lg-7">
		<div class="madang-list mldiv">
			<div class="sub-tit row mldiv">
				<div class="title-area mldiv">
					<h3 class="list-title">자유마당</h3>
					<p class="list-sub">자유롭게 글을 올리는 공간입니다.</p>
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
									<td><span class="b m-tcol-c">글 제목</span></td>
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
									<td class="m-tcol-c date">2019.09.19. 06:36</td>
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
															<img src="img/없는파일일경우?" width="24" height="24"
															onerror="this.onerror='';this.src='<%=request.getContextPath()%>/img/nonProfile.png'">
													</a></td>
													<td class="p-nick">
														<!-- 이름/이메일 클릭 시, 해당 유저의 게시글보기/1:1채팅/쪽지보내기 등을 드롭다운 박스로 표시 -->
														<a href="#" class="m-tcol-c b">이름(이메일/일부 *** 표시)</a>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="m-tcol-c step"><span> <img
											class="levelico"
											src="<%=request.getContextPath()%>/img/manager_icon.png"
											width="15" height="15" border="0">
									</span></td>

									<td class="m-tcol-c chat"><span> <a href="#"
											onclick=""> <img
												src="<%=request.getContextPath()%>/img/chatting_icon.png"
												width="20" height="20" alt="1:1대화" class="ico">
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
					<p>다들 화이팅</p>
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
				<div class="box-reply2 bg-color u_cbox" id="adSDC"
					style="display: block;">
					<!-- 댓글 리스트  -->
					<ul class="cmlist" id="cmt_list">
						<li class="">
							<div class="comm_cont">
								<div class="h">
									<div class="pers_nick_area">
										<table role="presentation" cellspacing="0">
											<tbody>
												<tr>
													<td class="pc2w">
														<div class="box_profile">
															<a
																href="/CafeMemberNetworkView.nhn?m=view&amp;clubid=12566436&amp;memberid=wlgml3145"
																class="link_profile"><img
																src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png"
																width="32" height="32" alt="프로필"
																onerror="this.onerror=''; this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png'"></a>
														</div>
													</td>
													<td class="p-nick"><a href="#"
														class="m-tcol-c _rosRestrict _nickUI">시각디자인</a>
														</td>
														
												</tr>
											</tbody>
										</table>
									</div>
									<i class="fa fa-clock-o"></i><span
														class="date m-tcol-c filter-50">2019.09.19. 17:13</span> 
									<p class="btn_edit m-tcol-c">
										</span>
										<!-- 자신의 댓글일 경우 -->
										<p class="btn_edit m-tcol-c">
											<a href="#" class="filter-70 m-tcol-c _btnEdit">수정</a>
											<span class="filter-30 m-tcol-c">|</span>
											<a href="#" class="filter-70 m-tcol-c _btnDelete">삭제</a>
										</p>
									</p>
								</div>
								<div class="comm m-tcol-c">
									<div class="comm_body">
										<span class="comm_body">안녕하세요~</span>
									</div>
								</div>
								<div class="comm-bottom ">
										<div class="fl">
										<span
										class="dsc_comm"><a href="#"
										class="m-tcol-c  _btnReply" style="padding:2px">답글 
										<span style="font-weight:bold">15</span>
										</a>
										<span class="m-tcol-c filter-30" style="padding:2px">|</span>
										<a href="#" class="filter-70 m-tcol-c _btnNoti" style="padding:2px">신고</a>
										</div>
										
										<div class="fr">
											하이
										</div>
								</div>
								<div>
									<input type="hidden" name="cmtid" value="32239728"> <input
										type="hidden" name="writerid" value="wlgml3145"> <input
										type="hidden" name="refcmtid" value="32239728"> <input
										type="hidden" name="replytonick" value=""> <input
										type="hidden" name="replytomemberid" value=""> <input
										type="hidden" name="stickerId" value=""> <input
										type="hidden" name="stickerOriginUrl" value=""> <input
										type="hidden" name="imagePath" value=""> <input
										type="hidden" name="imageFileName" value=""> <input
										type="hidden" name="imageWidth" value=""> <input
										type="hidden" name="imageHeight" value=""> <input
										type="hidden" name="articleId" value="258118">
								</div>
							</div>
						</li>
						<li class="filter-30 board-box-line-dashed"></li>
						<li class="">
							<div class="comm_cont">
								<div class="h">
									<div class="pers_nick_area">
										<table role="presentation" cellspacing="0">
											<tbody>
												<tr>
													<td class="pc2w">
														<div class="box_profile">
															<a
																href="/CafeMemberNetworkView.nhn?m=view&amp;clubid=12566436&amp;memberid=ysm_0405"
																class="link_profile"><img
																src="https://blogpfthumb-phinf.pstatic.net/MjAxOTA2MDZfMTA2/MDAxNTU5NzU2MTgxMDIz.YenKHOQC7-z32--eb1XukffptIRELx_3uIr0S-8gxiYg.lw_vHBW23dUPEtkfnbg-8zLu4-5uM2vR2qH7EkqUzhAg.PNG.ysm_0405/profileImage.png"
																alt="프로필"
																onerror="this.onerror=''; this.src='img/nonProfile.png'"></a>
														</div>
													</td>
													<td class="p-nick"><a href="#"
														class="m-tcol-c _rosRestrict _nickUI">꽃윤e</a></td>
												</tr>
											</tbody>
										</table>
									</div>
									<i class="fa fa-clock-o"></i><span
										class="date m-tcol-c filter-50">2019.09.19. 17:14</span> <span
										class="dsc_comm"><a href="#"
										class="m-tcol-c  _btnReply">답글</a></span>
									<p class="btn_edit m-tcol-c">
										<a href="#" class="filter-70 m-tcol-c _btnNoti">신고</a>
									</p>
								</div>
								<p class="comm m-tcol-c">
									<span class="comm_body">안녕하세요!</span>
								</p>

								<!-- hidden 데이터 -->
								<div>
									<input type="hidden" name="cmtid" value="32239735"> <input
										type="hidden" name="writerid" value="ysm_0405"> <input
										type="hidden" name="refcmtid" value="32239735"> <input
										type="hidden" name="replytonick" value=""> <input
										type="hidden" name="replytomemberid" value=""> <input
										type="hidden" name="stickerId" value=""> <input
										type="hidden" name="stickerOriginUrl" value=""> <input
										type="hidden" name="imagePath" value=""> <input
										type="hidden" name="imageFileName" value=""> <input
										type="hidden" name="imageWidth" value=""> <input
										type="hidden" name="imageHeight" value=""> <input
										type="hidden" name="articleId" value="258118">
								</div>

							</div>
						</li>
						<li class="filter-30 board-box-line-dashed"></li>
					</ul>
					<div style="clear: both; height: 0pt; font: 0pt/0pt arial;"></div>
					<div style="display: none;" class="cc_paginate cmt"
						id="cmt_paginate">
						<!-- 댓글 페이징 처리 -->
					</div>

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

										<!-- 이미지 삽입 시 표시 -->
										<div class="u_cbox_upload_image" style="display: none">
											<span class="u_cbox_upload_image_wrap "> <a href="#"
												class="u_cbox_upload_thumb_link"><img
													src="https://cafethumb.pstatic.net/MjAxOTA5MjBfMTIg/MDAxNTY4OTU1Njg4NDU1.IcoYKAWcXxJqBq1IMq2SAm2_upI2caLSbau1tLrmLKsg.LBo7aZPDD5Y-p1V8jnDnzy8iRF-T9wKQiwZ2IJwk7sYg.JPEG/externalFile.jpg?type=ff80_80"
													alt="첨부이미지" class="u_cbox_upload_thumb" width="80"
													height="80"> <span class="u_cbox_upload_thumb_mask"></span>
													<span class="u_cbox_ico_delete_thumb _cancelAttach">사진
														업로드 취소</span> </a>
											</span>
										</div>
										
									</div>
								</td>
								<td class="i3">

									<div class="u_cbox_btn_upload _submitBtn">
										<a href="#" class="u_cbox_txt_upload _submitCmt">등록</a>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="3">

									<ul class="u_cbox_addition">
										<li>
											<div class="u_cbox_btn_upload_photo">
												<div class="_imageBtn u_cbox_btn_file">
													<label for="attachImageBtn258153"
														onclick="clickcr(this,'cmt.image', '', '', event);">업로드</label><input
														type="file" id="attachImageBtn258153" accept="Image/*">
												</div>
												<span class="u_cbox_ico_upload_photo"></span> <span
													class="m-tcol-c u_cbox_txt_upload_photo">사진</span>
											</div>
										</li>
									</ul> 
								</td>
							</tr>
						</tbody>
					</table>


					<!--
                        <div class="m-tcol-c reply_error" style="display:none;">
                            <strong>죄송합니다. 댓글 시스템 오류로 댓글을 읽거나 쓸 수 없습니다.</strong>
                            문제가 지속될 경우 <a href="http://help.naver.com/" target="_blank" class="m-tcol-c">고객센터</a>에 알려주시면
                            친절하게 안내해 드리겠습니다.
                        </div>-->
				</div>
			</div>
		</div>


	</div>
	<!-- 리모콘 -->
	
	<div id="remocon" class="col-lg-1" style="diplay:block"> 
		<div class="remote-area">
			<div class="remote-area-radi-top"></div>
			<div class="remote-area-body">
				<div class="btn btn_upper">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c" onclick="goPrev();">
							<img id="upper-arrow" src="<%=request.getContextPath()%>/img/arrow_icon.png" width="45px" height="45px" alt=""/>
						</a>
					</p>
				</div>
				<div class="btn btn_lower">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c" onclick="goList();"> 
							<img id="" src="<%=request.getContextPath()%>/img/arrow_icon.png" width="45px" height="45px" alt=""/>
						</a>
					</p>
				</div>
				<div class="btn">
					<span></span>
					<p>
						<a href="#" class="m-tcol-c" onclick="goNext();">
							<img id="lower-arrow" src="<%=request.getContextPath()%>/img/arrow_icon.png" width="45px" height="45px" alt=""/>
						</a>
					</p>
				</div>
			</div>
			<div class="remote-area-radi-bottom"></div>
		</div>
	</div> 
	
	<div class="col-lg-1"></div>
</section>
<style>
	#remocon {
		position:relative;
		font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum,
		sans-serif !important;
		margin: 5px ;
	}
	
	#remocon .remote-area {
		position: fixed;
		z-index:100;
		display: grid;
	}
	
	#remocon .remote-area-radi-top {
		background-color: #fff;
		border: 1px solid rgba(239, 108, 0, 0.4);
		border-radius:100%;
		position:absolute;
		width: 60px;
		height: 48px;
	}
	
	#remocon .remote-area-radi-bottom {
		background-color: #fff;	
		border: 1px solid rgba(239, 108, 0, 0.4);
		border-radius:100%;
		position:absolute;
		top: 176px;
		width: 60px;
		height: 48px;
		
	}
	
	#remocon .remote-area-body {
		background-color: #fff;
		position:absolute;
		top:24px;
		border: 1px solid rgba(239, 108, 0, 0.4);
		width: 60px;
		z-index:1000;
		border-top: none;
		border-bottom: none;
	}
	
	#remocon .m-tcol-c {
	word-wrap: break-word;
	text-decoration: none;
    color: #666 !important;
    display: block;
    position: relative;
    float: none;
    width: 45px;
    height: 45px;
    margin: auto;
    font-size: 13px;
    line-height: 16px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
	}
	#remocon .btn span {
    display: none;
    width: 7px;
    height: 20px;
    margin: 0;
    background-position: 0 0;
    background-repeat: no-repeat;
}
	#remocon .btn p {
    display: block;
    float: none;
    height: auto;
    padding: 0;
    background-image: none !important;
    background-position: top right;
    background-repeat: no-repeat;
    }
    #remocon .btn {
    width: 48px;
	/*#ddd*/
	background-color: #fff;
	display: inline-block;
	margin: 5px;
	height: 48px;
	text-align: center;
	vertical-align: top;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	overflow: hidden;
}

#remocon #upper-arrow {
	 transform: rotate(-90deg);
}

#remocon #lower-arrow {
	transform: rotate(90deg);
}	

#remocon .btn p img {
	margin: 1px;
}

</style>
<%@ include file="/views/common/footer.jsp"%>