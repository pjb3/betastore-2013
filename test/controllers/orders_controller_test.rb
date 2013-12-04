require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "displays checkout form" do
    log_in
    get :new
    assert_response :success
    assert_select 'form'
    assert_select 'button[type=submit]'
  end

  test "redirects to home page with notice" do
    current_customer = log_in
    product = Product.create!(name: 'Test Product', price: 9.99)

    customer = stub(id: 'customer_abc123')

    Stripe::Customer.expects(:create).
      with(
        :card => 'tok_abc123',
        :description => 'test@example.com').
      returns(customer)

    Stripe::Charge.expects(:create).
      with(
        :amount => 999,
        :currency => 'usd',
        :customer => 'customer_abc123')

    post :create,
      stripe_customer_token: 'tok_abc123',
      order: { credit_card_attributes: {
        stripe_token: 'card_abc123',
        card_type: 'Visa',
        last_4: '4242'
      }, line_items_attributes: [
        { product_id: product.id, quantity: 1 }
      ] }
    assert_redirected_to root_path
    assert_equal "Your order has been placed", flash[:notice]
    assert_equal 'customer_abc123', current_customer.reload.stripe_token
  end
end
