class ProductsController < ApplicationController
  skip_before_filter :require_log_in

  def index
    @categories = Category.all

    scope = Product

    if params[:min_price].present?
      scope = scope.where('price >= ?', params[:min_price])
    end

    if params[:max_price].present?
      scope = scope.where('price <= ?', params[:min_price])
    end

    if params[:category_id].present?
      scope = scope.in_category(params[:category_id])
    end

    @products = scope.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
