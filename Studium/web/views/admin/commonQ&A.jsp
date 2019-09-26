<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.QandA"  %>
<%
	List<QandA> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<div>
            1:1문의 관리
        </div>
        <form method="post" id="deleteQnA">
            <input type="checkbox" name="allcheck" id="alldelete">
        	<button type="button" id="deletebtn" onclick="deleteQnA();">삭제</button>
            <table class="qandaTable">
                <tr>
                    <th>선택</th>
                    <th>이메일</th>
                    <th>내용</th>
                    <th>날짜</th>
                    <th>지난 날짜</th>
                    <th>글번호</th>
                </tr>
                <%for(QandA m : list){ %>
                <tr>
                    <td><input type="checkbox" name="checkQ&A" class="checkBoard" value="<%=m.getcNo() %>"></td>
                    <td class="QnAmo"><%=m.getEmail() %></td>
                    <td class="QnAmo"><%=m.getFullContent() %></td>
                    <td class="QnAmo"><%=m.getEnrollDate() %></td>
                    <td class="QnAmo"><%=m.getPastDate() %></td>
                    <td class="QnAmo"><%=m.getcNo() %></td>
                </tr>
                <%} %>
            </table>
        </form>
<link href="/Studium/css/pagination.css" rel="stylesheet">
<div class="page">
	<ul class="pagination num-modal">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>

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

	function ListQnA(cPage){
    		var params = '&cPage='+cPage + '&method=' + 'ListQnA';
    	$.ajax({
    		url: "<%=request.getContextPath()%>/AdminQandAList2",
    		type: "POST",
			dataType: "html",
			data: params,
			success: function(data){
				$(".qanda").html("");
				$(".qanda").html(data);
			}
    	})
    }
    
    function deleteQnA(cPage){
    	if($('input:checkbox[name="checkQ&A"]').is(":checked") == false){
    		alert("선택된 글이 없습니다.");
    		return false;
    	}
    	
    	var result = confirm("삭제하시겠습니까?");

		if(result){
		var params = jQuery("#deleteQnA").serialize();
		params+='&cPage='+cPage;
		$.ajax({
			url: "<%=request.getContextPath()%>/AdminQandAListDelete",
			type: "POST",
			dataType: "html",
			data: params,
			success: function(data){
				$(".qanda").html("");
				$(".qanda").html(data);
			}
		})
		return true;
		}else{
			return false;
		}
    }

  
</script>