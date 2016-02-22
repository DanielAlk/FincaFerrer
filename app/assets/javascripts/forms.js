var Forms = {}

Forms.newSubscriber = function(messages) {
	var $form = $('#new_subscriber');
	var $email_field = $('#subscriber_email');

	$form.validate({
		submitHandler: function() {
			$.post($form.attr('action'), $form.serialize(), function(data) {
				Utils.message(messages.success);
				$form.find('label.error').remove();
				$form.get(0).reset();
			}, 'json')
			.fail(function(data) {
				$form.find('label.error').remove();
				if (data && data.responseJSON && data.responseJSON.email) {
					Utils.message(messages.error.unique);
				} else {
					Utils.message(messages.error.unknown);
				}
			});
		}
	});
};

Forms.newContact = function(messages) {
	var $form = $('#new_contact');

	$form.validate({
		submitHandler: function() {
			$.post($form.attr('action'), $form.serialize(), function(data) {
				Utils.message(messages.success);
				$form.find('label.error').remove();
				$form.get(0).reset();
			}, 'json')
			.fail(function(data) {
				$form.find('label.error').remove();
				Utils.message(messages.error);
			});
		}
	});
};