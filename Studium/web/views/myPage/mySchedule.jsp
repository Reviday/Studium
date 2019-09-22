<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    <link rel=" shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href='<%=request.getContextPath() %>/css/select2.min.css' />
    <link rel="stylesheet" href='<%=request.getContextPath() %>/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/calendar.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<%@ include file="../../views/common/header.jsp" %> 

<body>

    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="1" href="#">카테고리</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                  
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
 					 <form id="edit_form">
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <input type="hidden" name="edit-type" id="edit-type" value="카테고리1">
	
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                       <input type="hidden" name="mNo" id="mNo" value="<%=loginMember.getMemNo()%>"/>
                       <input type="hidden" name="mName" id="mName" value="<%=loginMember.getMemName()%>"/>
                        <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event" onclick="addevent();">저장</button>
                    </div>
                    </form>  
                    </div>
                    
                   
                    
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                   
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple" value="카테고리1">
                        </select>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
    

    <script src="<%=request.getContextPath() %>/vendor/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/js/moment.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/js/fullcalendar.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/js/ko.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/calendar.js"></script>
   <script src="<%=request.getContextPath() %>/js/addEvent.js"></script> 
	<script>

	function addevent(){

    var id= $("#mNo").val();
    var title= $("#edit-title").val();
    var start= $("#edit-start").val();
    var end= $("#edit-end").val();
    var description= $("#edit-desc").val();
    var username=$("#mName").val();
    var backgroundColor= $("#edit-color").val();
    var params = jQuery("#edit_form").serialize();
    var eventModal =$("#eventModal");
     //새로운 일정 저장
     $.ajax({
         type: "post",
         url: "<%=request.getContextPath()%>/MyCalender",
         dataType: "json",
         data: params,
         success: function (data) {
        	 console.log(data);
        	 eventModal.modal('hide');
         },
     	error:function(e){
     		console.log(e);
     	}
     		
     });
	}
	
	
	</script>
	
	

    <script src="<%=request.getContextPath() %>/js/editEvent.js"></script>
    <script src="<%=request.getContextPath() %>/js/etcSetting.js"></script>
</body>

</html>
<%-- <%@ include file="/views/common/footer.jsp"%> --%>
