<%@page import="com.studium.madang.model.vo.ShareMadang"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ShareMadang> smlist=(List)request.getAttribute("shareMadangList");
	SimpleDateFormat format = new SimpleDateFormat("yyyy.dd.MM.");
%>
<%@ include file="/views/common/header.jsp" %>
	<!-- 마당에 적용할  css -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/madang.css">
	<style>
		.madang-section {
			position: relative;
			height: 1800px;
			margin: 0;
            padding: 0;
            list-style: none;
            text-decoration: none;
		}
		.madang-section.wrapper {
			position: relative;
		}
		.madang-list {
			position: absolute;
			top: 0;
			left: 300px;
			margin: 0 !important;
		}	
	</style>
	
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>
	<section class="madang-section">
		<div class="container">
			<div class="wrapper">
				<div class="middle">
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
			    </div>
			<div class="madang-list">  
			<div class="sub-tit">
				<div class="title-area"> 
					<h3 class="list-title">공유마당</h3>
					<p class="list-sub">자유롭게 정보와 자료를 공유하는 공간입니다.<br/>
										저작권에 주의해주시기 바랍니다.
					</p>
				</div>
				<div class="sort_area">
					<input type="checkbox" id="notice_checkbox">
        			<label for="notice_checkbox">공지 숨기기</label>
				</div>
			</div>
			<div class="article-board" id="upperArticleList">
	        <table>
	            <caption><span class="blind">게시물 목록</span></caption>
	            <colgroup>
	                <col style="width:88px">
	                <col>
	                <col style="width:118px">
	                <col style="width:80px">
	                <col style="width:68px">
	                <col style="width:68px">
	                <col style="width:68px">
	            </colgroup>
	            <thead>
	                <tr id="normalTableTitle">
	                    <th scope="col" colspan='2'><span class="article_title">제목</span></th>
	                    <th scope="col" class="th_name">작성자</th>
	                    <th scope="col">작성일</th>
	                    <th scope="col">조회</th>
	                    <th scope="col">포크</th>
	                    <th scope="col" class="th_like">좋아요</th>
	                </tr>
	                <tr id="simpleTableTitle" style="display:none;">
	                    <th colspan="6" style="height:0px;padding: 0px;"></th>
	                </tr>
	            </thead>
	            <tbody>
	            <%
	            	if(!smlist.isEmpty()) {
	            		for(ShareMadang sm : smlist) {
	            %>
		            	<tr class="_noticeArticle board-notice type_main">
		                    <td class="td_article">
		
		                        <div class="board-tag">
		                            <!-- <strong class="board-tag-txt">
		                                <span class="inner">공지</span>
		                            </strong>  공지는 이거로-->
		                            <span class="inner" style="text-align:center"><%=sm.getMadangNo() %></span>
		                        </div>
		                    </td>
		                    <td class="td_article">
		                        <div class="board-list">
		                            <div class="inner_list">
		                                <a href="#" onclick="" class="article">
		                                    <%=sm.getMadangTitle() %>
		                                </a>
		                            </div>
		                        </div>
		                    </td>
		                    <td class="td_name">
		                        <div class="pers_nick_area">
		                            <table role="presentation" cellspacing="0">
		                                <tbody>
		                                    <tr>
		                                        <td class="p-nick" style="padding:0"><a href="#" class="" onclick="">
		                                        	<%=sm.getMadangWriterName() %></a>
		                                        <span class="mem-level"><img src="https://cafe.pstatic.net/levelicon/1/1_888.gif" width="11" height="11"></span></td>
		                                    </tr>
		                                </tbody>
		                            </table>
		                        </div>
		                    </td>
		                    <td class="td_date"><%=format.format(sm.getMadangRegisterDatetime())%></td>
		                    <td class="td_view"><%=sm.getMadangReadCount() %></td>
		                    <td class="td_fork"><%=sm.getMadangForkCount() %></td>
		                    <td class="td_like"><%=sm.getMadangRecCount() %></td>
		                </tr>
	            <%
	            	}}
	            %>
	            </tbody>
	        </table>
    		</div>
    		</div>
    		</div>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>