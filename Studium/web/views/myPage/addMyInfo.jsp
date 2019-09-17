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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>

    <div class="section-content">

        <!--추가정보 받는 div-->
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8 navbar-myMenu" style=" margin-top:20px">
                <div class="addMoreInfo" id="addMoreInfo">
                    <h5>추가 정보를 입력해주세요!</h5>
                    <br>
                    <p>추가정보를 입력하면 더 많은 스터디움의 기능을 누릴 수 있습니다!</p>

                    <div class="row">
                        <div class="col-5">
                            <p class="myI-0">생년월일</p>
                            <p class="myI-0">전화번호</p>
                            <p class="myI-0-address">주소</p>
                            <p class="myI-0">관심사</p>
                        </div>
                        <div class="col-7">
                            <form action="<%=request.getContextPath() %>/myPage/addMoreInformation" id="update-member" method="post">

                                <div class="inputForm">
                                    <input type="text" name="birth" id="phone" class="myI-1" autocomplete=off placeholder="생년월일" required>
                                </div>
                                <div class="inputForm">
                                    <input type="phone" name="phone" id="phone" class="myI-1" autocomplete=off placeholder="전화번호" required>
                                </div>
                                <div class="inputAddress">
                                    <input type="text" id="sample6_postcode" class="myI-1-add" placeholder="우편번호">
                                    <input type="button" onclick="sample6_execDaumPostcode()" class="myI-1-add btn-address" value="우편번호 찾기">
                                    <input type="text" id="sample6_address" class="myI-1" placeholder="주소">
                                    <input type="text" id="sample6_detailAddress" class="myI-1" placeholder="상세주소">
                                </div>
                                <div class="inputInteresting">

                                    <div> <input type="checkbox" id="프라이머리값" name="CB1" value="값넣기">
                                        <label for="프라이머리값">foreignLanguage</label></div>

                                    <div> <input type="checkbox" id="프라이머리값" name="CB2" value="값넣기">
                                        <label for="프라이머리값">programming</label></div>
                                    <div> <input type="checkbox" id="프라이머리값" name="CB3" value="값넣기">
                                        <label for="프라이머리값">공무원</label></div>
                                    <div> <input type="checkbox" id="프라이머리값" name="CB4" value="값넣기">
                                        <label for="프라이머리값">자격증</label></div>
                                    <div> <input type="checkbox" id="프라이머리값" name="CB5" value="값넣기">
                                        <label for="프라이머리값">취준</label></div>

                                </div>

                                <button class="btn-sm btn-withStudium">더 많은 기능 함께하기!</button>


                            </form>
                        </div>
                    </div>

                </div>



            </div>
            <div class="col-sm-2"></div>

        </div>



    </div>



    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        //document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
        
        
        

    </script>





</section>

<%@ include file="/views/common/footer.jsp"%>
