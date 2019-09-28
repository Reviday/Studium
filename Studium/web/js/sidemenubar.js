$(function() {
	var $window = $(window), 
	$sidemenu = $('.side-menu'), 
	$height = $('section').offset().top+$('section').outerHeight();
	$pageheader = $('.page-header').outerHeight(), 
	$menusize = $('.brand').outerHeight() + $('.menu-list').outerHeight();

	$window.scroll(function() {
		if (($(this).scrollTop() + ($pageheader - 20) + $menusize) <= $height) {
			if ($(this).scrollTop() <= $pageheader) {
				$sidemenu.css("top", "0px");
			} else {
				$sidemenu.css("top", ($(this).scrollTop() - 20) + "px");
			}
		} else {
			$sidemenu.css("top", ($height - $menusize - $pageheader) + "px");
		}
	});
	
	
})