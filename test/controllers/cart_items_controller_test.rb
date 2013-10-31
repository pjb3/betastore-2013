require 'test_helper'

class CartItemsControllerTest < ActionController::TestCase
  test "create adds item to session" do
    post :create, product_id: 99
    assert_redirected_to products_path
    assert_equal 'Product 99 was added to your cart', flash[:notice]
    assert_equal 1, session[:cart]['99']
  end
end
