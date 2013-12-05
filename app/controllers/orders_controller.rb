class OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.build_credit_card
    Hash(session[:cart]).each do |pid, qty|
      @order.line_items.build(
        product_id: pid,
        quantity: qty)
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.credit_card.customer = current_customer
    if @order.save

        # Create a Customer
        customer = Stripe::Customer.create(
          :card => params[:stripe_customer_token],
          :description => current_customer.email)

        current_customer.stripe_token = customer.id
        current_customer.save!


        Stripe::Charge.create(
          :amount => @order.total_amount_in_cents,
          :currency => "usd",
          :customer => current_customer.stripe_token)

      redirect_to root_path, notice: 'Your order has been placed'
    else
      flash.now[:alert] = @order.errors.full_messages.join(', ')
      logger.error "errors: #{@order.errors.full_messages.join(', ')}"
      render 'new'
    end
  end

  protected
  def order_params
    params.require(:order).permit(
      credit_card_attributes: [:stripe_token, :card_type, :last_4, :expiration_month, :expiration_year],
      line_items_attributes: [:product_id, :quantity])
  end
end
