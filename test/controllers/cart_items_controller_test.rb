require 'test_helper'

class CartItemsControllerTest < ActionController::TestCase

  test "index be success even if cart is empty" do
    get :index
    assert_response :success
    assert_select 'td.product', :count => 0
  end

  test "index should display cart items" do
    session[:cart] = { products(:test).id.to_s => 1 }
    get :index
    assert_response :success
    assert_select 'td.product', products(:test).name
  end

  test "create adds item to session" do
    post :create, product_id: 99
    assert_redirected_to products_path
    assert_equal 'Product 99 was added to your cart', flash[:notice]
    assert_equal 1, session[:cart]['99']
  end
end
