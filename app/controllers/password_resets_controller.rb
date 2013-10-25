class PasswordResetsController < ApplicationController
  skip_before_filter :require_log_in

  def create
    customer = Customer.find_by(email: params[:email])
    if customer
      password_reset = customer.password_resets.build
      password_reset.save!
      redirect_to '/'
    else
      render 'new'
    end
  end
end
