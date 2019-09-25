<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member"%>
<% 
	Member m=(Member)request.getAttribute("member");

%>
 
<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}
</style>
 <!-- 메모적용 -->    
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.theme.min.css">
  <script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>

        <div class="section-content" style="height:600px">
                <div class="row">
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-8 navbar-myMenu" id="memo_area" style=" margin-top:20px">
                        <div style="margin:0px auto;"><button id="click" class="changePhoto" >새로운 메모</button></div>
                
                            <div id="0" class="newMemo">
                    <div class="memo_content">
                    <div class="memo_top">
                                <button class="memo_close" title="닫기" style="font-size: 25px; transform:rotate(45deg)">+</button>
                            
                    </div>
                    <textarea class="memo_write" name="txt" placeholder="메모를 입력하세요(ㅎㅅㅎ)" style="opacity: 5"></textarea>
                </div>
                </div>
                    </div>
                    <div class="col-sm-2">
                    </div>
                </div>

<script>
//기존에 있는 하나 움직일 수 있게 해줌 
$(".newMemo").draggable();
var numberId = 0;
$("#click").on("click", function () {
   //클릭할 때마다 아이디에 넣을 값 증가하게
   numberId += 1;
   //div만들기
   $newdiv = $('<div/>');
   // 랜덤좌표
   var posx = (Math.random() * ($(document).width() - 200)).toFixed();
   var posy = (Math.random() * ($(document).height() - 200)).toFixed();
   //임의의 색깔
   var color = '#' + Math.round(0xffffff * Math.random()).toString(16);
   //아이디값추가
   $newdiv.attr('id', numberId);
   //클래스값추가
   $newdiv.attr('class', 'newMemo');
   //첫 메모 클론, 값 초기화
   $(".memo_content").clone().appendTo($newdiv).children('.memo_write').val('');
   //css추가
   $newdiv.css({
       'width': '200px',
       'height': '200px',
       'background-color': color,
       'position': 'absolute',
       'left': posx + 'px',
       'top': posy + 'px',
       'display': 'none'
   }).appendTo('.section-content').fadeIn(100).draggable();;

//    //버튼으로 생성한  div삭제
//     $(".newMemo").on('click', function () {
//         console.log("들어옴");
//         $(this).remove();
//     });
$(".memo_close").on('click', function () {
       console.log("들어옴");
       $(this).parents('.newMemo').remove();
   });
});
//밖에 있는 기본 div삭제
$(".memo_close").on('click', function () {
       console.log("들어옴");
       $(this).parents('.newMemo').remove();
   });


</script>

    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>