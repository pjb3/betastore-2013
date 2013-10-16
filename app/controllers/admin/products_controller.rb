class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product),
                  notice: 'Product was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin_product_path(@product), 
                  notice: 'Product was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @product.destroy
    redirect_to admin_products_url, 
                notice: 'Product was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
