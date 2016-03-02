var Utils = {}

Utils.startMap = function(elementId) {
	var map_canvas = document.getElementById(elementId);
	var geocoder = new google.maps.Geocoder();
	var map = new google.maps.Map(map_canvas, {
		disableDoubleClickZoom: true,
		scrollwheel: false,
		zoom: 15,
		disableDefaultUI: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
	});
	geocoder.geocode({ 'address' : 'Camino Estancia Silva S/N, Gualtallary, Tupungato, Provincia de Mendoza.' }, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			map.setCenter(results[0].geometry.location);
			var marker = new google.maps.Marker({
				map: map,
				position: results[0].geometry.location,
				animation: google.maps.Animation.DROP,
				title: 'Finca Ferrer',
			});
		};
	});
};

Utils.nextSection = function() {
	$('.NextSection').click(function(e) {
		e.preventDefault();
		var $target = $(this).parents('section').first().next();
		$('html, body').stop(true, true).animate({ scrollTop: $target.offset().top });
	});
};

Utils.message = function(text) {
	var $modal = $('#modalGeneric');
	$modal.modal('show').find('p').text(text);
};

Utils.requestProducts = function() {
	$('.request-content').each(function() {
		var $this = $(this);
		var $spans = $this.children('span');
		var $display = $this.closest('.display');
		var $content = $display.next('.content');
		var $container = $content.find('.row');
		var $toggle = $content.find('.toggle-content');
		var is_content_requested = false;
		var is_ajax_active = false;
		var requestContent = function() {
			is_ajax_active = true;
			$.post($this.attr('href'), function(html) {
				is_ajax_active = false;
				is_content_requested = true;
				$container.html(html);
				toggle();
			});
		};
		var toggle = function() {
			$content.stop(true,true).toggle('blind');
			$spans.toggleClass('active');
		};
		$this.add($toggle).click(function(e) {
			e.preventDefault();
			if (is_ajax_active) return;
			if (is_content_requested) toggle();
			else requestContent();
		});
	});
};

Utils.navigation = function() {
	var $body = $('body');
	var $closers = $('header, .page-container');
	var close = function(e) {
		if ($(this).is('.page-container')) e.preventDefault();
		$body.removeClass('navigate');
		$closers.off('click', close);
			console.log('remove');
	};
	var toggle = function(e) {
		e.preventDefault();
		e.stopPropagation();
		$body.toggleClass('navigate');
		if ($body.hasClass('navigate')) {
			console.log('add');
			$closers.on('click', close);
		}
		else {
			console.log('remove');
			$closers.off('click', close);
		}
	};
	$('.toggle-menu a').click(toggle);
};