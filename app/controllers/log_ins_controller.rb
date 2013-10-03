class LogInsController < ApplicationController
  skip_before_filter :require_log_in

  def create
    if params[:password].present?
      cookies[:email] = params[:email]
      redirect_to products_path
    else
      redirect_to log_in_path, alert: 'Log In Failed'
    end
  end

  def destroy
    cookies.delete(:email)
    redirect_to products_path
  end
end