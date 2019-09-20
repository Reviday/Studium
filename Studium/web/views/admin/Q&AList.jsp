<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.admin.model.vo.QandA"  %>
<%
	List<QandA> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/Q&AList.css">
<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
    <div class="header-background-cover"></div>
</div>
<section>
    <div class="leftmenu">
        <ul>
            <li>
                <a href="<%=request.getContextPath()%>/AdminInqueryList">인쿼리</a>
            </li>
            <li>
                <a href="">적립금 관리</a>
            </li>
            <li>
                <a href="">게시글 관리</a>
            </li>
            <li class="qandaList">
                <a href="<%=request.getContextPath()%>/AdminQandAList">1:1문의 관리</a>
            </li>
        </ul>
    </div>

    <div class="qanda">
        <div>
            1:1문의 관리
        </div>
        <form action="<%=request.getContextPath()%>/AdminQandAListDelete" method="post"
            onsubmit="return delete_validate();">
            <input type="checkbox" name="allcheck" id="alldelete">
            <input type="submit" value="삭제" id="deletebtn">
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

  
</script>



<%@ include file="/views/common/footer.jsp" %>

</body>

</html>