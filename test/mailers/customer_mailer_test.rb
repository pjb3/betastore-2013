require 'test_helper'

class CustomerMailerTest < ActionMailer::TestCase
  test "password_reset" do
    mail = CustomerMailer.password_reset(password_resets(:test))
    assert_equal "Password Reset Instructions", mail.subject
    assert_equal ["test@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match password_resets(:test).token, mail.body.encoded
  end
end
