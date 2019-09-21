<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member"%>
 <%@ page import="com.studium.category.model.vo.Category,
				java.util.List"%>
<% 
	Member m=(Member)request.getAttribute("member");
	List<Category> listM=(List)request.getAttribute("categoryM");
	List<Category> listB=(List)request.getAttribute("categoryB");

%>

<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}
</style>

	<!--다음 주소 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>


    <div class="section-content">
        <div class="row">
            <div class="col-sm-2">

            </div>
            <div class="col-sm-8 navbar-myMenu" style=" margin-top:20px">
                <div class="myName">
                    <blockquote class="testimonial">
                        <div class="d-flex author">
                            <img src="<%=request.getContextPath()%>/img/3.jpg" alt="" class="mr-4">
                            <div class="author-info">
                                <div>
                                    <h3 class="float-left ">
                                        <%=m.getMemName()%>
                                    </h3>
                                    <div class="btn btn-sm btn-change" style="border:1px solid">사진변경</div>
                                </div>


                                <div style="margin-top:50px">
                                    스타디움은 사람들과 얼굴을 마주하고 오프라인에서 만남을 가지는 모임입니다. 사진을 통해 회원님에 대해 알려주세요. :)
                                </div>
                            </div>
                        </div>
                    </blockquote>
                </div>
                <div class="myInfo">
                    <h5>기본 정보</h5>
                    <div class="row">
                        <div class="col-5">
                            <p class="myI-0">이름</p>
                            <p class="myI-0">이메일</p>
                            <p class="myI-0">비밀번호</p>
                            <p class="myI-0">비밀번호 확인</p>
                            <!--하나라도 null이면 안보이게 처리-->
                              <%if(m.getMemBirth()!=null&&m.getMemPhone()!=null&&m.getMemZipCode()!=null&&m.getMemCategory1()!=null){ %>
                            <p class="myI-0">전화번호</p>
                            <p class="myI-0">생년월일</p>
                            <p class="myI-0-address">주소</p>
                            <p class="myI-0">관심목록</p>
                             <%} %>
                        </div>
                        <div class="col-7">
                            <form action="<%=request.getContextPath() %>/myPage/modifyMember" id="update-member" method="post">
                                <div class="inputForm">
                                    <input type="text" name="name" id="name" class="myI-1-f" autocomplete=off value="<%=m.getMemName()%>" readonly>
                                    <input type="hidden" name="loginMember" value="<%=loginMember.getMemUserEmail()%>">
                                </div>
                                <div class="inputForm">
                                    <input type="email" name="email" id="email" class="myI-1-f" autocomplete=off value="<%=m.getMemUserEmail()%>" readonly>        
                                	<div class="emailcert"><p>이메일 인증하기</p></div>
                                </div>
                                
                                <div class="inputForm">
                                    <input type="password" name="password" id="modipwd" class="myI-1" required>
                                </div>
                                <div class="inputForm">
                                    <input type="password" name="passwordck" id="modipwdck" class="myI-1" required>
                                </div>
                                <%if(m.getMemBirth()!=null&&m.getMemPhone()!=null&&m.getMemZipCode()!=null&&m.getMemCategory1()!=null){ %>
                                <div class="inputForm">
                                    <input type="phone" name="phone" id="phone" class="myI-1" autocomplete=off value="<%=m.getMemPhone()%>" required>
                                </div>
                                <div class="inputForm">
                                    <input type="text" name="birth" id="birth" class="myI-1-f" autocomplete=off value="<%=m.getMemBirth()%>" required>
                                </div>
                               

                                <div class="inputAddress">
                                    <input type="text" id="sample6_postcode" name="zipcode" class="myI-1-add" value="<%=m.getMemZipCode()%>">
                                    <input type="button" onclick="sample6_execDaumPostcode()" class="myI-1-add btn-address" value="우편번호 찾기">
                                    <input type="text" id="sample6_address" name="address1" class="myI-1" value="<%=m.getMemAddress1()%>">
                                    <input type="text" id="sample6_detailAddress" name="address2" class="myI-1" value="<%=m.getMemAddress2()%>">
                                </div>							
                                    <div class="inputInteresting">
								<% if(!listM.isEmpty()&&!listB.isEmpty()){
										
									for(int i=0;i<listB.size();i++){%>
									<div><p><%=listB.get(i).getTitleB()%></p></div>
									
										<% for(int j=0;j<listM.size();j++){
											if(listB.get(i).getCategoryBId().equals(listM.get(j).getCategoryBId())){%>
												<label class="check-label">
		                                        <input type="checkbox" class="option-input checkbox"  name="inter" 
		                                        
		                                        <% if(listM.get(j).getTitleM().equals(m.getMemCategory1())||listM.get(j).getTitleM().equals(m.getMemCategory2())||listM.get(j).getTitleM().equals(m.getMemCategory3())){%>
		                                        checked<%}%>
		                                        id="<%=listM.get(j).getCategoryMId()%>" value="<%=listM.get(j).getTitleM() %>">
		                                        <%=listM.get(j).getTitleM() %>
		                                     </label>
											<%}
										
									}
									
								}
								}%>
                                     <%}else{%>
                                     <div class="myI-1-info">
                                         <div >
                                            <a href="<%=request.getContextPath() %>/myPage/addMyInfo"><img src="<%=request.getContextPath() %>/img/peep.png"></a>
                                   		 </div>
                                      <a href="<%=request.getContextPath() %>/myPage/addMyInfo">입력된 추가정보가 없습니다ㅠㅅ ㅠ <br>추가정보를 입력해주세요!</a>
                                    </div>
                                    <%}%>
                                     <input type="submit" onclick="modifyMember_validate()" class="btn-sm btn-changeInfo" value="수정하기">
                                </div>
                                   

                                </div>
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
                       // document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        //document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
        
        //관심사 개수제한
        $('input[type=checkbox]').on('change', function (e) {
            if ($('input[type=checkbox]:checked').length > 3) {
                $(this).prop('checked', false);
                alert("관심사는 세 개만 선택 가능합니다.");
            }
        });    


        //전화번호 정규표현식
        var regPhone = /^\d{3}\d{3,4}\d{4}$/; 
		// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
        var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

        //회원정보수정 유효성 검사
        function modifyMember_validate() {
        	console.log('함수들어감');
        	//전화번호검사
        	var phone = $('#phone');
        	if(!name.val()) {
        		alert('전화번호를 입력해주세요.');
        		phone.focus();
        		return false;
        	} else {
        		if(!phone.test(phone.val().trim())) {
        			alert('전화번호 형식이 유효하지 않습니다.');
        			phone.focus();
        			return false;
        		}
        	}
        	//전화번호검사
            var phone = $('#phone');
            if (!phone.val()) {
                alert('전화번호를 입력해주세요.');
                phone.focus();
                return false;
            } else {
                if (!regPhone.test(phone.val().trim())) {
                    alert('전화번호 형식이 유효하지 않습니다.');
                    phone.focus();
                    return false;
                }
            }
            //주소
            var postcode = $('#sample6_postcode');
            //상세주소
            var detailAddress = $('#sample6_detailAddress');
            if (!postcode.val()) {
                alert('주소를 입력해주세요.');
                postcode.focus();
                return false;
            }
            if (!detailAddress.val()) {
                alert('상세주소를 입력해주세요.');
                detailAddress.focus();
                return false;
            }

            //관심사 체크여부확인
            if (!$('input:checkbox[name="inter"]').is(":checked")) {
                return false;
            }

        	//비밀번호 검사
        	var pwd = $('#modipwd');
        	if(!pwd.val()) {
        		alert("비밀번호를 입력해주세요.");
        		pwd.focus();
        		return false;
        	} else if(pwd.val().length<8 && pwd.val().length>16){
        		alert("비밀번호가 유효하지 않습니다.\n특수문자 (!@#$%^&+=), 문자 , 숫자를 포함한 \n8~16자리 이내의 비밀번호이어야 합니다.");
        		pwd.focus();
        		return false;
        	} else {
        		if(!regPwd.test(pwd.val().trim())) {
        			alert("비밀번호가 유효하지 않습니다.\n특수문자 (!@#$%^&+=), 문자 , 숫자를 포함한 \n8~16자리 이내의 비밀번호이어야 합니다.");
        			pwd.focus();
        			return false;
        		}
        	}
        	
        	// 비밀번호 일치 확인
        	var pwdck = $('#modipwdck');
        	if(pwd.val()!=pwdck.val()) {
        		alert("비밀번호가 일치하지 않습니다.");
        		pwdck.focus();
        		return false;
        	}
        	
        	//모든사항 통과 
        	return true;
        	
        }
      </script>
</section>

<%@ include file="/views/common/footer.jsp"%>
