class CustomerMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(password_reset)
    @password_reset = password_reset
    @url = reset_password_url(id: @password_reset.id, token: @password_reset.token)
    mail to: password_reset.customer.email,
         subject: "Password Reset Instructions"
  end
end
