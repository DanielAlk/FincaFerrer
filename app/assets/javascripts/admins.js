var Admin = {};

Admin.init = function() {
	$admin_buttons = $('.admin-buttons').css('display', $.cookie('admin_buttons_display'));
	$('.admin-info').css('cursor', 'pointer').click(function(e) {
		$admin_buttons.toggle(400, function() {
			$.cookie('admin_buttons_display', $admin_buttons.css('display'), { path: '/' });
		});
	});
};