<%@page import="com.studium.mypage.model.vo.LeaderAdd"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
	List<LeaderAdd> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/leaderPS.css">
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
			<div>강사 신청 관리</div>
			<div>
				<button id="allcheck">전체</button>
				<button type="button" id="deleteLeaderPS"
					onclick="deleteLeaderPS();">삭제</button>
			</div>
		</div>
		<div id="ajaxTable">
			<table class="memberTable">
				<tr>
					<th>선택</th>
					<th>이름</th>
					<th>성별</th>
					<th>이메일</th>
					<th>휴대폰 번호</th>
					<th>타입</th>
					<th>희망지역</th>
					<th>선호 카테고리</th>
					<th>신청일</th>
				</tr>
				<%
					for (LeaderAdd l : list) {
				%>
				<%
					String category = "";
						if (l.getlCategory2() == null && l.getlCategory3() == null) {
							category = l.getlCategory1();
						}
						if (l.getlCategory2() != null && l.getlCategory3() == null) {
							category = l.getlCategory1() + ", " + l.getlCategory2();
						}
						if (l.getlCategory2() == null && l.getlCategory3() != null) {
							category = l.getlCategory1() + ", " + l.getlCategory3();
						}
						if (l.getlCategory2() != null && l.getlCategory3() != null) {
							category = l.getlCategory1() + ", " + l.getlCategory2() + ", " + l.getlCategory3();
						}
				%>
				<tr>
					<td>
						<form class="deleteLeaderPS" method="POST">
							<input type="hidden" name="method" value="leaderPSList2">
							<input type="checkbox" name="checkMember" class="checkMember"
								value="<%=l.getlNo()%>">
						</form> 
					<td><%=l.getlName()%></td>
					<td>
						<%=l.getlGender()%>
					</td>
				<td class="pointConfirm" id="<%=l.getlNo()%>"><%=l.getlEmail()%></td>
				<td><%=l.getlPhone()%></td>
				<td><%=l.getlType()%></td>
				<td><%=l.getlArea()%></td>
				<td><%=category%></td>
				<td><%=l.getlEnrolldate()%></td>				
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
					<div>지원내용</div>
					<div id="pointPageName">

					</div>
				</div>
				<div class="PointTable">
				</div>
			</div>

		</div>


	</div>
</section>
<script type="text/javascript">
    $(function () {
        $(".checkMember").prop("checked", false);
        var check = 0;
        $("#allcheck").click(function () {
             
				if(check == 0){            
                $(".checkMember").prop("checked", false);
                $(".checkMember1").prop("checked", false);
            		check++;
            		return;
				}
				if(check == 1){
					$(".checkMember").prop("checked", true);
					$(".checkMember1").prop("checked", true);
					check--;
					return;
				}
            
        });
        
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
	  
    function deleteLeaderPS(cPage){
    	if($('input:checkbox[name="checkMember"]').is(":checked") == false){
    		alert("선택된 인원이 없습니다.");
    		return false;
    	}
    	
    	var result = confirm("삭제하시겠습니까?");

		if(result){
		
		var params = jQuery(".deleteLeaderPS").serialize();
		params+='&cPage='+cPage;
		console.log(params);
		$.ajax({
			url: "<%=request.getContextPath()%>/admindeleteLeaderPSList",
			type: "POST",
			dataType: "html",
			data: params,
			success: function(data){
				console.log("성공이니?");
				$("#ajaxTable").html("");
				$("#ajaxTable").html(data);
			}
		})
		return true;
		}else{
			return false;
		}
    }
    
    function leaderPSList2(cPage){
    	var params = '&cPage='+cPage + '&method=' + 'leaderPSList2';
    	$.ajax({
    		url: "<%=request.getContextPath()%>/leaderPSList2",
    		type: "POST",
			dataType: "html",
			data: params,
			success: function(data){
				$("#ajaxTable").html("");
				$("#ajaxTable").html(data);
			}
    	})
    }
    
    $(function() {
        $('.pointConfirm').click(function(e) {
        	var memNo = $(this).attr('id');
        	$.ajax({
        		url: "<%=request.getContextPath()%>/adminPSMemo",
        		type: "POST",
        		dataType: "json",
        		data: {"memNo" : memNo},
        		success: function(data){
        			$("#pointPageName").text(data);
        			$("#pointPageName").val(data);
                	$("#pointPage").css("display","block");
        		}
        	})
        });

    })
    
  
</script> 
<%@ include file="/views/common/footer.jsp"%>

						</body>

						</html>