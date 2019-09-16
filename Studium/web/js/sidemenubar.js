$(function() {
	var $window = $(window), 
	$sidemenu = $('.side-menu'), 
	$footer = $('footer').offset().top, 
	$pageheader = $('.page-header').outerHeight(), 
	$menusize = $('.brand').outerHeight() + $('.menu-list').outerHeight();

	$window.scroll(function() {
		if (($(this).scrollTop() + ($pageheader - 20) + $menusize) <= $footer) {
			if ($(this).scrollTop() <= $pageheader) {
				$sidemenu.css("top", "0px");
			} else {
				$sidemenu.css("top", ($(this).scrollTop() - 20) + "px");
			}
		} else {
			$sidemenu.css("top", ($footer - $menusize - $pageheader) + "px");
		}
	});
})