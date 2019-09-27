<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*,com.studium.category.model.vo.Category" %>
<%
    List<Category> listM=(List)request.getAttribute("categoryM");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

    <title>studyAdd</title>
    <style>
        body {
            font-family: "Do Hyeon", Arial;
        }

        img.ui-datepicker-trigger {
            margin-left: 5px;
            vertical-align: middle;
            cursor: pointer;
        }

        .star-input>.input,
        .star-input>.input>label:hover,
        .star-input>.input>input:focus+label,
        .star-input>.input>input:checked+label {
            display: inline-block;
            vertical-align: middle;
            background: url('<%=request.getContextPath()%>/img/grade_img.png')no-repeat;
        }

        .star-input {
            display: inline-block;
            white-space: nowrap;
            width: 225px;
            height: 40px;
            padding: 25px;
            line-height: 30px;
        }

        .star-input>.input {
            display: inline-block;
            width: 150px;
            background-size: 150px;
            height: 28px;
            white-space: nowrap;
            overflow: hidden;
            position: relative;
        }

        .star-input>.input>input {
            position: absolute;
            width: 1px;
            height: 1px;
            opacity: 0;
        }

        star-input>.input.focus {
            outline: 1px dotted #ddd;
        }

        .star-input>.input>label {
            width: 30px;
            height: 0;
            padding: 28px 0 0 0;
            overflow: hidden;
            float: left;
            cursor: pointer;
            position: absolute;
            top: 0;
            left: 0;
        }

        .star-input>.input>label:hover,
        .star-input>.input>input:focus+label,
        .star-input>.input>input:checked+label {
            background-size: 150px;
            background-position: 0 bottom;
        }

        .star-input>.input>label:hover~label {
            background-image: none;
        }

        .star-input>.input>label[for="p1"] {
            width: 30px;
            z-index: 5;
        }

        .star-input>.input>label[for="p2"] {
            width: 60px;
            z-index: 4;
        }

        .star-input>.input>label[for="p3"] {
            width: 90px;
            z-index: 3;
        }

        .star-input>.input>label[for="p4"] {
            width: 120px;
            z-index: 2;
        }

        .star-input>.input>label[for="p5"] {
            width: 150px;
            z-index: 1;
        }

        .star-input>output {
            display: inline-block;
            width: 60px;
            font-size: 18px;
            text-align: right;
            vertical-align: middle;
        }
    </style>
    <script>
        $(function () {


            //오늘 날짜를 출력
            $("#today").text(new Date().toLocaleDateString());

            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);

            // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
            // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

            //시작일.
            $('#fromDate').datepicker({
                showOn: "both", // 달력을 표시할 타이밍 (both: focus or button)
                buttonImage: "../img/favicon.ico", // 버튼 이미지
                buttonImageOnly: true, // 버튼 이미지만 표시할지 여부
                buttonText: "날짜선택", // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd", // 날짜의 형식
                changeMonth: true, // 월을 이동하기 위한 선택상자 표시여부
                minDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function (selectedDate) {
                    // 시작일(fromDate) datepicker가 닫힐때
                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#toDate").datepicker("option", "minDate", selectedDate);
                }
            });

            //종료일
            $('#toDate').datepicker({
                showOn: "both",
                buttonImage: "../img/favicon.ico",
                buttonImageOnly: true,
                buttonText: "날짜선택",
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function (selectedDate) {
                    // 종료일(toDate) datepicker가 닫힐때
                    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                    $("#fromDate").datepicker("option", "maxDate", selectedDate);
                }
            });
        });
    </script>
</head>

