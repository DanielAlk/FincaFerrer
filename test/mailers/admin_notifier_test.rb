require 'test_helper'

class AdminNotifierTest < ActionMailer::TestCase
  test "contacts" do
    mail = AdminNotifier.contacts
    assert_equal "Contacts", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "subscribers" do
    mail = AdminNotifier.subscribers
    assert_equal "Subscribers", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
