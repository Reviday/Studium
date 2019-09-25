<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member"%>
<%
	List<Member> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = (String)request.getAttribute("grade");
	String status = (String)request.getAttribute("status");
	request.setAttribute("setGrade", grade);
	request.setAttribute("setStatus", status);
%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">


<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/inquery.css">
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>

<section class="inquerySection row">

	<div class="col-xs-4 col-sm-3 col-md-3 col-lg-2"
		style="padding-left: 0">
		<%@ include file="/views/admin/adminSideMenuBar.jsp"%>
	</div>
	<div class="col-lg-1"></div>
	<div class="inquery col-xs-6 col-sm-6 col-md-7 col-lg-9">
		<div class="inquery-header">
			<!--헤더div-->
			<div>
				<!--왼쪽 상단에 위치함-->
				회원정보
			</div>
			<div>
				<!--오른쪽 상단에 위치하는 검색기능-->
				<form action="<%=request.getContextPath()%>/adminInquerySearch"
					class="searchMember">
					<select name="gradeList" class="gradeList">
						<option value="allGrade"
							<%="allGrade".equals(grade) ? "selected" : "" %>>전체</option>
						<option value="M" <%="M".equals(grade) ? "selected" : "" %>>관리자</option>
						<option value="T" <%="T".equals(grade) ? "selected" : "" %>>강사</option>
						<option value="R" <%="R".equals(grade) ? "selected" : "" %>>정회원</option>
						<option value="A" <%="A".equals(grade) ? "selected" : "" %>>준회원</option>
					</select> <select name="statusList" class="statusList">
						<option value="allStatus"
							<%="allStatus".equals(status) ? "selected" : "" %>>전체</option>
						<option value="N" <%="N".equals(status) ? "selected" : "" %>>정상</option>
						<option value="Y" <%="Y".equals(status) ? "selected" : "" %>>일시정지</option>
						<option value="P"
							<%="P".equals(status
                            		) ? "selected" : "" %>>영구정지</option>
					</select>
					<input type="hidden" value="searchMember" name="method">
					
				</form>
				<input type="submit" value="조회" class="submitSearch"
					onclick="searchMember('<%=cPage%>');">


				<form action="<%=request.getContextPath() %>/admin/memberFinder" class="nameFinder">
					<input type="text" placeholder="검색" name="memberName" id="findName"> 
					<input type="hidden" value="nameFinder" name="method">
				</form>
					<input type="submit" value="" class="submitPicture" onclick="nameFinder();">
			</div>
		</div>
		<div id="ajaxTable">
			<table class="inqueryTable">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>가입일시</th>
					<th>등급</th>
					<th>상태</th>
					<th>회원수정</th>
					<th>회원탈퇴</th>
				</tr>
				<%for(Member m : list){ %>
				<tr>
					<td><%=m.getMemNo() %></td>
					<td><%=m.getMemName() %></td>
					<td><span class="momoClick"><%=m.getMemUserEmail() %></span>
						<div class="adminMemo">
							<form class="memoUpdate">
								<textarea name="memo" class="memotextarea" cols="30" rows="10" placeholder="회원에 대한 메모를 작성하세요."
									value=<%=m.getMemAdminmemo() != null ? m.getMemAdminmemo() : "" %>><%=m.getMemAdminmemo()%></textarea>
								<input type="hidden" name="memNo" value="<%=m.getMemNo() %>">
							</form>
							<button type="submit" onclick="memoUpdate();">수정</button>
						</div></td>
					<td><%=m.getMemEnrollDatetime() %></td>
					<form action="<%=request.getContextPath()%>/adminUpdateMember" class="statusUpdate">
						<input type="hidden" value="<%=m.getMemNo() %>" name="memUpdateNo"
							class="memUpdateNo">
						<td><select name="memberGradeList" class="memberGradeList">
								<option value="M" <%='M' == m.getMemCode() ? "selected" : "" %>>관리자</option>
								<option value="T" <%='T' == m.getMemCode() ? "selected" : "" %>>강사</option>
								<option value="R" <%='R' == m.getMemCode() ? "selected" : "" %>>정회원</option>
								<option value="A" <%='A' == m.getMemCode() ? "selected" : "" %>>준회원</option>
						</select></td>
						<td><select name="memberStatusList" class="memberStatusList">
								<option value="N"
									<%='N' == m.getMemDenied() ? "selected" : "" %>>정상</option>
								<option value="Y"
									<%='Y' == m.getMemDenied() ? "selected" : "" %>>일시정지</option>
								<option value="P"
									<%='P' == m.getMemDenied() ? "selected" : "" %>>영구정지</option>
						</select></td>
						<input type="hidden" value="statusUpdate" name="method">
					</form>
						<td><input type="submit" value="수정" class="memberUpdate" onclick="statusUpdate();">
						</td>
					<td>
						<form action="<%=request.getContextPath()%>/adminDeleteMember" class="deleteMember"> 
						 <input type="hidden" value="<%=m.getMemNo() %>" name="memNo"
						class="memNo"> 
						<input type="hidden" value="deleteMember" name="method">
						</form>
						<input type="button" value="탈퇴" class="deleteSubmit" onclick="deleteMember();"> 
					</td>
				</tr>
				<%} %>
			</table>
			<%@ include file="/views/common/pagination.jsp"%>
		</div>
	</div>

