<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.QandA"  %>
<%
	List<Member> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = "";
	String status = "";
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memberPoint.css">
<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
    <div class="header-background-cover"></div>
</div>
<section class="row">
    
    <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2" style="padding-left:0">
	    <%@ include file="/views/admin/adminSideMenuBar.jsp"%>	
	    </div>
<div class="col-lg-1"></div>
    <div class="memberPoint">
        <div class="memberPoint-header">
            <div>
                포인트 관리
            </div>
            <div>
            	<form action="<%=request.getContextPath() %>/admin/memberPointFinder"
                      onsubmit="return search_validate();" style="display:inline-block;">
                <input type="text" placeholder="검색" name="memberName" class="nameSearch">
                <input type="submit" value="" class="submitPicture">
                </form>
                <input type="text" placeholder="금액 입력" class="pointInput" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                <input type="submit" value="포인트 지급" class="pointSubmit">
                <input type="text" placeholder="금액 입력" class="pointInput" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
                <input type="submit" value="포인트 차감" class="pointSubmit">
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
                <td><input type="checkbox" name="" id=""></td>
                <td><%=m.getMemName() %></td>
                <td><%=m.getMemUserEmail() %></td>
                <td><%=grade %></td>
                <td><%=status %></td>
                <td><%=m.getMemPoint() %></td>
                <td><input type="button" value="내역 확인" class="pointConfirm"></td>
            </tr>
            <%} %>
        </table>
 
        <%@ include file="/views/common/pagination.jsp"%>
    </div>
</section>
<script type="text/javascript">
    $(function () {
        //전체선택 체크박스 클릭 
        $("#alldelete").click(function () {
            //만약 전체 선택 체크박스가 체크된상태일경우 
            if ($("#alldelete").prop("checked")) {
                //해당화면에 전체 checkbox들을 체크해준다 
                $("input[type=checkbox]").prop("checked", true);
                // 전체선택 체크박스가 해제된 경우 
            } else {
                //해당화면에 모든 checkbox들의 체크를해제시킨다. 
                $("input[type=checkbox]").prop("checked", false);
            }
        })
    })

    function delete_validate() {
        if ($('input:checkbox[name="checkQ&A"]').is(":checked") == false) {
            alert("선택된 글이 없습니다.");
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

  
</script>



<%@ include file="/views/common/footer.jsp" %>

</body>

</html>