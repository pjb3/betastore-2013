class OrdersController < ApplicationController
  skip_before_filter :require_log_in, only: [:new, :create]

  def create
    redirect_to root_path, notice: 'Your order has been placed'
  end
end
