<%@page import="com.studium.story.model.vo.Story"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
	List<Story> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/AdminStory.css">
<div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>
<section class="row">

	<div class="col-xs-4 col-sm-3 col-md-3 col-lg-2"
		style="padding-left: 0">
		<%@ include file="/views/admin/adminSideMenuBar.jsp"%>
	</div>
	<div class="col-lg-1"></div>
	<div class="memberPoint">
		<div class="memberPoint-header">
			<div>후기 관리</div>
			<div>
				<form id="search" style="display: inline-block;">
					<input type="text" placeholder="강사 검색" name="memberName"
						class="nameSearch"> <input type="hidden"
						value="nameSearch" name="method">
				</form>
				<input type="submit" value="" class="submitPicture"
					onclick="nameSearch();">
			</div>
		</div>
		<div id="ajaxTable">
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
					<td><input type="button" value="삭제" class="pointConfirm"
						onclick="deleteStory();" id="<%=s.getStoryNo()%>"></td>
				</tr>

				<%
					}
				%>
			</table>

			<%@ include file="/views/common/pagination.jsp"%>
		</div>
		<div id="pointPage" class="pointPage">

			<!-- Modal content -->
			<div class="pointPage-content">
				<span class="closePointPage">&times;</span>
				<div class="pointPage-header">
					<div>후기 내용</div>
				</div>
				<textarea class="PointTable"></textarea>
			</div>

		</div>


	</div>
</section>
<script type="text/javascript">

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
			data:{"no":$(this).attr('id'),
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

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>

<%@ include file="/views/common/footer.jsp"%>

</body>

</html>