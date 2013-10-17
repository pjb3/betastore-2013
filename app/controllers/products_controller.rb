class ProductsController < ApplicationController
  skip_before_filter :require_log_in

  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.rss
    end
  end
end
