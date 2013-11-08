class OrdersController < ApplicationController
  skip_before_filter :require_log_in, only: [:new, :create]

  def new
    @order = Order.new
    Hash(session[:cart]).each do |pid, qty|
      @order.line_items.build(
        product_id: pid,
        quantity: qty)
    end
  end

  def create
    redirect_to root_path, notice: 'Your order has been placed'
  end
end
