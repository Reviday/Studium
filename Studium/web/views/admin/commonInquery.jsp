<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member" %>
<%
	List<Member> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = (String) request.getAttribute("grade");
	String status = (String) request.getAttribute("status");
	request.setAttribute("setGrade", grade);
	request.setAttribute("setStatus", status);
%> 

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
					<td><span class="momoClick" id="<%=m.getMemNo() %>"><%=m.getMemUserEmail() %></span></td>
					<td><%=m.getMemEnrollDatetime() %></td>

					<td>
						<select name="memberGradeList" class="memberGradeList">
							<option value="M" <%='M' == m.getMemCode() ? "selected" : "" %>>관리자</option>
							<option value="T" <%='T' == m.getMemCode() ? "selected" : "" %>>강사</option>
							<option value="R" <%='R' == m.getMemCode() ? "selected" : "" %>>정회원</option>
							<option value="A" <%='A' == m.getMemCode() ? "selected" : "" %>>준회원</option>
						</select>
					</td>
					<td>
						<select name="memberStatusList" class="memberStatusList">
							<option value="N" <%='N' == m.getMemDenied() ? "selected" : "" %>>정상</option>
							<option value="Y" <%='Y' == m.getMemDenied() ? "selected" : "" %>>일시정지</option>
							<option value="P" <%='P' == m.getMemDenied() ? "selected" : "" %>>영구정지</option>
						</select>
					</td>
					<td>
						<input type="submit" value="수정" class="memberUpdate" onclick="statusUpdate();">
						<form class="statusUpdate">
							<input type="hidden" value="<%=m.getMemNo() %>" name="memUpdateNo" class="memUpdateNo">
							<input type="hidden" value="inqueryList2" name="method">
						</form>
					</td>
					<td>
						<form class="deleteMember">
							<input type="hidden" value="<%=m.getMemNo() %>" name="memNo" class="memNo"> 
							<input type="hidden" value="inqueryList2" name="method">
						</form> 
						<input type="button" value="탈퇴" class="deleteSubmit" onclick="deleteMember();">
					</td>
				</tr>
				<%} %>
			</table>
		<div id="pointPage" class="pointPage">

			<!-- Modal content -->
			<div class="pointPage-content">
				<span class="closePointPage">&times;</span>
				<div class="pointPage-header">
					<div>회원메모</div>
					<button onclick="updateMemo();" class="memobtn">수정</button>
					<form id="memoform">
					<input type="hidden" name="memNo" value="" class="hiddenNo">
					<textarea class="memo" placeholder="회원에 대한 메모를 작성하세요." name="memo"></textarea>
					</form>
				</div>
				<div class="PointTable">
				</div>
			</div>

		</div>	
<link href="/Studium/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>

<script>
    	
		 function inqueryList2(cPage){
			 var params = '&cPage='+cPage+'&method='+"inqueryList2";
			 $.ajax({
     			url: "<%=request.getContextPath()%>/inqueryList2",
     			type: "POST",
     			dataType: "html",
     			data: params,
     			success: function(data){
     				$("#ajaxTable").html("");
     				$("#ajaxTable").html(data);
     			}
     		})
		 }
        
         function deleteMember(cPage){
  
        	var result = confirm("정말 탈퇴하시겠습니까?");
        	if(result){
        		var params = jQuery(".deleteMember").serialize();
        		params+='&cPage='+cPage;

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
        	
        	function statusUpdate() {
        		var status=$(event.target).parent().parent().find('.memberStatusList').val();
        		var grade=$(event.target).parent().parent().find('.memberGradeList').val();
        		var targetFrm=$(event.target).next();
        		var result = confirm("정말 수정하시겠습니까?");
        		if(result){
        		var params=targetFrm.serialize();
        		params+='&memberStatusList='+status+'&memberGradeList='+grade;
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
         

                $('.momoClick').click(function(e) {
                	var memNo = $(this).attr('id');
                	console.log(memNo);
                	$(".hiddenNo").val(memNo);
                	$.ajax({
                		url: "<%=request.getContextPath()%>/adminMemo",
                		type: "POST",
                		dataType: "json",
                		data: {"memNo" : memNo},
                		success: function(data){
                			$(".memo").text(data);
                			$(".memo").val(data);
		                	$("#pointPage").css("display","block");
                		}
                	})
                });

       
            
            function updateMemo(){
        		var params = jQuery("#memoform").serialize();
        		$.ajax({
        			url: "<%=request.getContextPath()%>/adminMemoUpdate",
        			type: "POST",
        			dataType: "json",
        			data: params,
        			success: function(data){
        				console.log(data);
        				$(".memo").text(data);				
        			}
        		});
        	}
            
        $(function(){
        	var modal = document.getElementById('pointPage');                                         
            $(".closePointPage").click(function() {
                $("#pointPage").css("display","none");
            }); 

            window.onclick = function(event) {
                if (event.target == modal) {
                	$("#pointPage").css("display","none");
                }
            }
        })
    </script>

