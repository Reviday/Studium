<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.studium.category.model.vo.Category,
				java.util.*"%>
<% 
	List<Category> listM=(List)request.getAttribute("categoryM");

	List<Category> listB=(List)request.getAttribute("categoryB");
	
%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>신청페이지</title>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/img/favicon2.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/nouislider.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/leaderutil.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/leaderForm.css">
	<!--===============================================================================================-->
	    <style>
    	
			.header-background-cover {
				    height: 120px;
    background-color: rgba(0,0,0,0.8);
    margin-bottom: 20px;
			}	
    </style>
</head>

<body>
<%@ include file="/views/common/header.jsp" %>
 <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>  

	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" action="<%=request.getContextPath()%>/insertLeaderForm">
				<span class="contact100-form-title">
					신청 페이지
				</span>

				<div class="wrap-input100 validate-input bg1 rs1-wrap-input100 data-validate=" Please Type Your Name">
					<span class="label-input100">FULL NAME *</span>
					<input class="input100" type="text" name="name" placeholder="Enter Your Name">
				</div>
				
				<div class="wrap-input100 validate-input bg1 rs1-wrap-input100"
					data-validate="Enter Your Email (e@a.x)">
					<span class="label-input100">gender *</span>
					<input class="input-radio100" id="gender1" type="radio" name="gender" value="M">
					<label class="label-radio100" for="gender1">
						Male
					</label>
					<input class="input-radio100" id="gender2" type="radio" name="gender" value="F">
					<label class="label-radio100" for="gender2">
						FeMale
					</label>
				</div>
				<div class="wrap-input100 validate-input bg1 rs1-wrap-input100"
					data-validate="Enter Your Email (e@a.x)">
					<span class="label-input100">Email *</span>
					<input class="input100" type="text" name="email" placeholder="Enter Your Email ">
				</div>

				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<span class="label-input100">Phone</span>
					<input class="input100" type="text" name="phone" placeholder="Enter Number Phone">
				</div>

				<div class="wrap-input100 input100-select bg1">
					<span class="label-input100">Needed leaderType *</span>
					<div>
						<select class="js-select2" name="leaderType">
							<option>Please chooses</option>
							<option value="강사">강사 신청</option>
							<option value="리더">리더 신청</option>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>

				<div class="w-full dis-none js-show-service">
					<div class="wrap-contact100-form-radio">
						<h2>I can work in</h2>
						<div class="contact100-form-radio m-t-15">
							<input class="input-radio100" id="radio1" type="radio" name="area" value="강남"
								checked="checked">
							<label class="label-radio100" for="radio1">
								강남
							</label>
						</div>

						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio2" type="radio" name="area" value="건대">
							<label class="label-radio100" for="radio2">
								건대
							</label>
						</div>
						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio3" type="radio" name="area" value="잠실">
							<label class="label-radio100" for="radio3">
								잠실
							</label>
						</div>
						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio4" type="radio" name="area" value="신촌">
							<label class="label-radio100" for="radio4">
								신촌
							</label>
						</div>
						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio5" type="radio" name="area" value="분당">
							<label class="label-radio100" for="radio5">
								분당
							</label>
						</div>
						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio6" type="radio" name="area" value="수원">
							<label class="label-radio100" for="radio6">
								수원
							</label>
						</div>
						<div class="contact100-form-radio">
							<input class="input-radio100" id="radio7" type="radio" name="area" value="남양주">
							<label class="label-radio100" for="radio7">
								남양주
							</label>
						</div>
					</div>
				
				
				
							  <div class="inputInteresting">
							  	<h2>희망 과목</h2>	
							  	<div id="view"></div>
								<% if(!listM.isEmpty()&&!listB.isEmpty()){
									//m이랑 b랑 비교해서 같은 값 있으면 뿌려주고
									//<%-- for(Category cb : listB){
										
									for(int i=0;i<listB.size();i++){%>
									<div><p><%=listB.get(i).getTitleB()%></p></div>
									
										<% for(int j=0;j<listM.size();j++){
											if(listB.get(i).getCategoryBId().equals(listM.get(j).getCategoryBId())){%>
												<label class="check-label">
		                                        <input type="checkbox" class="option-input checkbox"  name="inter" id="<%=listM.get(j).getCategoryMId()%>" value="<%=listM.get(j).getTitleM() %>">
		                                        <%=listM.get(j).getTitleM() %>
		                                     </label>
											<%}
									}	
								}
								}%>
								
									
                                </div>
						
				</div>
					
					
				<div class="wrap-input100 validate-input bg0 rs1-alert-validate"
					data-validate="Please Type Your Message">
					<span class="label-input100">Message</span>
					<textarea class="input100" name="message" placeholder="하고싶은말을 적어주세요"></textarea>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span>
							Submit
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>


	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/popper.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/select2.min.js"></script>
	<script>
		$(".js-select2").each(function () {
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});


			$(".js-select2").each(function () {
				$(this).on('select2:close', function (e) {
					if ($(this).val() == "Please chooses") {
						$('.js-show-service').slideUp();
					} else {
						$('.js-show-service').slideUp();
						$('.js-show-service').slideDown();
					}
				});
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/moment.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/nouislider.min.js"></script>
	<script>
		var filterBar = document.getElementById('filter-bar');

		noUiSlider.create(filterBar, {
			start: [0, 5000],
			connect: true,
			range: {
				'min': 0,
				'max': 100000
			}
		});

		var skipValues = [
			document.getElementById('value-lower'),
			document.getElementById('value-upper')
		];

		filterBar.noUiSlider.on('update', function (values, handle) {
			skipValues[handle].innerHTML = Math.round(values[handle]);
			$('.contact100-form-range-value input[name="from-value"]').val($('#value-lower').html());
			$('.contact100-form-range-value input[name="to-value"]').val($('#value-upper').html());
		});
	</script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath() %>/js/leaderForm.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
    //관심사 개수제한
    
    
    $('input[type=checkbox]').on('change', function (e) {
		
    	 
    	 if ($('input[type=checkbox]:checked').length > 3) {
            $(this).prop('checked', false);
            $('#view').remove();
            alert("희망과목은 세 개까지만 선택 가능합니다.");
        }
    	
    });
	
							
  	
		window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>
<%@ include file="/views/common/footer.jsp" %>
</body>

</html>