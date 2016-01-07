var Forms = {}

Forms.newSubscriber = function() {
	var $form = $('#new_subscriber');
	var $email_field = $('#subscriber_email');

	$form.validate({
		submitHandler: function() {
			$.post($form.attr('action'), $form.serialize(), function(data) {
				Utils.message('Gracias por subscribirte a nuestra Newsletter');
				$form.find('label.error').remove();
				$form.get(0).reset();
			}, 'json')
			.fail(function(data) {
				$form.find('label.error').remove();
				if (data && data.responseJSON && data.responseJSON.email) {
					Utils.message('El email que has ingresado ya esta subscripto al Newsletter');
				} else {
					Utils.message('Ocurrió un error, intenta de nuevo más tarde.');
				}
			});
		}
	});
};

Forms.newContact = function() {
	var $form = $('#new_contact');

	$form.validate({
		submitHandler: function() {
			$.post($form.attr('action'), $form.serialize(), function(data) {
				Utils.message('Gracias por contactarte con nosotros');
				$form.find('label.error').remove();
				$form.get(0).reset();
			}, 'json')
			.fail(function(data) {
				$form.find('label.error').remove();
				Utils.message('Ocurrió un error, intenta de nuevo más tarde.');
			});
		}
	});
};