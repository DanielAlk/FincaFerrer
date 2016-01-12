class AdminNotifier < ApplicationMailer
  default to: ENV['NOTIFICATIONS_MAILER_TO']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_notifier.contact.subject
  #
  def contacts(contact)
    @contact = contact

    mail subject: "Nuevo Contacto en fincaferrer.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_notifier.newsletter.subject
  #
  def subscribers(subscriber)
    @subscriber = subscriber

    mail subject: "Nueva suscripción a Newsletter en fincaferrer.com"
  end
end
