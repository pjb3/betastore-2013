class LogInsController < ApplicationController
  skip_before_filter :require_log_in

  def create
    customer = Customer.find_by(email: params[:email])
    if customer && customer.authenticate(params[:password])
      cookies.signed[:customer_id] = customer.id
      redirect_to products_path
    else
      redirect_to log_in_path, alert: 'Log In Failed'
    end
  end

  def destroy
    cookies.delete(:customer_id)
    redirect_to products_path
  end
end