</section>

<script>
    	

        
         function deleteMember(cPage){
        	console.log($(".gradeList").val());
        	var result = confirm("정말 탈퇴하시겠습니까?");
        	if(result){
        		console.log(cPage);
        		var params = jQuery(".deleteMember").serialize();
        		params+='&cPage='+cPage+'&gradeList'+$(".gradeList").val()+'&statusList'+$(".statusList").val();

        		$.ajax({
        			url: "<%=request.getContextPath()%>/adminDeleteMember",
        			type: "POST",
        			dataType: "html",
        			data: params,
        			success: function(data){
        				$("#ajaxTable").html("");
        				$("#ajaxTable").html(data);
        			}
        		})
        		return true;
        		}else{
        			return false;
        	        	}
        	
        	}
        	
        	function searchMember(cPage) {
        		
        		var params = jQuery(".searchMember").serialize();
        		params+='&cPage='+cPage;
        		console.log(cPage);
        		$.ajax({
        			url: "<%=request.getContextPath()%>/adminInquerySearch",
        			type: "POST",
        			dataType: "html",
        			data: params,
        			success: function(data){
        				$("#ajaxTable").html("");
        				$("#ajaxTable").html(data);
        				
        			}
        		});
        		
        	}
        	
        	function nameFinder(cPage) {
        		if(!$("#findName").val().trim()){
        			alert("검색할 이름, 이메일을 입력하세요.");
        		}else{
        		var params = jQuery(".nameFinder").serialize();
        		params+='&cPage='+cPage;
        		$.ajax({
        			url: "<%=request.getContextPath() %>/admin/memberFinder",
        			type: "POST",
        			dataType: "html",
        			data: params,
        			success: function(data){
        				$("#ajaxTable").html("");
        				$("#ajaxTable").html(data);
        			}
        		})
        		}
        	}
        	
        	function statusUpdate(cPage) {
        		var result = confirm("정말 수정하시겠습니까?");
        		if(result){
        		var params = jQuery(".statusUpdate").serialize();
        		params+='&cPage='+cPage;
        		$.ajax({
        			url: "<%=request.getContextPath()%>/adminUpdateMember",
        			type: "POST",
        			dataType: "html",
        			data: params,
        			success: function(data){
        				$("#ajaxTable").html("");
        				$("#ajaxTable").html(data);
        			}
        		})
        			return true;
        		}else{
        			return false;
        		} 
        	}
         
        	$(function() {
                $('.momoClick').click(function(e) {
                   $(this).next().toggleClass("show");
                });

            })
            
            function memoUpdate() {
        		var memo  = jQuery(".memoUpdate").serialize();

        		$.ajax({
        			url: "<%=request.getContextPath()%>/adminMemoUpdate",
        			type: "POST",
        			dataType: "json",
        			data: memo,
        			success: function(data){
        				$(".memotextarea").text(data);
        			}
        		})
        	}
        
    </script>


<%@ include file="/views/common/footer.jsp"%>
</body>

</html>
>