<body>


    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center" valign="top">
                <table width="815" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="center" valign="top">
                            <table width="800" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="547" height="100" align="left" class="new_tit">
                                        <img src="../img/studium_logo.png" width="80">강사스터디 등록
                                    </td>
                                </tr>
                                <tr>
                                    <FORM NAME="pstudyfrm1" ACTION="<%=request.getContextPath()%>/fstudy/studyAdd"
                                        METHOD="post" enctype="multipart/form-data">
                                        <td align="center">
                                            <table width="100%" border="0" cellspacing="1" cellpadding="7"
                                                bgcolor="#D7D7D7">

                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디타이틀</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF"><INPUT TYPE="text"
                                                            SIZE="30" MAXLENGTH="50" NAME="p_title" required /></td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디이름</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF"><INPUT TYPE="text"
                                                            SIZE="30" MAXLENGTH="50" NAME="p_name" required /></td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디지역</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <select class=input1 name=p_area
                                                            style="width: 120px; height: 30px;">
                                                            <option value=''>지역 선택</option>
                                                            <option value='강남'>강남</option>
                                                            <option value='건대'>건대</option>
                                                            <option value='잠실'>잠실</option>
                                                            <option value='신촌'>신촌</option>
                                                            <option value='분당'>분당</option>
                                                            <option value='수원'>수원</option>
                                                            <option value='남양주'>남양주</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디 요일</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <select class=input1 name=p_day
                                                            style="width: 120px; height: 30px;">
                                                            <option value=''>요일 선택</option>
                                                            <option value='평일'>평일</option>
                                                            <option value='주말'>주말</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">인원</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <INPUT TYPE="number" SIZE="10" min="1" max="15"
                                                            NAME="p_stupyperson" onKeyDown="KeyNumber()" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">분류</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <select class=input1 name=p_category
                                                            style="width: 120px; height: 30px;">
                                                            <option value=''>분류 선택</option>
                                         <% if(!listM.isEmpty()){ %>
										<% for(int j=0;j<listM.size();j++){ %>
                                                         	<option value="<%=listM.get(j).getTitleM() %>"><%=listM.get(j).getTitleM() %></option>
										<% } } %>
                                                        </select>


                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디 소개1</td>

                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <textarea name="p_intro1" id="p_intro1" cols="30"
                                                            rows="10"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디 소개2</td>

                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <textarea name="p_intro2" id="p_intro2" cols="30"
                                                            rows="10"></textarea>
                                                    </td>
                                                </tr>
                                               <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">이미지타이틀</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <INPUT TYPE="file" NAME="p_imgtitle" id="p_imgtitle" size=50 />
                                                         <div id="preview"> </div>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">이미지1</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <INPUT TYPE="file" NAME="p_img1" id="p_img1" size=50 />
                                                         <div id="preview1"> </div>
                                                         </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">이미지2</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <INPUT TYPE="file" NAME="p_img2" id="p_img2" size=50 />
                                                         <div id="preview2"> </div>
                                                        </td>
                                                        
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">이미지3</td>
                                                    <td width="76%"  align="left" bgcolor="#FFFFFF">
                                                        <INPUT TYPE="file" NAME="p_img3" id="p_img3" size=30 />
                                                        <div id="preview3"> </div>
                                                       
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디 시간</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <input type="text" name="p_timestart" placeholder="시간선택"
                                                            id="time1" class="time1" required size="8" maxlength="5">~
                                                        <input type="text" name="p_timeend" placeholder="시간선택"
                                                            class="time1" required size="8" maxlength="5">
                                                        <link rel="stylesheet" type="text/css"
                                                            href="../css/jquery.timepicker.css">
                                                        <script type="text/javascript"
                                                            src="../js/jquery.timepicker.min.js"></script>
                                                </tr>

                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">스터디 날짜</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        오늘 날짜 : <span id="today"></span><br>
                                                        <label for="fromDate">시작일</label>
                                                        <input type="text" name="p_datestart" id="fromDate">
                                                        ~
                                                        <label for="toDate">종료일</label>
                                                        <input type="text" name="p_dateend" id="toDate">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">강사이름</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <INPUT TYPE="text" NAME="p_teachername" size=50 /></td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="left" bgcolor="#EEEEEE">별점</td>
                                                    <td width="76%" align="left" bgcolor="#FFFFFF">
                                                        <span class="star-input">
                                                            <span class="input">
                                                                <input type="radio" name="star-input" value="1" id="p1">
                                                                <label for="p1">1</label>
                                                                <input type="radio" name="star-input" value="2" id="p2">
                                                                <label for="p2">2</label>
                                                                <input type="radio" name="star-input" value="3" id="p3">
                                                                <label for="p3">3</label>
                                                                <input type="radio" name="star-input" value="4" id="p4">
                                                                <label for="p4">4</label>
                                                                <input type="radio" name="star-input" value="5" id="p5">
                                                                <label for="p5">5</label>
                                                            </span>
                                                            <output for="star-input"><b>0</b>점</output>
                                                        </span>


                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan=2 align=center bgcolor="#FFFFFF"><INPUT TYPE="submit"
                                                            VALUE="등록"></td>
                                                </tr>
                                    </FORM>
                                <tr>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script>
        $(".time1").timepicker({
            step: 30, //시간간격 : 30분
            timeFormat: "H:i" //시간:분 으로표시

        });
        /*사진 미리보기 기능  */
		$(function(){
			$("#p_imgtitle").change(function(){
				$("#preview").html("");
				$.each($(this)[0].files,function(i,item){
					var reader=new FileReader();
					reader.onload=function(e){
						var img=$("<img>").attr({"src":e.target.result}).css({"width":"100px","height":"100px"});
						$("#preview").append(img);
					}
					reader.readAsDataURL(item);
				});
			
				
			});
		});
		$(function(){
			$("#p_img1").change(function(){
				$("#preview1").html("");
				$.each($(this)[0].files,function(i,item){
					var reader=new FileReader();
					reader.onload=function(e){
						var img=$("<img>").attr({"src":e.target.result}).css({"width":"100px","height":"100px"});
						$("#preview1").append(img);
					}
					reader.readAsDataURL(item);
				});
			
				
			});
		});
		$(function(){
			$("#p_img2").change(function(){
				$("#preview2").html("");
				$.each($(this)[0].files,function(i,item){
					var reader=new FileReader();
					reader.onload=function(e){
						var img=$("<img>").attr({"src":e.target.result}).css({"width":"100px","height":"100px"});
						$("#preview2").append(img);
					}
					reader.readAsDataURL(item);
				});
			
				
			});
		});
		$(function(){
			$("#p_img3").change(function(){
				$("#preview3").html("");
				$.each($(this)[0].files,function(i,item){
					var reader=new FileReader();
					reader.onload=function(e){
						var img=$("<img>").attr({"src":e.target.result}).css({"width":"100px","height":"100px"});
						$("#preview3").append(img);
					}
					reader.readAsDataURL(item);
				});
			
				
			});
		});
		function convertToTag(textArea) {
			var lines = textArea.value.split("\n");

			// generate HTML version of text
			var resultString = "<p>";
			for (var i = 0; i < lines.length; i++) {
				resultString += lines[i] + "<br />";
			}
			resultString += "</p>";

			return resultString;
		}

    </script>
    <script src="<%=request.getContextPath() %>/js/jquery-1.11.3.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/star.js"></script>

</body>

</html>