(function ($) {

  'use strict';

  // bootstrap dropdown hover



  // loader
  var loader = function () {
    setTimeout(function () {
      if ($('#loader').length > 0) {
        $('#loader').removeClass('show');
      }
    }, 1);
  };
  loader();




  $('#dropdown04').on('show.bs.dropdown', function () {
    console.log('show');
  });

  // home slider
  $('.home-slider').owlCarousel({
    loop: true,
    autoplay: true,
    margin: 0,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    nav: true,
    autoplayHoverPause: true,
    items: 1,
    navText: ["<span class='ion-chevron-left'></span>", "<span class='ion-chevron-right'></span>"],
    responsive: {
      0: {
        items: 1,
        nav: false
      },
      600: {
        items: 1,
        nav: false
      },
      1000: {
        items: 1,
        nav: true
      }
    }
  });

  $('.home-slider-loop-false').owlCarousel({
    loop: false,
    autoplay: true,
    margin: 0,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    nav: true,
    autoplayHoverPause: true,
    items: 1,
    navText: ["<span class='ion-chevron-left'></span>", "<span class='ion-chevron-right'></span>"],
    responsive: {
      0: {
        items: 1,
        nav: false
      },
      600: {
        items: 1,
        nav: false
      },
      1000: {
        items: 1,
        nav: true
      }
    }
  });

  // owl carousel
  var majorCarousel = $('.js-carousel-1');
  majorCarousel.owlCarousel({
    loop: true,
    autoplay: true,
    stagePadding: 7,
    margin: 20,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    nav: true,
    autoplayHoverPause: true,
    items: 3,
    navText: ["<span class='ion-chevron-left'></span>", "<span class='ion-chevron-right'></span>"],
    responsive: {
      0: {
        items: 1,
        nav: false
      },
      600: {
        items: 2,
        nav: false
      },
      1000: {
        items: 3,
        nav: true,
        loop: false
      }
    }
  });

  // owl carousel
  var major2Carousel = $('.js-carousel-2');
  major2Carousel.owlCarousel({
    loop: true,
    autoplay: true,
    stagePadding: 7,
    margin: 20,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    nav: true,
    autoplayHoverPause: true,
    items: 4,
    navText: ["<span class='ion-chevron-left'></span>", "<span class='ion-chevron-right'></span>"],
    responsive: {
      0: {
        items: 1,
        nav: false
      },
      600: {
        items: 3,
        nav: false
      },
      1000: {
        items: 4,
        nav: true,
        loop: false
      }
    }
  });


  $('.centernonloop').owlCarousel({
    center: true,
    items: 1,
    loop: false,
    margin: 10,
    dots: true,
    responsive: {
      600: {
        items: 3
      }
    }
  });


  var contentWayPoint = function () {
    var i = 0;
    $('.element-animate').waypoint(function (direction) {

      if (direction === 'down' && !$(this.element).hasClass('element-animated')) {

        i++;

        $(this.element).addClass('item-animate');
        setTimeout(function () {

          $('body .element-animate.item-animate').each(function (k) {
            var el = $(this);
            setTimeout(function () {
              var effect = el.data('animate-effect');
              if (effect === 'fadeIn') {
                el.addClass('fadeIn element-animated');
              } else if (effect === 'fadeInLeft') {
                el.addClass('fadeInLeft element-animated');
              } else if (effect === 'fadeInRight') {
                el.addClass('fadeInRight element-animated');
              } else {
                el.addClass('fadeInUp element-animated');
              }
              el.removeClass('item-animate');
            }, k * 100);
          });

        }, 100);

      }

    }, {
      offset: '95%'
    });
  };
  contentWayPoint();



})(jQuery);


