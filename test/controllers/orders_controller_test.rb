require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "displays checkout form" do
    get :new
    assert_response :success
    assert_select 'form'
    assert_select 'input[type=submit]'
  end

  test "redirects to home page with notice" do
    post :create
    assert_redirected_to root_path
    assert_equal "Your order has been placed", flash[:notice]
  end
end
