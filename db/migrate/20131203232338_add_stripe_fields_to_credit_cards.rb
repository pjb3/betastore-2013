class AddStripeFieldsToCreditCards < ActiveRecord::Migration
  def change
    change_table :credit_cards do |t|
      t.remove :card_number
      t.remove :cardholder_name

      t.integer :customer_id
      t.string :stripe_token
      t.string :card_type
      t.string :last_4
    end
  end
end
