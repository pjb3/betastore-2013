class ProductsController < ApplicationController
  skip_before_filter :require_log_in

  def index
    @products = Product.all
  end
end