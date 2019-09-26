<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member"%>
<%
	List<Member> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = "";
	String status = "";
%>    
<table class="memberTable">
			<tr>
				<th>선택</th>
				<th>이름</th>
				<th>이메일</th>
				<th>등급</th>
				<th>상태</th>
				<th>포인트</th>
				<th>포인트 내역확인</th>
			</tr>
			<%for(Member m : list){ %>
			<%
            	if(m.getMemCode() == 'T'){grade = "강사";} 
            	if(m.getMemCode() == 'R'){grade = "정회원";}
            	if(m.getMemCode() == 'A'){grade = "준회원";}
            	if(m.getMemDenied() == 'N'){status = "정상";}
            	if(m.getMemDenied() == 'Y'){status = "일시정지";}
            	if(m.getMemDenied() == 'P'){status = "영구정지";}
            	%>
			<tr>
				<td><input type="checkbox" name="checkMember"
					class="checkMember" value="<%=m.getMemNo() %>"
					form="pointUp"> <input type="checkbox" name="checkMember1"
					class="checkMember1" value="<%=m.getMemNo() %>"
					form="pointDown"></td>
				<td>
					<%=m.getMemName() %>
					<input type="hidden" value="<%=m.getMemName() %>" name="memName" form="pointUp">
					<input type="hidden" value="<%=m.getMemName() %>" name="memName1" form="pointDown">	
				</td>
				<td>
					<%=m.getMemUserEmail() %>
					<input type="hidden" value="<%=m.getMemUserEmail() %>" name="memEmail" form="pointUp">
					<input type="hidden" value="<%=m.getMemUserEmail() %>" name="memEmail1" form="pointDown">
				</td>
				<td><%=grade %></td>
				<td><%=status %></td>
				<td><%=m.getMemPoint() %></td>
				<td class="trNo" style="display:none;"><%=m.getMemNo() %></td>
				<td>
					<input type="button" value="내역 확인" class="pointConfirm" id="<%=m.getMemNo() %>"> 
				</td>
			</tr>

			<%} %>

		</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>
<script type="text/javascript">

function inqueryList3(cPage){
	 var params = '&cPage='+cPage+'&method='+"inqueryList3";
	 $.ajax({
		url: "<%=request.getContextPath()%>/inqueryList3",
		type: "POST",
		dataType: "html",
		data: params,
		success: function(data){
			$("#ajaxTable").html("");
			$("#ajaxTable").html(data);
		}
	})
}

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
        
        $('.checkMember').on('click', function (e) {
            if ($(this).is(":checked") == true) {
            	$(this).next().prop("checked", true);  
            }else{
            	$(this).next().prop("checked", false);
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
	
    function onlyNumber(event){
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
            return;
        else
            return false;
    }
     
    function removeChar(event) {
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
            return;
        else
            event.target.value = event.target.value.replace(/[^0-9]/g, "");
    }
    
    
    	$(".pointConfirm").click(function(){
    		console.log($(this).attr('id'));
    		$.ajax({
    			url:"<%=request.getContextPath()%>/PointPageShow",
    			type:"post",
    			data:{"no":$(this).attr('id')},
    			dataType:"json",
    			success:function(data){
    				console.log(data);
    				if(data[0] != null){
    				var table=$("<table>");
    				var th="<tr><th>일시</th>	<th>금액</th>	<th>상태</th>	</tr>";
    				table.append(th);
    				for(var i=0;i<data.length;i++){
    					var td=$("<td>").html(data[i]['memId']);
    					var td2=$("<td>").html(data[i]['memName']);
    					var td3=$("<td>").html(data[i]['memEmail']);
    					var td4=$("<td>").html(data[i]['point']);
    					if(data[i]['pointStatus'] == 'Y'){
    						var td5=$("<td>").html("지급");
    					}else{
    						var td5=$("<td>").html("차감");
    					}
    					var td6=$("<td>").html(data[i]['pointEnrollDate']);
    					table.append($("<tr>").append(td6).append(td4).append(td5));
    				}
    				$("#pointPageName").text(data[0]['memName']+"("+data[0]['memEmail']+")");
    				$(".PointTable").html(table);
    				
    				$("#pointPage").css("display","block");
    				}else{
    					alert("포인트내역이 없습니다.");
    				}
    			},
    			error:function(r,e,m){
    				console.log(r);
    				console.log(e);
    				console.log(m);	
    				alert("포인트내역이 없습니다.");
    			}
    		});
    	})
    
    	function nameSearch(cPage) {
    			
        		if(!$(".nameSearch").val().trim()){
        			alert("검색할 이름, 이메일을 입력하세요.");
        		}else{
        		var params = jQuery("#search").serialize();
        		params+='&cPage='+cPage;
        		$.ajax({
        			url: "<%=request.getContextPath() %>/admin/memberPointFinder",
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
    	
    	function pointUp(cPage) {
    		if($('.checkMember').is(":checked") == false){
        		alert("회원을 체크하세요.");
        		return false;
        	}
        	
        	if($('.pointInput').val().trim() == 0) {
        		alert("포인트를 입력하세요.");
        		return false;
        	}	
    
    		var params = jQuery("#pointUp").serialize();
    		params+='&cPage='+cPage;
    		$.ajax({
    			url: "<%=request.getContextPath() %>/admin/memberPointUp",
    			type: "POST",
    			dataType: "html",
    			data: params,
    			success: function(data){
    				$("#ajaxTable").html("");
    				$("#ajaxTable").html(data);
    			}
    		})
    		
    	}
    	
    	function pointDown(cPage) {
    		if($('.checkMember1').is(":checked") == false){
        		alert("회원을 체크하세요.");
        		return false;
        	}
        	
        	if($('.pointInput1').val().trim() == 0) {
        		alert("포인트를 입력하세요.");
        		return false;
        	}	
    
    		var params = jQuery("#pointDown").serialize();
    		params+='&cPage='+cPage;
    		$.ajax({
    			url: "<%=request.getContextPath() %>/admin/memberPointDown",
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
