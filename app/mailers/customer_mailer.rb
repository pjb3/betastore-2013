class CustomerMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Test"
  end
end
