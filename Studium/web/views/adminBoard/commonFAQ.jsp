<%@page import="com.studium.admin.model.vo.FAQ"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
	List<FAQ> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
		<div class="memberPoint-header">
			<div>자주 묻는 질문 관리</div>
			<button id="plusQnA" onclick="plusQnA();">게시글 작성</button>
		</div>
		<div id="ajaxTable">
			<table class="memberTable">
				<tr>
					<th>번호</th>
					<th>종류</th>
					<th>질문</th>
					<th>수정/삭제</th>
				</tr>
				<% for (FAQ f : list) { %>
				<tr>
					<td><%=f.getFaqNO()%></td>
					<td><%=f.getFaqType()%></td>
					<td><%=f.getFaqTitle()%></td>
					<td>
						<input type="button" class="updatebtn" id="<%=f.getFaqNO() %>" value="수정/삭제">
					</td>
				</tr>
				<%
				}
			%>
			</table>
<link href="/Studium/css/pagination.css" rel="stylesheet">
			<%@ include file="/views/common/pagination.jsp"%>
		</div>

	</div>
</section>
<script type="text/javascript">
	  
	  function plusQnA(){
		  $.ajax({
      		url: "<%=request.getContextPath()%>/AdminPlusQnA",
      		type: "POST",
      		dataType: "html",
      		success: function(data){
      			$(".memberPoint").html("");
      			$(".memberPoint").html(data);
      		}
      	})
	  }
    
	  $(".updatebtn").click(function(){
		  $.ajax({
				url: "<%=request.getContextPath()%>/updatedelete",
				type: "POST",
				data: {'faqNo' : $(this).attr("id")},
			    dataType: "html",
			      success: function(data){
			      	$(".memberPoint").html("");
			      	$(".memberPoint").html(data);
			      }
			}) 	
	  })
    
    
  
</script>