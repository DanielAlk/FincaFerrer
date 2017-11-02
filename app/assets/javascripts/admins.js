var Admin = {};

Admin.init = function() {
	$admin_buttons = $('.admin-buttons').css('display', $.cookie('admin_buttons_display'));
	$('.admin-info').css('cursor', 'pointer').click(function(e) {
		$admin_buttons.toggle(400, function() {
			$.cookie('admin_buttons_display', $admin_buttons.css('display'), { path: '/' });
		});
	});
};

Admin.sortable = function(selector) {
	var $sortable = $(selector);
	$sortable.sortable({
	  placeholder: "ui-state-highlight",
	  update: function(e, ui) {
	    $sortable.sortable('disable');
	    $.ajax({ url: ui.item.data('url'), method: 'PUT', dataType: 'json',
	      data: {
	        branch: {
	          position: ui.item.index() + 1
	        }
	      }
	    })
	    .done(function(response) {
	      //console.info(response);
	    })
	    .fail(function(jqXHR, textStatus, errorThrown) {
	      console.warn(arguments);
	      alert('Error al reordenar.');
	    })
	    .always(function() {
	      $sortable.sortable('enable');
	    });
	  }
	});
};