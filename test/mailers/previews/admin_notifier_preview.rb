# Preview all emails at http://localhost:3000/rails/mailers/admin_notifier
class AdminNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_notifier/contacts
  def contacts
    AdminNotifier.contacts(Contact.first)
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_notifier/subscribers
  def subscribers
    AdminNotifier.subscribers(Subscriber.first)
  end

end
