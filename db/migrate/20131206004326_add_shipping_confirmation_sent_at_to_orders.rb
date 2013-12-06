class AddShippingConfirmationSentAtToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_confirmation_sent_at, :timestamp
  end
end
