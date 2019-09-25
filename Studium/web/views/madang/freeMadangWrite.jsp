<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<!-- Smart Editor2 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<style>
#madang_writer {
	margin: 0;
	padding: 0;
}

ul, li, ol, dl {
	list-style: none;
}

#madang_writer ul.none_style {
	list-style: none;
}

#madang_writer ul, #madang_writer td, #madang_writer input,
	#madang_writer textarea {
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum,
		sans-serif;
}

#madang_writer div, #madang_writer ul, #madang_writer td, #madang_writer input,
	#madang_writer textarea {
	font-size: 12px;
	color: #333333;
}

#madang_writer ul.subject {
	overflow: hidden;
	width: 740px;
}

#madang_writer ul.subject li {
	position: relative;
	width: 740px;
	margin: 0 0 9px 0;
}

#madang_writer .post_subject {
	z-index: 2;
}

#madang_writer ul.subject .item {
	position: absolute;
	left: 0;
	top: 5px;
	width: 68px;
	font-weight: bold;
	color: #444444;
	font-size: 12px;
}

#madang_writer ul.subject .box_input {
	width: 478px;
	height: 21px;
	padding: 3px 0 0 3px;
	color: #8C8C8C;
	font-size: 12px;
	border: 1px solid #A7A7A7;
	border-bottom: 1px solid #D8D8D8;
	border-right: 1px solid #D8D8D8;
	background-color: #FBFBFB;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

#madang_writer ul.subject .item {
	top: 3px;
}

#madang_writer ul.subject .item {
	position: absolute;
	left: 0;
	top: 5px;
	width: 68px;
	font-weight: bold;
	color: #444444;
	font-size: 12px;
}

#madang_writer ul.subject div {
	padding: 0 0 0 68px;
}

#madang_writer .file_attach_menu ul {
	float: left;
	width: 670px;
	height: 20px;
	_height: 25px;
}

#madang_writer .file_attach_menu li {
	float: left;
	width: auto !important;
	padding: 0 3px 0 4px;
	background: url(https://cafe.pstatic.net/editor/icon/line_v_bar.gif) 0
		6px no-repeat;
	color: #D1D1D1;
	font-size: 11px;
}

#madang_writer .file_attach_menu li a {
	padding: 5px 0 2px 17px;
	_padding: 5px 0 0 17px;
	margin: 0 6px 0 7px;
	color: #222;
	display: inline-block;
	height: 20px;
}

#madang_writer .file_attach_menu .ico_file {
	padding-left: 15px;
	background: url(https://cafe.pstatic.net/editor/icon/ico_file2.gif) 0
		5px no-repeat;
}

#fileDB:after {
	content: "";
	display: block;
	clear: both;
}
</style>
</head>
<section id="madang_writer">
	<div class="madang-list mldiv">
		<div class="sub-tit row mldiv">
			<div class="title-area mldiv">
				<h3 class="list-title">자유마당</h3>
				<p class="list-sub">자유롭게 글을 올리는 공간입니다.</p>
			</div>
		</div>
	</div>
	<hr />
	<form action="<%=request.getContextPath()%>/" method="post"
		id="write_frm">
		<ul class="subject">
			<li class="post_subject"><label class="item" for="subject">제목</label>
				<div>
					<input type="text" name="subject" value="게시글 제목을 입력하세요"
						id="subject" class="box_input">
				</div></li>
			<li id="file_attach_menu" class="file_attach_menu"><label
				class="item">파일첨부</label>
				<div id="fileDB">
					<ul>
						<li id="iFile"><a
							onclick="popFile('hacosa', '12566436');clickcr(this, 'wrt.file', '', '', event);return false;"
							class="ico_file" href="#"><strong>파일</strong></a></li>

					</ul>
				</div></li>
		</ul>




		<textarea name="smarteditor" id="smarteditor" rows="10" cols="100"
			style="width: 766px; height: 466px;"> </textarea>


		<input type="submit" id="savebutton" value="확인">
	</form>
</section>


<script type="text/javascript">
      
   $(document).ready(function() { var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함. 
   
      // Editor Setting
      nhn.husky.EZCreator.createInIFrame({ 
         oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
         elPlaceHolder : "smarteditor", // 에디터가 그려질 textarea ID 값과 동일 해야 함. 
         sSkinURI : "<%=request.getContextPath()%>
	/SE2/SmartEditor2Skin.html", // Editor HTML 
									fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
									htParams : {
										// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
										bUseToolbar : true,
										// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
										bUseVerticalResizer : true,
										// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
										bUseModeChanger : true,
									}
								});

						// 전송버튼 클릭이벤트 
						$("#savebutton").click(
								function() {
									//if(confirm("저장하시겠습니까?")) { 
									// id가 smarteditor인 textarea에 에디터에서 대입 
									oEditors.getById["smarteditor"].exec(
											"UPDATE_CONTENTS_FIELD", []);

									// 이부분에 에디터 validation 검증 
									if (validation()) {
										$("#frm").submit();
									}
									//} 
								})
					});

	// 필수값 Check 
	function validation() {
		var contents = $.trim(oEditors[0].getContents());
		if (contents === '<p>&bnsp;</p>' || contents === '') { // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}
		return true;
	}
</script>