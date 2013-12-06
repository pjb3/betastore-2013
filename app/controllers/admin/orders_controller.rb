class Admin::OrdersController < ApplicationController
  before_filter :load_order, :only => [:show, :edit, :update, :destroy]

  def index
    @orders = Order.order('placed_at desc').page(params[:page])
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to admin_order_path(@order), notice: "Order ##{@order.id} was updated"
    else
      render 'edit'
    end
  end

  protected
  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:tracking_number)
  end
end
