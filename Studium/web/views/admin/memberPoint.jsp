<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%
	List<Member> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = "";
	String status = "";
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/memberPoint.css">
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
			<div>포인트 관리</div>
			<div>
				<button id="allcheck">전체</button>
				<form id="search" style="display: inline-block;">
					<input type="text" placeholder="검색" name="memberName" class="nameSearch"> 
					<input type="hidden" value="nameSearch" name="method">
				</form>
					<input type="submit" value="" class="submitPicture" onclick="nameSearch();">
				<form id="pointUp" style="display: inline-block;">
					<input type="hidden" value="inqueryList3" name="method">
					<input type="text" placeholder="금액 입력" name="pointUp" class="pointInput" onkeydown='return onlyNumber(event)'onkeyup='removeChar(event)'> 
				</form>
					<input type="submit" value="포인트 지급" class="pointSubmit" onclick="pointUp();">
				<form id="pointDown" style="display: inline-block;">
					<input type="hidden" value="inqueryList3" name="method">
					<input type="text" placeholder="금액 입력" name="pointDown" class="pointInput1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'> 
				</form>
					<input type="submit" value="포인트 차감" class="pointSubmit" onclick="pointDown();">
			</div>
		</div>
		<div id="ajaxTable">
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
		
		<%@ include file="/views/common/pagination.jsp"%>
		</div>
		<div id="pointPage" class="pointPage">

			<!-- Modal content -->
			<div class="pointPage-content">
				<span class="closePointPage">&times;</span>
				<div class="pointPage-header">
					<div>포인트 내역확인</div>
					<div id="pointPageName"><span>(<span id="pointPageEmail"></span>)</span></div>
				</div>
				<div class="PointTable">
				</div>
			</div>

		</div>


	</div>
</section>
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



<%@ include file="/views/common/footer.jsp"%>

</body>

</html>