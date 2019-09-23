<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.QandA"%>
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
				<form
					action="<%=request.getContextPath() %>/admin/memberPointFinder"
					onsubmit="return search_validate();" style="display: inline-block;">
					<input type="text" placeholder="검색" name="memberName"
						class="nameSearch"> <input type="submit" value=""
						class="submitPicture">
				</form>
				<form action="<%=request.getContextPath() %>/admin/memberPointUp"
					id="pointUp" onsubmit="return point_validate();"
					style="display: inline-block;">
					<input type="text" placeholder="금액 입력" name="pointUp"
						class="pointInput" onkeydown='return onlyNumber(event)'
						onkeyup='removeChar(event)'> <input type="submit"
						value="포인트 지급" class="pointSubmit">
				</form>
				<form action="<%=request.getContextPath() %>/admin/memberPointDown"
					id="pointDown" onsubmit="return point1_validate();"
					style="display: inline-block;">
					<input type="text" placeholder="금액 입력" name="pointDown"
						class="pointInput1" onkeydown='return onlyNumber(event)'
						onkeyup='removeChar(event)'> <input type="submit"
						value="포인트 차감" class="pointSubmit">
				</form>
			</div>
		</div>
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
					class="checkMember" id="checkMember" value="<%=m.getMemNo() %>"
					form="pointUp"> <input type="checkbox" name="checkMember1"
					class="checkMember1" id="checkMember1" value="<%=m.getMemNo() %>"
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
					<input type="button" value="내역 확인" class="pointConfirm" id="pointConfirm"
						   onclick="PointPageShow();">
				</td>
			</tr>

			<%} %>
		</table>

		<div id="pointPage" class="pointPage">

			<!-- Modal content -->
			<div class="pointPage-content">
				<span class="closePointPage">&times;</span>
				<div class="pointPage-header">
					<div>포인트 내역확인</div>
					<div>기영성<span>(ysung26@daum.net)</span></div>
				</div>
				<table class="PointTable">
					<tr>
						<th>일시</th>
						<th>금액</th>
						<th>상태</th>
					</tr>
					
					
				</table>
			</div>

		</div>


		<%@ include file="/views/common/pagination.jsp"%>
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
        
        $('.checkMember').on('click', function (e) {
            if ($(".checkMember").is(":checked") == true) {
            	$(".checkMember").next().prop("checked", true);  
            }else{
            	$(".checkMember").next().prop("checked", false);
            }
        });
        
        
    })
    
    

    function point_validate() {
    	if($('.checkMember').is(":checked") == false){
    		alert("회원을 체크하세요.");
    		return false;
    	}
    	
    	if($('.pointInput').val().trim() == 0) {
    		alert("포인트를 입력하세요.");
    		return false;
    	}
    }
    
    function point1_validate() {
    	if($('.checkMember1').is(":checked") == false){
    		alert("회원을 체크하세요.");
    		return false;
    	}
    	
    	if($('.pointInput1').val().trim() == 0) {
    		alert("포인트를 입력하세요.");
    		return false;
    	}
    }
    
    function search_validate() {
        if($('.nameSearch').val().trim() == 0) {
            alert("검색할 이름, 이메일을 입력하세요.");
            return false;
        }
    }
	
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
    

    var modal = document.getElementById('pointPage');
    var btn = document.getElementById("pointConfirm");
    var span = document.getElementsByClassName("closePointPage")[0];                                          
    
    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function PointPageShow() {
    	var memEmail = $(".trNo").text();
    	$.ajax({
			url:"<%=request.getContextPath()%>/PointPageShow",
			type:"post",
			data:{"no":'10050'},
			dataType:"json",
			success:function(data){
				console.log(data);
				var table=$("<table>");
				for(var i=0;i<data.length;i++){
					var td=$("<td>").html(data[i]['no']);
					var td2=$("<td>").html(data[i]['name']);
					var td3=$("<td>").html(data[i]['email']);
					var td4=$("<td>").html(data[i]['point']);
					var td5=$("<td>").html(data[i]['pointstatus']);
					var td6=$("<td>").html(data[i]['enrolldate']);
					table.append($("<tr>").append(td).append(td2).append(td3).append(td4).append(td5).append(td6));
				}
				$(".PointTable").html(table);
			
			}
		});
    }
  
</script>



<%@ include file="/views/common/footer.jsp"%>

</body>

</html>