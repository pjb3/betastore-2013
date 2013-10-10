class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_filter :require_log_in

  protected
  def require_log_in
    redirect_to '/log_in' unless logged_in?
  end

  helper_method :logged_in?
  def logged_in?
    cookies.signed[:customer_id].present?
  end
end