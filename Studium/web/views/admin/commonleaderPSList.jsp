<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.studium.mypage.model.vo.LeaderAdd"%>    
<%@ page import="java.util.List" %>
<%
	List<LeaderAdd> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	
%>    
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
			<%for(LeaderAdd l : list){ %>
			<%
				String category = "";
				if(l.getlCategory2() == null && l.getlCategory3() == null){
					category = l.getlCategory1();
				}
				if(l.getlCategory2() != null && l.getlCategory3() == null){
					category = l.getlCategory1() + ", " + l.getlCategory2();
				}
				if(l.getlCategory2() == null && l.getlCategory3() != null){
					category = l.getlCategory1() + ", " + l.getlCategory3();
				}
				if(l.getlCategory2() != null && l.getlCategory3() != null){
					category = l.getlCategory1() + ", " + l.getlCategory2() + ", " + l.getlCategory3();
				}
				
			%>
			<tr>
				<td>
				<form class="deleteLeaderPS">
				<input type="hidden" name="method" value="leaderPSList2">
				<input type="checkbox" name="checkMember" class="checkMember" value="<%=l.getlNo() %>">
				</form>
				<td>
					<%=l.getlName() %>
				</td>
				<td>
					<%=l.getlGender() %>
				</td>
				<td class="pointConfirm" id="<%=l.getlNo()%>"><%=l.getlEmail() %></td>
				<td><%=l.getlPhone() %></td>
				<td><%=l.getlType() %></td>
				<td><%=l.getlArea() %></td>
				<td><%=category%></td>
				<td><%=l.getlEnrolldate() %></td>				
			</tr>
			<%} %>
		</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
		<%@ include file="/views/common/pagination.jsp"%>
<<script type="text/javascript">
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
    
     $('.pointConfirm').click(function(e) {
        	var memNo = $(this).attr('id');
        	console.log(memNo);
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
    
    
  
</script>