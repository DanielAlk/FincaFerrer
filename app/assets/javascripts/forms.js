var Forms = {}

Forms.newSubscriber = function() {
	var $form = $('#new_subscriber');
	var $email_field = $('#subscriber_email');

	var label = function(text) {
		return $('<label>', {
			id: 'subscriber_email-error',
			for: 'subscriber_email',
			class: 'error',
			text: text,
			style: 'display: inline-block;'
		});
	};

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