<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.studium.member.model.vo.Member" %>
<%
	List<Member> list=(List)request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String grade = (String)request.getAttribute("grade");
	String status = (String)request.getAttribute("status");
	request.setAttribute("setGrade", grade);
	request.setAttribute("setStatus", status);
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>관리자 1:1문의 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/inquery.css">
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <%@ include file="/views/common/header.jsp"%>
    <div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
        <div class="header-background-cover"></div>
    </div>

    <section class="inquerySection">
        <div class="leftmenu">
            <ul>
                <li>
                    <a href="<%=request.getContextPath()%>/AdminInqueryList">인쿼리</a>
                </li>
                <li>
                    <a href="">적립금 관리</a>
                </li>
                <li class="qandaList">
                    <a href="<%=request.getContextPath()%>/AdminQandAList">1:1문의 관리</a>
                </li>
            </ul>
        </div>

        <div class="inquery">
            <div class="inquery-header">
                <!--헤더div-->
                <div>
                    <!--왼쪽 상단에 위치함-->
                    회원정보
                </div>
                <div>
                    <!--오른쪽 상단에 위치하는 검색기능-->
                    <form action="<%=request.getContextPath()%>/adminInquerySearch">
                        <select name="gradeList" id="gradeList">
                            <option value="allGrade" <%="allGrade".equals(grade) ? "selected" : "" %>>전체</option>
                            <option value="M" <%="M".equals(grade) ? "selected" : "" %>>관리자</option>
                            <option value="T" <%="T".equals(grade) ? "selected" : "" %>>강사</option>
                            <option value="R" <%="R".equals(grade) ? "selected" : "" %>>정회원</option>
                            <option value="A" <%="A".equals(grade) ? "selected" : "" %>>준회원</option>
                        </select>

                        <select name="statusList" id="statusList">
                            <option value="allStatus" <%="allStatus".equals(status) ? "selected" : "" %>>전체</option>
                            <option value="N" <%="N".equals(status) ? "selected" : "" %>>정상</option>
                            <option value="Y" <%="Y".equals(status) ? "selected" : "" %>>일시정지</option>
                            <option value="P" <%="P".equals(status
                            		) ? "selected" : "" %>>영구정지</option>
                        </select>
                        <input type="submit" value="조회" class="submitSearch">
                    </form>


                    <form action="<%=request.getContextPath() %>/admin/memberFinder"
                        onsubmit="return search_validate();">
                        <input type="text" placeholder="이름 입력" name="memberName">
                        <input type="submit" value="" class="submitPicture">
                    </form>
                </div>
            </div>
            <table class="inqueryTable">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>가입일시</th>
                    <th>등급</th>
                    <th>상태</th>
                    <th>회원수정</th>
                    <th>회원탈퇴</th>
                </tr>
                <%for(Member m : list){ %>
                <tr>
                    <td><%=m.getMemNo() %></td>
                    <td><%=m.getMemName() %></td>
                    <td><%=m.getMemUserEmail() %></td>
                    <td><%=m.getMemEnrollDatetime() %></td>
                    <form action="<%=request.getContextPath()%>/adminUpdateMember">
                    <input type="hidden" value="<%=m.getMemNo() %>" name="memUpdateNo" class="memUpdateNo">
                    <td>
                        <select name="memberGradeList" id="memberGradeList">
                            <option value="M" <%='M' == m.getMemCode() ? "selected" : "" %>>관리자</option>
                            <option value="T" <%='T' == m.getMemCode() ? "selected" : "" %>>강사</option>
                            <option value="R" <%='R' == m.getMemCode() ? "selected" : "" %>>정회원</option>
                            <option value="A" <%='A' == m.getMemCode() ? "selected" : "" %>>준회원</option>
                        </select>
                    </td>
                    <td>
                        <select name="memberStatusList" id="memberStatusList">
                            <option value="N" <%='N' == m.getMemDenied() ? "selected" : "" %>>정상</option>
                            <option value="Y" <%='Y' == m.getMemDenied() ? "selected" : "" %>>일시정지</option>
                            <option value="P" <%='P' == m.getMemDenied() ? "selected" : "" %>>영구정지</option>
                        </select>
                    </td>
                    <td>
                     <input type="submit" value="수정" class="memberUpdate">
                    </td>
                    </form>
                    <td>
                        <%-- <form action="<%=request.getContextPath()%>/adminDeleteMember"  --%>
                        	  <!-- onsubmit="return delete_validate();"> -->
                            <input type="hidden" value="<%=m.getMemNo() %>" name="memNo" class="memNo">
                            <input type="button" value="탈퇴" class="deleteSubmit" onclick="deleteMember();">
                        <!-- </form> -->
                    </td>
                </tr>
                <%} %>
            </table>
            <%@ include file="/views/common/pagination.jsp"%>
        </div>

    </section>

    <script>
        function search_validate() {
            if ($('input:text[name="memberName"]').val().trim() == 0) {
                alert("선택된 이름이 없습니다.");
                return false;
            }
        }

        function delete_validate() {
        	var result = confirm("정말 탈퇴하시겠습니까?");
        	if(result){
        		return true;
        	}else{
        		return false;
        	}
        }
        
        function deleteMember(){
        	
        	var result = confirm("정말 탈퇴하시겠습니까?");
        	if(result){
        	var grade = $("#gradeList").val();
        	var status = $("#statusList").val();
        	var memNo = $(".memNo").val();
        	$.ajax({
        		url: "<%=request.getContextPath()%>/adminDeleteMember",
        		type: "POST",
        		cache: false,
        		dataType: "json",
        		data: {"grade": grade, "status": status, "memNo": memNo},
        		success: function(data){
        			if(data != null) {console.log(data);}
        			else {console.log("안됨");}
        		},
        		error:
                    function (request, status, error){
                    alert("ajax실패");}
        		return true;
        	}else{
        		
        		return false;
        	}
        	
        	
        }
        
        
        
        
        function fn_dibs2(){
        	/* var mno = $("#mNo").val();
			var pno = $("#pNo").val();*/
			var A = $("#A").val();	 //a값을 받아서 a에 넣기		
			var params = jQuery("#dibs_form").serialize();
				if(<%=loginMember!=null%>){
				$.ajax({
				url: "<%=request.getContextPath()%>/fstudy/fstudyDibss",  //doGet3 만들어서 찜하기 아닌상태 컨트롤러 만들어서 사용
				type: "POST",
				cache: false,
				dataType: "json",
				// data 이렇게 했을때 파라티머 받는지 확인 
				// 보내는 방법 ex) 컨트롤러파라미터변수이름 : 니가보낼데이터   {mno : mno}
				//data: {"mno":mno, "pno" : pno, "A" : A }, 
				data: params , 
				//아이디가 like_form인 곳의 모든 정보를 가져와 파라미터 전송 형태(표준 쿼리형태)로 만들어줌
				success:
				function(data){ //ajax통신 성공시 넘어오는 데이터 통째 이름 =data
				console.log(data+"ajax데이터 들어오는거");
				if(data==("1")){ //넘어온 데이터 값이 1이면 찜하기 구현
					$("#A").val("0");
					$("#dibscon").html($("<input>").attr({"value":"0",
						"type":"hidden",
						"id":"A",
						"name":"A"}));
					$("#dibscon").html($("<img>").attr({"src":"<%=request.getContextPath()%>/img/dibson.png",
														"class":"dibs",
														"style":"width:150px"
															}));
					$('#toast').animate({opacity: '1'}, 100);
					$("#toast").css("display","block");
					$("#message").html(("찜하기 성공"));
					$('#toast').animate({opacity: '0'}, 1000);
				}else {//
					
					$("#A").val("1");
					$("#dibscon").html($("<input>").attr({"value":"1","type":"hidden",
						"id":"A",
						"name":"A"}));
					$("#dibscon").html($("<img>").attr({"src":"<%=request.getContextPath()%>/img/dibsoff.png",
														"class":"dibs",
														"style":"width:150px"}));
					$('#toast').animate({opacity: '1'}, 100);
					$("#toast").css("display","block");
					$("#message").html(("찜하기 취소"));
					$('#toast').animate({opacity: '0'}, 1000);
					
				}
				
				},
				error:
				function (request, status, error){
				alert("ajax실패");
				$("#A").val("0");
				$("#dibscon").html(data);
				}
				});
        	}
				else{
					fn_loginAlert();
					return false;
				}      
        }
        
    </script>


    <%@ include file="/views/common/footer.jsp"%>
</body>

</html>
>