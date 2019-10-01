<%@page import="com.studium.story.model.vo.Story"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Story> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
		<table class="memberTable">
				<tr>
					<th>번호</th>
					<th>회원</th>
					<th>강사</th>
					<th>카테고리</th>
					<th>스터디번호</th>
					<th>시간</th>
					<th>삭제</th>
				</tr>
				<%
					for (Story s : list) {
				%>
				<tr>
					<td><%=s.getStoryNo()%></td>
					<td><%=s.getStoryWrite()%>(<%=s.getMemNo()%>)</td>
					<td><%=s.getStoryTeachername()%></td>
					<td><%=s.getStorySubject()%></td>
					<td class="storyclick" id="<%=s.getStoryNo()%>"><%=s.getpNo()%></td>
					<td><%=s.getStoryTime()%></td>
					<td>
						<input type="button" value="삭제" class="pointConfirm"
						onclick="deleteStory();" id="<%=s.getStoryNo()%>">
					</td>
				</tr>

				<%
					}
				%>
			</table>
		<link href="/Studium/css/pagination.css" rel="stylesheet">
		<%@ include file="/views/common/pagination.jsp"%>
		
<script>
$(function () {
    
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

function storyList(cPage){
	$.ajax({
		url:"<%=request.getContextPath()%>/showStoryList1",
		type:"post",
		data:{
			  "cPage" : cPage,
			  "method" : "storyList",
			},
		dataType:"html",
		success:function(data){
			$("#ajaxTable").html("");
			$("#ajaxTable").html(data);
		}
	});
}

function deleteStory(cPage){

	$.ajax({
		url:"<%=request.getContextPath()%>/admindeleteStory",
		type:"post",
		data:{"no":$(event.target).attr('id'),
			  "cPage" : cPage,
			  "method" : "storyList",
			},
		dataType:"html",
		success:function(data){
			$("#ajaxTable").html("");
			$("#ajaxTable").html(data);
		}
	});
}

$(".storyclick").click(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/adminMemoStory",
		type:"post",
		data:{no:$(this).attr('id')},
		dataType:"json",
		success:function(data){
			$(".PointTable").text(data);
        	$("#pointPage").css("display","block");
		}
	});
})

	

	function nameSearch(cPage) {
			
    		if(!$(".nameSearch").val().trim()){
    			alert("검색할 강사 이름을 입력하세요.");
    		}else{
    		var params = jQuery("#search").serialize();
    		params+='&cPage='+cPage;
    		$.ajax({
    			url: "<%=request.getContextPath()%>/AdminStorySearch",
			type : "POST",
			dataType : "html",
			data : params,
			success : function(data) {
				$("#ajaxTable").html("");
				$("#ajaxTable").html(data);
			}
		})
	}
}
	
</script>