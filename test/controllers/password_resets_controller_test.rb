require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  test "forgot password form" do
    get :new
    Rails.logger.debug @response.body
    assert_response :success
    assert_select 'form[action=/forgot_password]'
    assert_select 'input[name=email]'
  end

  test "forgot password with existing email" do
    assert_difference 'PasswordReset.count' do
      post :create, email: customers(:test).email
    end
    assert_redirected_to '/'
  end

  test "forgot password with non-existent email" do
    assert_no_difference 'PasswordReset.count' do
      post :create, email: 'fail@example.com'
    end
    assert_response :success
    assert_select '.error'
  end
end
