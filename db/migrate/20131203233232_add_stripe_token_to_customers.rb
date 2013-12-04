class AddStripeTokenToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :stripe_token, :string
  end
end
