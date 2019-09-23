<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/story.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap">
<style>
    section#container{width:600px; margin:0 auto; text-align:center;}
    section#container h2{margin:10px 0;}
    table#tbl-container{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-container th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-container td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style>
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
	</div>
	<section id="container">
	<h2>후기등록하기</h2>
	<table id="tbl-container">
	<tr>
				<th>사진등록</th>
				<td>
						<input type="file" name="storyStudentpicture" id="storyStudentpicture"/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="storyWriter" id="storyWriter" required/>
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>
					<textarea rows="5" cols="50" name="storyContent" id="storyContent"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>선생님 사진</th>
				<td>
				 	<input type="file" name="storyTeacherpicture" id="storyTeacherpicture"/>
				</td>
			</tr>
			<tr>
				<th>선생님 이름</th>
				<td>
					<input type="text" name="storyTeachername" id="storyTeachername" required/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록하기" onclick="fn_listBoard();"/>
			<%--글작성자/관리자인경우 수정삭제 가능 --%>
			
				</th>
			</tr>
			

		</table>
	
	
	</section>
<%@ include file="/views/common/footer.jsp" %>