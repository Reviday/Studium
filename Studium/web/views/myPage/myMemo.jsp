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


    <div class="section-content">
        <div class="memo_wrap">
    <div class="memo_box" id="memoDrag">
        <div class="memo_top">
            <button class="btn_add" title="추가" style="font-size: 15px">+</button>
            <button class="btn_save" title="저장"><img src="img/upload.png" style="width:15px; height:12.5px;"></i></button>
            <div class="right">
                <button class="btn_list" title="목록"><img src="img/list.png" style="width:15px; height:12.5px;"></i></button>
                <button class="btn_close" title="닫기"style="font-size: 15px; transform:rotate(45deg)">+</button>
            </div>
        </div>
        <textarea class="memo_write" name="txt" placeholder="메모를 입력하세요"></textarea>
        <div class="memo_list" style="display:none">
            <ul></ul>
        </div>
    </div>
</div>

<script>
    $("#memoDrag").draggable();
    if (localStorage) {
        for (var i = 0; i < localStorage.length; i++) {
            $('.memo_list ul').append($('<li>').text(localStorage.key(i)));
        }
    }
    $('.memo_list ul').find('li').append('<a href="#n" class="memo_del"><img src="img/trash.png" style="width:12px; height:15px;"></a>');

    var stickyMemo = $('.memo_wrap');

    // 메모추가 
    stickyMemo.on('click', '.btn_add', function() {
        $(this).parents('.memo_box').clone().appendTo('.memo_wrap').draggable().children('.memo_write').val('');
        $('#drag').draggable();
    });

    // 메모저장
    stickyMemo.on('click', '.btn_save', function() {
        var txtMemo = $(this).parents('.memo_box').find('.memo_write').val();
        var title = prompt('제목을 입력해 주세요');
        localStorage.setItem(title, txtMemo);
        $('.memo_list ul').append($('<li>').text(title).append('<a href="#n" class="memo_del"><img src="img/trash.png" style="width:12px; height:15px;"></a>'));
    });

    // 메모삭제
    stickyMemo.on('click', '.btn_close', function() {
        $(this).parents('.memo_box').remove();
    });

    // 메모삭제
    stickyMemo.on('click', '.memo_del', function() {
        var removeLi = $(this).parents('li');
        var removeLiTitle = removeLi.text();
        localStorage.removeItem(removeLiTitle);
        removeLi.remove();
    });

    // 목록열기
    stickyMemo.on('click', '.btn_list', function() {
        $(this).parents('.memo_box').find('.memo_list').toggle();
    });
    stickyMemo.on('click', '.memo_list li', function() {
        $('.memo_list').hide();
        var selectTitle = $(this).text();
        var selectCon = localStorage.getItem(selectTitle);
        $(this).parents('.memo_box').find('.memo_write').val(selectCon);
    });
</script>

    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>