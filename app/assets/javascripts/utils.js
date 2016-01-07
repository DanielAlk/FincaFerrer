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
	geocoder.geocode({ 'address' : 'Avenida Sucre 2074, Beccar, Buuenos Aires, Argentina.' }, function(results, status) {
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