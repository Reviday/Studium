<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member"%>
<%@ page import="com.studium.member.model.vo.MyMemo"%>
 <%@ page import="java.util.List"%>
<% 
	Member m=(Member)request.getAttribute("member");
	List<MyMemo> listM=(List)request.getAttribute("memoList");
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
                <div class="row">
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-8 navbar-myMenu" id="memo_area" style=" margin-top:20px">
                        <div style="margin:0px auto;"><button id="click" class="changePhoto" >새로운 메모</button></div>
                <% if(!listM.isEmpty()){
						for(MyMemo mm : listM){
						%>
						
                            <div id="<%=mm.getMemoFrontId()%>" class="newMemo"  style="left:<%=mm.getMemoLeft()%>px; top:<%=mm.getMemoTop()%>px">
                   				
							<input type="hidden"  id="primary" name="primary" value="<%=mm.getMemoId()%>"> 
                   				<div class="memo_content">
                    				<div class="memo_top">
                                		<button class="memo_close" title="닫기" style="font-size: 25px; transform:rotate(45deg)">+</button>
                            
                    				</div>
                    				<% String contents="";
                    				if(mm.getMemoContents()!=null){
                    					contents=mm.getMemoContents();
                    				} %>
                   					<textarea class="memo_write" name="txt" placeholder="메모를 입력하세요(ㅎㅅㅎ)" style="opacity: 5"><%=contents%></textarea>
               					 </div>
                			</div>
                			<%
						}
                	}else{%>
                	<div>
                	<h5>새로운 메모를 만들어보세요!</h5>
                	</div>
                	<%} %>
                	
                    <div class="col-sm-2">
                    </div>
                </div>
	
	<script>
	//기존에 있는 하나 움직일 수 있게 해줌 
	$(".newMemo").draggable();
	
	

	//창이 있는지 확인하는 요소
	var visible_element = $('.newMemo display:block');
	//이 창이 없으면 div 새롭게 만들어줌 
	if(!visible_element.val()){
			numberId=0;
	}else{

		//메모의 마지막 div의 id, 숫자로 형변환해서 가져옴 
		numberId=$(".newMemo").last().attr("id");
	}

	//버튼 눌러서 새로운 메모 생성
	$("#click").on("click", function () {
		
	   //클릭할 때마다 아이디에 넣을 값 증가하게
	   numberId += 1;
	   //div만들기
	   $newdiv = $('<div><div/>');
	   // 랜덤좌표
	   var posx = (Math.random() * ($('#memo_area').width())).toFixed();
	   var posy = (Math.random() * ($('#memo_area').height())).toFixed();
	   //임의의 색깔
	   //var color = '#' + Math.round(0xffffff * Math.random()).toString(16);
	   

		//창이 있는지 확인하는 요소
		var visible_element = $('.newMemo display:block');
		//이 창이 없으면 div 새롭게 만들어줌 
		if(!visible_element.val()){
			   var divE='';
			   divE+='<input type="hidden"  id="primary" name="primary" value="0">';
			   divE+='<div class="memo_content">';
			   divE+='<div class="memo_top">';
			   divE+='<button class="memo_close" title="닫기">+</button>';
			   divE+='</div>';
			   divE+='<textarea class="memo_write" name="txt" placeholder="메모를 입력하세요(ㅎㅅㅎ)" style="opacity: 5"></textarea>';
			   divE+='</div>';
			   
			 $newdiv.append(divE);
			 
		}else{//값이 있으면 클론
			 //첫 메모 클론, 값 초기화
			$(".memo_content").clone().appendTo($newdiv).children('.memo_write').val('');
				
		}
		   //아이디값추가
		   $newdiv.attr('id', numberId);
		   //클래스값추가
		   $newdiv.attr('class', 'newMemo');
	   //css추가
	   $newdiv.css({
	       'width': '222',
	       'height': '230',
	       'position': 'absolute',
	       'left': posx + 'px',
	       'top': posy + 'px',
	       'display': 'none'
	   }).appendTo('#memo_area').fadeIn(100).draggable();
	
	
	   
	   $.ajax({
	       url:'<%=request.getContextPath()%>/myPage/myMemoNew?no=<%=m.getMemNo()%>',
	       type:'POST',
	       cache: false,
	       dataType: "json",
	       data:{"id":numberId, "left":posx, "top": posy},
	       success:function(data){
	    	   var result = data;
	    	   var newPrimary=Number(data);
	    	   $newdiv.find("#primary").val(data);
	       }
	   });
		
	});
	
	
	
	
	
	//밖에 있는 기본 div삭제
	$(".memo_close").on('click', function () {
	       $(this).parents('.newMemo').remove();
	       var primary=$(this).parents('.newMemo').find('input[name="primary"]').val();
	       var status='N';
	      console.log(primary);
	      console.log(status);
	
	      $.ajax({
	          url:'<%=request.getContextPath()%>/studium/MyMemoDelete?no=<%=m.getMemNo()%>',
	          type:'POST',
	          cache: false,
	          dataType: "json",
	          data:{"primary":primary},
	          success:function(data){
	              console.log('삭제됨');
	          }
	      });
	      
	   });
	   //옮긴 위치 저장
	$(document).on("mouseup",".newMemo", function(){
		var elem = $(this),
		    id = elem.attr('id'),//아이디
		    pos = elem.position(),//위치가져오기
		    val= elem.find('textarea[name="txt"]').val();//textarea의 내용
		    
		var primary=elem.find("#primary").val();   
		var left=pos.left.toFixed(0);
		var top=pos.top.toFixed(0);
		
		//console.log('Left: '+left+'; Top:'+top);
		//console.log(id);
		//console.log('이거슨 내용이닷: '+val);
		//console.log('이거슨 프라이머리값: '+primary);
		
		  $.ajax({
	      	url:'<%=request.getContextPath()%>/myPage/myMemoEnd?no=<%=m.getMemNo()%>',
	          type:'POST',
				cache: false,
				dataType: "json",
	          data:{"id":id, "left":left, "top": top, "val": val, "primary":primary},
	          success:function(data){
	          	console.log('success~~~~');
	          }
	
			});
		
		});
	
	</script>

    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>