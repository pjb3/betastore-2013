class CustomersController < ApplicationController
  skip_before_filter :require_log_in, only: [:new, :create]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to log_in_path, notice: 'Your account was created, please log in'
    else
      render 'new'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email, :password)
  end
end