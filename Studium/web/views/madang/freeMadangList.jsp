<%@page import="com.studium.madang.model.vo.FreeMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<FreeMadang> fmlist = (List)request.getAttribute("freeMadangList");
	int cPage = (int)request.getAttribute("cPage");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.dd.MM.");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 마당에 적용할  css -->
<link href="<%=request.getContextPath()%>/css/madang.css" rel="stylesheet">
    <style>
        @import url('https://rsms.me/inter/inter-ui.css');

        .pageBar-container {
            align-items: center;
            color: #555;
            font-family: 'Inter UI', sans-serif;
            font-size: 1.25em;
            justify-content: center;
            /* height: 100vh; */
            margin: 0 auto;
            display: flex;
        }

        .pageBar {
            display: inline-block;
            position: relative;
        }

        .index {
            cursor: pointer;
            display: inline;
            margin-right: 30px;
            padding: 5px;
            user-select: none;
            -moz-user-select: none;
        }

        .index:last-child {
            margin: 0;
        }

        svg {
            left: -13px;
            position: absolute;
            top: -11px;
            transition: transform 500ms;
            width: 46px;
        }

        path {
            fill: none;
            stroke: #2FB468;
            stroke-dasharray: 150 150;
            stroke-width: 15;
        }

        .pageBar.open:not(.flip) path {
            animation: OpenRight 500ms;
        }

        .pageBar.open.flip path {
            animation: OpenLeft 500ms;
        }

        .pageBar.i1 svg {
            transform: translateX(0);
        }

        .pageBar.i2 svg {
            transform: translateX(50px);
        }

        .pageBar.i3 svg {
            transform: translateX(105px);
        }

        .pageBar.i4 svg {
            transform: translateX(160px);
        }

        .pageBar.i5 svg {
            transform: translateX(215px);
        }

		.pageBar.i6 svg {
            transform: translateX(265px);
        }
        .pageBar.i7 svg {
            transform: translateX(315px);
        }
        .pageBar.i8 svg {
            transform: translateX(365px);
        }
        .pageBar.i9 svg {
            transform: translateX(425px);
        }
        .pageBar.i10 svg {
            transform: translateX(440px);
        }
        @keyframes OpenRight {
            25% {
                stroke-dasharray: 100 150;
            }

            60% {
                stroke-dasharray: 100 150;
            }

            100% {
                stroke-dasharray: 150 150;
            }
        }

        @keyframes OpenLeft {
            25% {
                stroke-dashoffset: -50px;
            }

            60% {
                stroke-dashoffset: -50px;
            }

            100% {
                stroke-dashoffset: 0;
            }
        }
    </style>
<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
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
		<div class="pageBar-container">
	<div class="pageBar">
        <span>
            <div class="index">1</div>
            <div class="index">2</div>
            <div class="index">3</div>
            <div class="index">4</div>
            <div class="index">5</div>
            <div class="index">6</div>
            <div class="index">7</div>
            <div class="index">8</div>
            <div class="index">9</div>
            <div class="index">10</div>
        </span>
        <svg viewBox="0 0 100 100">
            <path
                d="m 7.1428558,49.999998 c -1e-7,-23.669348 19.1877962,-42.8571447 42.8571442,-42.8571446 23.669347,0 42.857144,19.1877966 42.857144,42.8571446" />
        </svg>
        <svg viewBox="0 0 100 100">
            <path
                d="m 7.1428558,49.999998 c -1e-7,23.669347 19.1877962,42.857144 42.8571442,42.857144 23.669347,0 42.857144,-19.187797 42.857144,-42.857144" />
        </svg>
    </div>
			</div>
    
      </div>
				</div>
					
	</div>

</div>
    <script>
        const c = document.querySelector('.pageBar')
        const indexs = Array.from(document.querySelectorAll('.index'))
        let cur = -1
        indexs.forEach((index, i) => {
            index.addEventListener('click', (e) => {
                // clear
                c.className = 'pageBar'
                void c.offsetWidth; // Reflow
                c.classList.add('open')
                c.classList.add( 'i'+(i + 1))
                if (cur > i) {
                    c.classList.add('flip')
                }
                cur = i
            })
        })
    </script>
</section>


<%@ include file="/views/common/footer.jsp"%>