// 스크롤 시 메뉴 
$(function () {
  var $window = $(window),
    $header = $('.page-header'),
    $headerClone = $header.contents().clone(),
    // $headerClone = $header.clone(),
    $headerCloneContainer = $('<div class="page-header-clone"></div>')
    // 메뉴가 중간에 있을 경우,
    $threshold = $header.offset().top + $header.outerHeight();
    // 메뉴가 상단에 있으므로,
    // $threshold = $header.outerHeight();

    //A.append(B)
    $headerCloneContainer.append($headerClone);
    //A.appendTo(B)
    $headerCloneContainer.appendTo('body');

    $window.scroll(function () {
      if ($(this).scrollTop() >= $threshold) {
        $headerCloneContainer.addClass('visible');
      } else {
        $headerCloneContainer.removeClass('visible');
    }
  });

  $('nav .dropdown').hover(function () {
    var $this = $(this);
    $this.addClass('show');
    $this.find('> a').attr('aria-expanded', true);
    $this.find('.dropdown-menu').addClass('show');
  }, function () {
    var $this = $(this);
    $this.removeClass('show');
    $this.find('> a').attr('aria-expanded', false);
    $this.find('.dropdown-menu').removeClass('show');
  });
});


// 모달창
$(function () {
	// 로그인 모달창
	var logflag = true;
	$("#logbtn-open-dialog,#log-dialog-background,#btn-close-dialog").click(function () {
		$("#my-log-dialog, #log-dialog-background").toggle();
		$('.input-area input').val('');
		$('.input-area input').removeClass("focus");
		if(logflag) {
			$('html').css("overflow","hidden");
			logflag=false;
		} else {
			$('html').css("overflow","visible");
			logflag=true;
		}
	});
	
	// 회원가입 모달창
	var regflag = true;
	$("#regbtn-open-dialog,#reg-dialog-background,#btn-close-dialog").click(function () {
		$("#my-reg-dialog,#reg-dialog-background").toggle();
		$('.input-area input').val('');
		$('.input-area input').removeClass("focus");
		if(regflag) {
			$('html').css("overflow","hidden");
			regflag=false;
		} else {
			$('html').css("overflow","visible");
			regflag=true;
		}
	});
});

// 로그인 창 
$(".input-area input").on("focus",function() {
  $(this).addClass("focus");
});

$(".input-area input").on("blur",function() {
  if($(this).val() == "")
  $(this).removeClass("focus");
});


//회원가입 체크사항
// 약관 체크  flag
var confirmed = false;
// 이름 정규식(한글이름, 영문이름)
var regName = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 정규식
var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

//약관체크
$(".confirmed #mark").click(function() {
	$('.required-ck').hide(); 
	$('.confirmed').css("border","1px solid #ccc");
	if (confirmed) {
		confirmed = false;
		console.log('unchecked');
		$('.confirmed #mark').removeClass('checked');
	} else {
		confirmed = true;
		$('.confirmed #mark').addClass('checked');
		console.log('checked');
	}
})

// Validate
function registation_validate() {
	//정규표현식을 적용해서 유효성검사
	
	//이름 검사
	var name = $('#name');
	if(!name.val()) {
		alert('이름을 입력해주세요.');
		name.focus();
		return false;
	} else {
		if(!regName.test(name.val().trim())) {
			alert('이름이 유효하지 않습니다.');
			name.focus();
			return false;
		}
	}
	
	//이메일 검사
	var email = $('#email');
	if(!email.val()) { // 이메일란이 공백일 경우
		alert('이메일 주소를 입력해주세요.');
		email.focus(); // 이메일 입력란으로 focus (왜  이메일은 포커스 이동이 안되지?)
		return false;
	} else {
		if(!regEmail.test(email.val().trim())) {
			alert('이메일 주소가 유효하지 않습니다.');
			email.focus();
			return false;
		}
	}
	
	//비밀번호 검사
	var pwd = $('#pwd');
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
	var pwdck = $('#pwdck');
	if(pwd.val()!=pwdck.val()) {
		alert("비밀번호가 일치하지 않습니다.");
		pwdck.focus();
		return false;
	}
	
	// 약관 동의 체크
	if(!confirmed) {
		console.log(confirmed);
		$('.confirmed').css("border","1px solid #e74c3c");
		$('.required-ck').show();
		return false;
	}
	
	// 모든 확인사항 통과
	return true;
};



	
