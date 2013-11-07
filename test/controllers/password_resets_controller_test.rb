require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  test "forgot password form" do
    get :new
    assert_response :success
    assert_select 'form[action=/forgot_password]'
    assert_select 'input[name=email]'
  end

  test "forgot password with existing email" do
    assert_difference 'PasswordReset.count' do
      post :create, email: customers(:test).email
    end
    assert_redirected_to '/'
    mail = ActionMailer::Base.deliveries.last
    assert mail, 'No email was sent'
    assert_equal [customers(:test).email], mail.to
    assert_equal "Password Reset Instructions", mail.subject
  end

  test "forgot password with non-existent email" do
    assert_no_difference 'PasswordReset.count' do
      post :create, email: 'fail@example.com'
    end
    assert_response :success
    assert_select '.error'
  end

  test "edit with valid id and token" do
    get :edit, id: password_resets(:test).id,
               token: password_resets(:test).token
    assert_response :success
  end

  test "edit with invalid id " do
    get :edit, id: 0, token: 'fail'
    assert_redirected_to forgot_password_path
  end

  test "edit with valid id and invalid token" do
    get :edit, id: password_resets(:test).id,
               token: 'fail'
    assert_redirected_to forgot_password_path
  end

  test "update with valid id and token the password changes" do
    assert customers(:test).authenticate('password')
    post :update, id: password_resets(:test).id,
                  token: password_resets(:test).token,
                  password: 'secret'

    # The database has changes, but this object memory has not
    # Calling reload gets the latest data for this object from the database
    customers(:test).reload

    assert customers(:test).authenticate('secret'),
      "Expected password to be 'secret' but it is not"
    assert_redirected_to log_in_path
  end
end
